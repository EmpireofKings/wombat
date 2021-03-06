/*******************************************************************************
*   Axolotl -- Open-Source Infotainment and Black Box for NVIDIA Jetson TX2
*   Copyright (C) 2018 by Team Wombat
*   Victor Li <livic@oregonstate.edu>
*   Nick Wong <wongnich@oregonstate.edu>
*   Ryan Crane <cranery@oregonstate.edu>
*
*   This file is part of Axolotl.
*
*   Axolotl is free software: you can redistribute it and/or modify
*   it under the terms of the GNU General Public License as published by
*   the Free Software Foundation, either version 3 of the License, or
*   (at your option) any later version.
*
*   Axolotl is distributed in the hope that it will be useful,
*   but WITHOUT ANY WARRANTY; without even the implied warranty of
*   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
*   GNU General Public License for more details.
*
*   You should have received a copy of the GNU General Public License
*   along with Axolotl.  If not, see <http://www.gnu.org/licenses/>.
*   @license GPL-3.0+ <http://spdx.org/licenses/GPL-3.0+>
*******************************************************************************/

/* ------------------------------------
   Dashcam Daemon
   ------------------------------------
   Background process that logs dashcam data and manages the backup camera.
*/

#include "dcomh.hpp"

#include <stdio.h>
#include <unistd.h>
#include <sys/socket.h>
#include <bluetooth/bluetooth.h>
#include <bluetooth/rfcomm.h>

#include <fstream>

#define FRONT_CAM_BT_ADDR "B8:27:EB:FE:1C:65"
#define REAR_CAM_BT_ADDR "B8:27:EB:59:5E:00"
#define FRONT_CAMERA_HELPER_NAME "./front_cam_helper"
#define REAR_CAMERA_HELPER_NAME "./rear_cam_helper"
#define BACKUP_CAMERA_HELPER_NAME "./backup_cam_helper"

#define FRONT_CAMERA_PORT "9001"
#define REAR_CAMERA_PORT "9002"
#define BACKUP_CAMERA_PORT "9003"

#define COMMAND_RECORD_FRONT "f"
#define COMMAND_RECORD_REAR "r"
#define COMMAND_WATCH "w"

#define AUTO_MEMORY_MANAGEMENT_MODE 0   // set to 1 if auto-delete of old footage desired
#define CONTINUOUS_OPTIMIZATION
//#define REAR_CAMERA

using namespace std;

string logging_directory, front_cam_bt_addr_f, rear_cam_bt_addr_f;
bool logging_active = true;
bool backup_camera_active = false, front_cam_bt_active = false, rear_cam_bt_active = false;

pid_t dashcam_helper_0_pid = -5, dashcam_helper_1_pid = -5, b_camera_helper_pid = -5, gpio_watcher_pid = -5;

int front_dashcam_bluetooth_socket, rear_dashcam_bluetooth_socket;   // bluetooth file descriptors for front and rear dashcams

string auto_mem = "0";

/*
  Optimize storage by deleting all past days' data.
*/
void optimizeStorage() {
  if(auto_mem == "1") {
    // deletes the oldest data log within the ~/axolotl/data directory
    system("rm -rf \"$(ls -t /home/nvidia/axolotl/data | tail -1)\"");
    system("echo \"Warning: not enough storage space for dashcam footage. Deleting oldest log.\" >> ~/axolotl/debug");
  }
}

/*
  Makes a bluetooth connection, storing info for accessing into a file descriptor by address.
*/
bool connectBluetooth(string bluetoothAddress, int *fd) {
  int status;   // to hold connection status based on connect() call
  char *dest = (char *)bluetoothAddress.c_str();    // get the supplied address and cast to c string
  string debug_string;

  // allocate bluetooths ocket
  *fd = socket(AF_BLUETOOTH, SOCK_STREAM, BTPROTO_RFCOMM);

  // set bluetooth connection parameters
  struct sockaddr_rc addr = { 0 };
  addr.rc_family = AF_BLUETOOTH;
  addr.rc_channel = (uint8_t) 1;
  str2ba( dest, &addr.rc_bdaddr );

  // connect to the raspberrypi, saving connection into a global file descriptor
  // will attempt for 10 seconds before giving up
  status = connect(*fd, (struct sockaddr *)&addr, sizeof(addr));
  int attempts = 0;
  while ((status != 0) && (attempts < 10)) {
    sleep(1);
    attempts += 1;
    debug_string = "echo \"Error: bluetooth connection to " + bluetoothAddress + " failed. Retrying. Attempt: " + to_string(attempts) + "\" >> ~/axolotl/debug";
    system(debug_string.c_str());
    status = connect(*fd, (struct sockaddr *)&addr, sizeof(addr));
  }

  // If failed connection attempts, say so in debug file
  if ((attempts > 0) && (status != 0)) {
    debug_string = "echo \"Error: failed to connected to " + bluetoothAddress + " after " + to_string(attempts) + " tries.\" >> ~/axolotl/debug";
    system(debug_string.c_str());
  }
  else if ((attempts > 0) && (status == 0)) {
    debug_string = "echo \"Warning: connected to " + bluetoothAddress + " after " + to_string(attempts) + " tries.\" >> ~/axolotl/debug";
    system(debug_string.c_str());
  }

  // return true or false based on connection status
  if (status == 0) {
    return true;
  }
  return false;
}

