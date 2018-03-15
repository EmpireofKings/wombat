/* ------------------------------------
   Axolotl Dashcam Daemon
   ------------------------------------
   Background process managed by Axolotl;
   logs camera data from dashcam and backup camera.
*/

#include "dcomh.hpp"

#include <stdio.h>
#include <unistd.h>
#include <sys/socket.h>
#include <bluetooth/bluetooth.h>
#include <bluetooth/rfcomm.h>

#define FRONT_CAM_BT_ADDR "B8:27:EB:FE:1C:65"
#define REAR_CAM_BT_ADDR "iunnoyet"
#define FRONT_CAMERA_HELPER_NAME "./front_cam_helper"
#define REAR_CAMERA_HELPER_NAME "./rear_cam_helper"
#define BACKUP_CAMERA_HELPER_NAME "./backup_cam_helper"

#define FRONT_CAMERA_PORT "9001"
#define REAR_CAMERA_PORT "9002"
#define BACKUP_CAMERA_PORT "9003"

#define COMMAND_RECORD "r"
#define COMMAND_WATCH "w"

#define AUTO_MEMORY_MANAGEMENT_MODE 0   // set to 1 if auto-delete of old footage desired

using namespace std;

string loggingDirectory;    // curr logging directory
bool loggingActive = true;    // bool to toggle logging on and off
bool backupCameraActive = false, frontCamBTActive = false, rearCamBTActive = false;   // bools to check camera state

pid_t dchelper0pid = -5, dchelper1pid = -5, bcamerapid = -5;    // process IDs for helpers

int fdcfd, rdcfd;   // bluetooth file descriptors for front and rear dashcams

/*
  Optimize storage by deleting all past days' data.
*/
void optimizeStorage() {
  if(AUTO_MEMORY_MANAGEMENT_MODE) {
    // do things to optimize storage space
  }
}

