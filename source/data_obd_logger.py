## ------------------------------------
## Axolotl Data Logging Python Logger
## ------------------------------------
## Describes methods that interact with python-OBD's to log OBDII data to file.
## This script will automatically quit if the parent datad_pyhelper process is killed.
##

import os
import sys
import datetime
import time

# python OBD (from pyOBD-pi fork)
import obd
from obd import OBDStatus as obdstat

# establish a global command array
commands = []

# setting up the command array
commands.append(obd.commands.ENGINE_LOAD)
commands.append(obd.commands.RPM)
commands.append(obd.commands.SPEED)
commands.append(obd.commands.THROTTLE_POS)
commands.append(obd.commands.RELATIVE_THROTTLE_POS)
commands.append(obd.commands.RUN_TIME)
commands.append(obd.commands.FUEL_LEVEL)
commands.append(obd.commands.COOLANT_TEMP)
commands.append(obd.commands.AMBIANT_AIR_TEMP)
commands.append(obd.commands.BAROMETRIC_PRESSURE)

# diagnostic commands for development
diag = []

diag.append(obd.commands.HYBRID_BATTERY_REMAINING)
diag.append(obd.commands.OIL_TEMP)


# run in async mode?
run_asynchronous_mode = True

def obdSnapshot(obd_connection_handle):
    log_time = time.time()

    # snapshot time start (grabs computer time)
    csv_line = "@" + str(time.ctime()) + ","

    # execute the command array, saving results to csv_line with "," delimitation
    for i in xrange(0,len(commands)-1):
            csv_line += str(obd_connection_handle.query(commands[i]).value) + ","

    csv_line += str(obd_connection_handle.query(commands[len(commands)-1]).value) + "\n"

    # write entire csv_line to file in one file operation
    csv_file_handle = open(sys.argv[2] + "/obd_log.csv",'w+')
    csv_file_handle.write(csv_line)
    csv_file_handle.close()

    ########################################
    # same operations for diagnostics...
    csv_line = "@" + str(time.ctime()) + ","

    # execute the command array, saving results to csv_line with "," delimitation
    for i in xrange(0,len(diag)-1):
            csv_line += str(obd_connection_handle.query(diag[i]).value) + ","

    csv_line += str(obd_connection_handle.query(diag[len(diag)-1]).value) + "\n"

    # write entire csv_line to file in one file operation
    csv_file_handle = open(sys.argv[2] + "/diag.csv",'a')
    csv_file_handle.write(csv_line)
    csv_file_handle.close()
    ########################################

    # debug statement; outputs the time taken to complete the query
    # print str(time.time()-log_time)

# set the command array to watch mode, allowing for async non-blocking updates
def obdAsync(obd_connection_handle):
    for i in xrange(0, len(commands)-1):
        obd_connection_handle.watch(commands[i])

# starts watching on the OBD connection
def startAsyncWatch(obd_connection_handle):
    for i in xrange(0,len(commands)-1):
        obd_connection_handle.watch(commands[i])

    # diagnostic commands
    for i in xrange(0,len(diag)-1):
        obd_connection_handle.watch(diag[i])
        obd_connection_handle.supported_commands.add(diag[i])

    obd_connection_handle.start()


if __name__ == '__main__':
    ## Set up connection to the OBDLink MX
    if run_asynchronous_mode:
        obd_bluetooth_socket = obd.Async()
        # obd_bluetooth_socket = obd.Async("/dev/tty.OBDII-Port")       # experimental explicit connect command
        if(obd_bluetooth_socket.is_connected()):
            startAsyncWatch(obd_bluetooth_socket)
    else:
        obd_bluetooth_socket = obd.OBD()

    # file_path = "."
    # if(len(sys.argv) > 2):
    #     new_path = sys.argv[2].split('/')
    #     new_path = new_path[:-2]
    #     file_path = '/'.join(new_path)

    file_path = "/home/nvidia/axolotl"

    # Logic based on command line arguments
    if(obd_bluetooth_socket.is_connected()):
        # Preemptively cache DTCs
        dtc_error_file = open(file_path + "/dtc_errors",'w+')
        dtc_error_file.write("Diagnostic Trouble Codes fetched at: " + time.ctime() + "\n\n")
        dtc_error_file.write(str(obd_bluetooth_handle.query(obd.commands.GET_DTC)))
        dtc_error_file.close()

        # Do some command based on argument
        if(sys.argv[1] == "snapshot"):
            while(1):
                try:
                    os.kill(int(sys.argv[3]),0);
                except OSError:
                    break;
                else:
                    obdSnapshot(obd_bluetooth_socket)
                    time.sleep(.2)
    else:
        print file_path + "/dtc_errors"
	    dtc_error_file = open(file_path + "/dtc_errors",'w+')
        dtc_error_file.write("Diagnostic Trouble Codes fetched at: " + time.ctime() + "\n\n")
        dtc_error_file.write("Error: No OBD connection detected; DTC fetch failed.")
        dtc_error_file.write(" ")
        dtc_error_file.close()
        os.system('echo \"Error: could not establish connection to OBD bluetooth device.\" >> ~/axolotl/debug')
        os.system('echo \"Error: could not fetch DTCs; bluetooth connection not available.\" >> ~/axolotl/debug')


    obd_bluetooth_socket.close()
