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
   Data Logger Python Helper
   ------------------------------------
   Execs the data_obd_logger.py script.
*/

#include "dcomh.hpp"

// Supply the path to the script, assuming everything's installed in the home directory
#ifdef __linux__
#define OBD_ADAPTER_PATH "/wombat/source/data_logging/data_obd_logger.py"
#else
#define OBD_ADAPTER_PATH "/Gitdir/wombat/data_logging/data_obd_logger.py"
#endif

using namespace std;

int main(int argc, char *argv[]) {
  string helper_pid = to_string(getpid());    // pass this pid to python script so it knows when to quit
  string logging_directory_path = argv[1];
  cout << getpid() << endl;
  string builtCommand = "python " + axolotlFileSystem::getHomeDir() + OBD_ADAPTER_PATH + " snapshot " + logging_directory_path + " " + helper_pid;
  system(builtCommand.c_str());
  return 0;
}
