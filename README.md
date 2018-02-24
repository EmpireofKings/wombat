# Axolotl - Victor's Branch
__Current Version:__ 0.3.2 alpha

Version 0.3.2 alpha:
- Split python adapter script into a data logging script and DTC script
- Modified data logging script to utilize asynchronous queries
- Added source for data logging helper, which manages OBD logging
- Modified data logging daemon to fork and exec the logging helper

Version 0.3.1 alpha:
- Fixes to navigation to improve GPS fix reliability
- UI changes to navigation system to improve usability
    - Added ETA, expressed in 24-hour time
    - Added distance to next navigation instruction
    - Added next navigation instruction
    - Added zoom in and out buttons
- Added cdc_acm driver to repo and dependency install script

Version 0.3.0 alpha:
- Fully working offline navigation with NEO M8U GPS chip integration
- Fully working OBDII data logging, mostly fixed bugs
- Dashcam daemon doesn't currently record as video pipeline is incomplete
- Updated daemon manager to support x64 compilation
- Updated dependency install script with extra dependencies
- Updated Navit UI with compass, next turn direction, and distance to destination UI elements
- Updated Navit config to use espeak TTS for turn instructions
- Added stop signal handlers to daemons for quick sleep-wake logging restart

Version 0.2.1:
- Fully working OBDII data logging, with a few bugs
- Switched to python-OBD library for all OBD functions, so removed pyOBD source and updated dependency list

Version 0.1.11:
- Initial implementation of python OBD adapter
- Changed dependencies, using python-OBD for OBDII data
- Removed data logging daemon's signal handlers as C++ program no longer handles the OBDII data
- Added extra field to OBDII data: oil temp

Version 0.1.10:
- Added SHA256 hashing function to complete implementation of password check for black box data deletion
- Completed integration of python script into data logging daemon
- Added new tests to testing apparatus
- Initialized pyOBD as a module
- Added salted SHA256 hash of default data deletion key

Version 0.1.9:
- Changed navigation GUI to simplified mobile version supplied by Navit devs
- Switched GUI rendering engine from GTK to Qt for later integration

Version 0.1.8:
- Added signal handler to data logging daemon
- Added code comments
- Partial implementation of data deletion function
- Fixed bug with directory creation where singular minutes would be recorded as only one digit
- Added get user home directory function to common header file

Dependencies:
- Navit 0.5.1\*
  - North American mapset binary hosted [here](https://drive.google.com/open?id=1UpHisYQQdKC_r3oSZfjjtk_R77760Z-u). Mapset courtesy of the OpenStreetMap project and Navit, no ownership claimed.
- boost 1.66.0 (Unix)
- Python 2.7.3
- Qt 5.10\*
- CryptoPP 6.0.0
- python-OBD 0.6.1

\*Sub-dependencies not included in this listing.