/*
  Use an active bluetooth file descriptor to send a command.
*/
void sendBluetoothCommand(int fd, char command) {
  int status = 0;

  // send the command, saving our status
  status = write(fd, &command, 1);

  // ensure that our command is sent by looping until we have a good return status
  while (status < 0) {
    status = write(fd, &command, 1);
  }
}

/*
  Main program loop for dashcams.
*/
void cameraLoop() {
  if(logging_active) {
    if(front_cam_bt_active) {
      sendBluetoothCommand(front_dashcam_bluetooth_socket,'s');
    }
    else {
      system("echo \"Error: could not connect to front camera controller. Front camera logging disabled.\" >> ~/axolotl/debug");
    }
    if(rear_cam_bt_active) {
      #ifdef REAR_CAMERA
      sendBluetoothCommand(rear_dashcam_bluetooth_socket,'s');
      #endif
    }
    else {
      system("echo \"Error: could not connect to rear camera controller. Rear camera logging and backup camera disabled.\" >> ~/axolotl/debug");
    }
    while(axolotlFileSystem::getAvailableMemory(logging_directory) < 2048) {   // wait until we have > 2GB storage
        optimizeStorage();    // attempt to optimize storage space if we don't have enough
    }
    if (dashcam_helper_0_pid == -5) {
	     dashcam_helper_0_pid = fork();    // fork the front camera helper
    }
    if(dashcam_helper_0_pid == 0) {
      if (front_cam_bt_active) {
        char *args[] = {(char *)FRONT_CAMERA_HELPER_NAME, (char *)FRONT_CAMERA_PORT, (char *)COMMAND_RECORD_FRONT, (char *)logging_directory.c_str(), NULL};
        execv("record_helper",args);
      }
    }
    else {
      // rear camera logging disabled for now
      #ifdef REAR_CAMERA
      dashcam_helper_1_pid = fork();
      if (dashcam_helper_1_pid == 0) {
        if (rear_cam_bt_active) {
          char *args2[] = {(char *)REAR_CAMERA_HELPER_NAME, (char *)REAR_CAMERA_PORT, (char *)COMMAND_RECORD_REAR, (char *)logging_directory.c_str(), NULL};
          execv("record_helper",args2);
        }
      }
      else {
        while(1) {
          // wait indefinitely...
        }
      }
      #endif

      while(1) {
        // continuously clear memory on storage volume
        #ifdef CONTINUOUS_OPTIMIZATION
        while(axolotlFileSystem::getAvailableMemory(logging_directory) < 2048) {
            optimizeStorage();
        }
        #endif
      }
    }
  }

  // infinite loop to keep this process from going defunct
  while(1) {

  }
}

/*
  Kills all of the gstreamer processes, dashcam helpers, and record programs.
*/
void killAllHelpers() {
  int status;   // holds our waitpid status

  // kill all of our gst-launch processes and helpers
  system("killall -SIGINT gst-launch-1.0");
  system("killall record_helper");
  system("pkill -SIGINT gst-launch-1.0");
  system("pkill record_helper");
  if(backup_camera_active) {
    system("killall backup_cam_helper");
  }

  // kill front camera process helper and reset its pid var
  if((dashcam_helper_0_pid != -5) && (dashcam_helper_0_pid > 1)) {
    kill(dashcam_helper_1_pid,SIGKILL);
    waitpid(dashcam_helper_1_pid, &status, -1);
  }
  dashcam_helper_0_pid = -5;

  // kill rear camera process helper and reset its pid var
  if((dashcam_helper_1_pid != -5) && (dashcam_helper_1_pid > 1)) {
    kill(dashcam_helper_1_pid,SIGKILL);
    waitpid(dashcam_helper_1_pid, &status, -1);
  }
  dashcam_helper_1_pid = -5;

  // kill backup camera process helper and reset its pid var
  if(backup_camera_active) {
    if(b_camera_helper_pid > 1) {
      kill(b_camera_helper_pid,SIGKILL);
      waitpid(b_camera_helper_pid, &status, -1);
    }
    b_camera_helper_pid = -5;

    // kill any camera processes running on the backup camera port
    system("pkill -f port=9003");
  }

}

