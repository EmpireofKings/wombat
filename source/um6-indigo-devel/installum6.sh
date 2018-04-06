sudo pip install cpplint rosdep
sudo rosdep init && rosdep update 
sudo sh -c 'echo "deb http://packages.ros.org/ros-shadow-fixed/ubuntu precise main" > /etc/apt/sources.list.d/ros-latest.list'
wget http://packages.ros.org/ros.key -O - | sudo apt-key add -
sudo apt-get update -qq
rosdep install --from-paths .. --ignore-src --rosdistro hydro
source /opt/ros/hydro/setup.bash
mkdir -p ~/catkin_ws/src && pushd ~/catkin_ws
catkin_init_workspace src
ln -s `eval echo $(dirs +1)` src/
catkin_make all run_tests roslint
