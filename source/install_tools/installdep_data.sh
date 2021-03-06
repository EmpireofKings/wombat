#!/bin/bash

# Update apt-get itself
sudo apt-get update

# Install navigation dependencies
sudo apt-get install build-essential cmake -y
sudo apt-get install build-essential zlib1g-dev -y
sudo apt-get install build-essential libpng12-dev -y
sudo apt-get install build-essential libgtk2.0-dev -y
sudo apt-get install build-essential librsvg2-bin -y
sudo apt-get install build-essential g++ -y
sudo apt-get install build-essential build-essential gpsd -y
sudo apt-get install build-essential gpsd-clients -y
sudo apt-get install build-essential libgps-dev -y
sudo apt-get install build-essential libdbus-glib-1-dev -y
sudo apt-get install build-essential libimlib2-dev -y
sudo apt-get install build-essential espeak -y

# Install obd dependencies
sudo apt-get install build-essential python -y
sudo apt-get install build-essential python-pip -y
sudo pip install --upgrade pip
sudo pip install obd
sudo pip install pathlib
sudo apt-get install bluez-compat build-essential -y

# Install authentication dependencies
sudo apt-get install build-essential libboost-all-dev -y
sudo apt-get install build-essential libcrypto++ -y

# Install bluetooth dependencies
sudo apt-get install build-essential libbluetooth-dev -y
sudo apt-get install build-essential pulseaudio -y

# Install navigation ACM driver
cd $PWD/../data_logging/acm/
sudo ./installCDCACM.sh
cd ..

# Build and install serial driver for AHRS
cd $PWD/../data_logging/um6/serial
rm -rf build
mkdir build
cd build
cmake ..
make
sudo make install
cd ../..

# Install camera dependencies
sudo apt-get install build-essential hostapd -y
sudo apt-get install build-essential dnsmasq -y

sudo apt-get install build-essential gstreamer-0.10 -y
sudo apt-get install build-essential gstreamer0.10-plugins-good -y
sudo apt-get install build-essential gstreamer0.10-plugins-bad -y
sudo apt-get install build-essential gstreamer0.10-plugins-ugly -y

# Done!
echo "Install complete! Rebooting in 5 seconds..."
sleep 5s
sudo reboot