/*
  Kills all cameras, send kill command to the raspberrypi.
  Closes file descriptors to bluetooth sockets and exits cleanly.
*/
void killCamerasHandler(int signumber, siginfo_t *siginfo, void *pointer) {
  // signal cameras to quit
  if(front_cam_bt_active) {
    sendBluetoothCommand(front_dashcam_bluetooth_socket,'q');
    system("echo \"Debug: attempting to kill front camera.\" >> ~/axolotl/debug");
  }
  if(rear_cam_bt_active) {
    sendBluetoothCommand(rear_dashcam_bluetooth_socket,'q');
    system("echo \"Debug: attempting to kill rear camera.\" >> ~/axolotl/debug");
  }

  // close bluetooth sockets
  close(front_dashcam_bluetooth_socket);
  close(rear_dashcam_bluetooth_socket);

  // kill all camera helper processes
  killAllHelpers();

  // kill gpio watcher process if there's one active
  int status;
  if(gpio_watcher_pid > 1) {
    kill(gpio_watcher_pid,SIGKILL);
    waitpid(gpio_watcher_pid,&status,-1);
  }

  // exit cleanly
  exit(0);
}

/*
  Registers the kill handler with SIGTERM.
*/
void registerKillCamerasHandler() {
  static struct sigaction dsa;
  memset(&dsa, 0, sizeof(dsa));
  dsa.sa_sigaction = killCamerasHandler;
  dsa.sa_flags = SA_SIGINFO;
  sigaction(SIGTERM, &dsa, NULL);
}

/*
  Turns logging off.
*/
void toggleOffHandler(int signumber, siginfo_t *siginfo, void *pointer) {
  logging_active = false;

  // pause cameras if they are connected via bluetooth
  if(front_cam_bt_active) {
    sendBluetoothCommand(front_dashcam_bluetooth_socket,'p');
  }
  if(rear_cam_bt_active) {
    sendBluetoothCommand(rear_dashcam_bluetooth_socket,'p');
  }
  killAllHelpers();
}

/*
  Registers the toggle off handler with SIGUSR1.
*/
void registerToggleOffHandler() {
  static struct sigaction dsa;
  memset(&dsa, 0, sizeof(dsa));
  dsa.sa_sigaction = toggleOffHandler;
  dsa.sa_flags = SA_SIGINFO;
  sigaction(SIGUSR1, &dsa, NULL);
}

/*
  Turns logging on.
*/
void toggleOnHandler(int signumber, siginfo_t *siginfo, void *pointer) {
  char *args[] = {(char *)FRONT_CAMERA_HELPER_NAME, (char *)FRONT_CAMERA_PORT, (char *)COMMAND_RECORD_FRONT, (char *)logging_directory.c_str(), NULL};
  logging_active = true;

  // signal cameras to start
  if(front_cam_bt_active) {
    sendBluetoothCommand(front_dashcam_bluetooth_socket,'s');
  }
  if(rear_cam_bt_active) {
    #ifdef REAR_CAMERA
    sendBluetoothCommand(rear_dashcam_bluetooth_socket,'s');
    #endif
  }

  // clear out some memory if we don't have enough
  if(axolotlFileSystem::getAvailableMemory(logging_directory) < 2048) {   // wait until we have > 2GB storage
    optimizeStorage();    // attempt to optimize storage space if we don't have enough
  }
  dashcam_helper_0_pid = fork();    // fork the front camera helper
  if(dashcam_helper_0_pid == 0) {
    if (front_cam_bt_active) {   // exec the record helper
      execv("record_helper",args);
    }
  }
  else {
    #ifdef REAR_CAMERA
    dashcam_helper_1_pid = fork();    // fork the rear camera helper
    if (dashcam_helper_1_pid == 0) {
      if (rear_cam_bt_active) {
        char *args2[] = {(char *)REAR_CAMERA_HELPER_NAME, (char *)REAR_CAMERA_PORT, (char *)COMMAND_RECORD_REAR, (char *)logging_directory.c_str(), NULL};
        execv("record_helper",args2);   // exec the record helper
      }
    }
    else {

    }
    #endif
  }
}

/*
  Registers the toggle handler with SIGUSR2.
*/
void registerToggleOnHandler() {
  static struct sigaction dsa;
  memset(&dsa, 0, sizeof(dsa));
  dsa.sa_sigaction = toggleOnHandler;
  dsa.sa_flags = SA_SIGINFO;
  sigaction(SIGUSR2, &dsa, NULL);
}

