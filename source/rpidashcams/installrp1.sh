#!/bin/sh
make
sudo cp front_cam_autostart /etc/init.d/front_cam_autostart
sleep 5s
sudo chmod +x /etc/init.d/front_cam_autostart
chdir /etc/init.d
sudo update-rc.d front_cam_autostart defaults
sudo reboot