/*
  Makes a bluetooth connection, storing info for accessing into a file descriptor by address.
*/
bool connectBluetooth(string bluetoothAddress, int *fd) {
  int status;   // to hold connection status based on connect() call
  char *dest = (char *)bluetoothAddress.c_str();    // get the supplied address and cast to c string

  // allocate bluetooths ocket
  *fd = socket(AF_BLUETOOTH, SOCK_STREAM, BTPROTO_RFCOMM);

  // set bluetooth connection parameters
  struct sockaddr_rc addr = { 0 };
  addr.rc_family = AF_BLUETOOTH;
  addr.rc_channel = (uint8_t) 1;
  str2ba( dest, &addr.rc_bdaddr );

  // connect to the raspberrypi, saving connection into a global file descriptor
  status = connect(*fd, (struct sockaddr *)&addr, sizeof(addr));

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
  Mananges all logging.
*/
void cameraLoop() {
  char *args[] = {(char *)FRONT_CAMERA_HELPER_NAME, (char *)FRONT_CAMERA_PORT, (char *)COMMAND_RECORD, (char *)loggingDirectory.c_str(), NULL};
  while(1) {
    if(loggingActive) {
      if(frontCamBTActive) {
        sendBluetoothCommand(fdcfd,'s');
      }
      while(axolotlFileSystem::getAvailableMemory(loggingDirectory) < 2048) {   // wait until we have > 2GB storage
          optimizeStorage();    // attempt to optimize storage space if we don't have enough
      }
      dchelper0pid = fork();
      if(dchelper0pid == 0) {
        if (frontCamBTActive) {
          execv("record_helper",args);
        }
        else {
          //dchelper1pid = fork();
          if(dchelper1pid == 0) {

          }
          else {
            while(1) {
              // wait forever after we generate our two helpers
            }
          }
        }
      }
    }
    while(1) {
      // another wait just in case...
    }
  }
}

/*
  Kills the backup camera gstreamer process.
*/
void killBackupCameraGstreamer() {
  ofstream bcHandleFile;
  string pidBackupCamGSTasSTR = "";
  int pidBackupCamGST;

  system("killall backup_cam_helper");
  system("pgrep port=9003 > bchandle");

  bcHandleFile.open("bchandle");
  if(bcHandleFile.is_open()) {
    getline(bcHandleFile,pidBackupCamGSTasSTR);
    bcHandleFile.close();
  }
  if(pidBackupCamGSTasSTR != "") {
    pidBackupCamGST = stoi(pidBackupCamGSTasSTR);
    kill(pidBackupCamGST, SIGTERM);
  }

  system("rm -f bchandle");
}

/*
  Kills all of the gstreamer processes, dashcam helpers, and record programs.
*/
void killAllHelpers() {
  int status;   // holds our waitpid status

  // kill all of our gst-launch processes
  system("killall record_helper");
  system("killall gst-launch-1.0");
  if(backupCameraActive) {
    system("killall backup_cam_helper");
  }

  if((dchelper0pid != -5) && (dchelper0pid > 1)) {
    kill(dchelper1pid,SIGKILL);
    waitpid(dchelper1pid, &status, -1);
  }
  dchelper0pid = -5;

  if((dchelper1pid != -5) && (dchelper1pid > 1)) {
    kill(dchelper1pid,SIGKILL);
    waitpid(dchelper1pid, &status, -1);
  }
  dchelper1pid = -5;

  if(backupCameraActive) {
    if(bcamerapid > 1) {
      kill(bcamerapid,SIGKILL);
      waitpid(bcamerapid, &status, -1);
    }
    bcamerapid = -5;

    killBackupCameraGstreamer();
  }

}

/*
  Kills all cameras, send kill command to the raspberrypi.
  Closes file descriptors to bluetooth sockets and exits cleanly.
*/
void killCamerasHandler(int signumber, siginfo_t *siginfo, void *pointer) {
  printf("IMA FIRIN MAH LAZOR\n");

  sendBluetoothCommand(fdcfd,'q');
  //sendBluetoothCommand(rdcfd,'q');

  killAllHelpers();

  close(fdcfd);
  close(rdcfd);
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
  loggingActive = false;
  sendBluetoothCommand(fdcfd,'p');
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
  char *args[] = {(char *)FRONT_CAMERA_HELPER_NAME, (char *)FRONT_CAMERA_PORT, (char *)COMMAND_RECORD, (char *)loggingDirectory.c_str(), NULL};
  loggingActive = true;
  if(frontCamBTActive) {
    sendBluetoothCommand(fdcfd,'s');
  }
  while(axolotlFileSystem::getAvailableMemory(loggingDirectory) < 2048) {   // wait until we have > 2GB storage
    optimizeStorage();    // attempt to optimize storage space if we don't have enough
  }
  dchelper0pid = fork();
  if(dchelper0pid == 0) {
    if (frontCamBTActive) {
      execv("record_helper",args);
    }
    else {
      //args = {(char *)REAR_CAMERA_HELPER_NAME, (char *)REAR_CAMERA_PORT, (char *)COMMAND_RECORD, (char *)loggingDirectory.c_str(), NULL};
    }
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
  backupCameraActive = !backupCameraActive;
  char *args[] = {(char *)BACKUP_CAMERA_HELPER_NAME, (char *)BACKUP_CAMERA_PORT, (char *)COMMAND_WATCH, (char *)loggingDirectory.c_str(), NULL};
  if(backupCameraActive) {
    sendBluetoothCommand(rdcfd,'b');
    execv("backup_cam_helper",args);
  }
  else {
    sleep(5);   // fulfill FMVSS by waiting 5 sec to kill backup camera after shifting out of reverse
    killBackupCameraGstreamer();
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
  loggingDirectory = argv[1];

  // Pair with front camera RPi
  if(connectBluetooth(FRONT_CAM_BT_ADDR, &fdcfd)) {
    frontCamBTActive = true;
  }

  // Pair with rear camera RPi
  /*if(connectBluetooth(REAR_CAM_BT_ADDR, &rdcfd)) {
    rearCamBTActive = true;
  }*/

  // Register all signal handlers
  registerToggleOffHandler();
  registerToggleOnHandler();
  registerKillCamerasHandler();
  registerBackupCameraHandler();

  // Begin our camera loop
  cameraLoop();

  return 0;
}