/*
  Starts the backup camera process, forcing it to display over the UI.
*/
void backupCameraToggleHandler(int signumber, siginfo_t *siginfo, void *pointer) {
  int status;
  backup_camera_active = !backup_camera_active;
  char *args[] = {(char *)BACKUP_CAMERA_HELPER_NAME, (char *)BACKUP_CAMERA_PORT, (char *)COMMAND_WATCH, (char *)logging_directory.c_str(), NULL};

  // send a bluetooth signal to toggle the camera
  sendBluetoothCommand(rear_dashcam_bluetooth_socket,'b');

  // turn camera on or off based on its current state
  if(backup_camera_active) {
    if(b_camera_helper_pid == -5) {
      b_camera_helper_pid = fork();
      if(b_camera_helper_pid == 0) {
        execv("backup_cam_helper",args);
      }
    }
  }
  else {
    // fulfill FMVSS by waiting 5 sec to kill backup camera after shifting out of reverse
    sleep(5);

    // kill the camera if the pid is active
    if(b_camera_helper_pid > 1) {
      kill(b_camera_helper_pid,SIGKILL);
      waitpid(b_camera_helper_pid, &status, -1);
    }
    b_camera_helper_pid = -5;

    // kill the gstreamer process associated with the stream
    system("pkill -SIGINT -f port=9003");
  }
}

/*
  Registers the kill handler with SIGBUS.
*/
void registerBackupCameraHandler() {
  static struct sigaction dsa;
  memset(&dsa, 0, sizeof(dsa));
  dsa.sa_sigaction = backupCameraToggleHandler;
  dsa.sa_flags = SA_SIGINFO;
  sigaction(SIGBUS, &dsa, NULL);
}

int main(int argc, char *argv[]) {
  // Ensure that a logging directory has been provided and bind it
  logging_directory = argv[1];
  string ahrs_filepath = logging_directory + "/ahrs_log.csv";

  // get memory management type from args
  auto_mem = argv[2];

  // Wait on AHRS to complete connection
  struct stat buffer;
  while(stat(ahrs_filepath.c_str(), &buffer) != 0) {
    sleep(1);
  }

  // Get bluetooth addresses from file or resort to default bluetooth addresses
  ifstream bt_addr_file;
  bt_addr_file.open("bluetooth_addresses");
  if(bt_addr_file.is_open()) {
    getline(bt_addr_file,front_cam_bt_addr_f);
    getline(bt_addr_file,rear_cam_bt_addr_f);
    bt_addr_file.close();
    cout << front_cam_bt_addr_f << " && " << rear_cam_bt_addr_f << endl;
  }
  else {
    front_cam_bt_addr_f = FRONT_CAM_BT_ADDR;
    rear_cam_bt_addr_f = REAR_CAM_BT_ADDR;
  }

  string debug_command;

  // Pair with front camera RPi
  bool bt_connect;
  bt_connect = connectBluetooth(front_cam_bt_addr_f, &front_dashcam_bluetooth_socket);
  if(bt_connect) {
    front_cam_bt_active = true;
  }
  else {
    system("echo \"Error: could not connect to front camera.\" >> ~/axolotl/debug");
  }

  // Pair with rear camera RPi
  bt_connect = connectBluetooth(rear_cam_bt_addr_f, &rear_dashcam_bluetooth_socket);
  if(bt_connect) {
    rear_cam_bt_active = true;
  }
  else {
    system("echo \"Error: could not connect to rear camera.\" >> ~/axolotl/debug");
  }

  // Write a lock file so we know when we can start the nav system
  system("echo \"0\" > ~/axolotl/device_free");

  // Variables for gpio watching
  ifstream f;
  int i;
  char *args[] = { NULL };
  bool active = false;

  // Fork a gpio watcher process if we have a rear camera
  gpio_watcher_pid = fork();
  if (gpio_watcher_pid == 0) {
    #define BU_CAMERA
    #ifdef BU_CAMERA
    if(rear_cam_bt_active) {
      // continuously read from gpio value
      while(1) {
        f.open("/sys/class/gpio/gpio298/value");
    	  f >> i;

        // if state change on gpio pin, signal parent dashcam process
    	  if(i == 1 && not(active)){
          if(rear_cam_bt_active) {
      		  kill(getppid(),SIGBUS);
          }
    		  active = true;
    		  sleep(1);
    	  }
    	  else if(i == 0 && active){
          if(rear_cam_bt_active) {
      		  kill(getppid(),SIGBUS);
          }
    		  active = false;
    	  	  sleep(1);
    	  }
    	  f.close();
      }
    }
    #endif
    while(1) {

    }
  }
  else {
    // Register all signal handlers for only the parent dashcam process
    registerToggleOffHandler();
    registerToggleOnHandler();
    registerKillCamerasHandler();
    registerBackupCameraHandler();

    // begin our camera loop outside of the gpio watcher
    cameraLoop();
  }

  return 0;
}
