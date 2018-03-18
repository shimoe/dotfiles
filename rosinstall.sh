sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu trusty main" > /etc/apt/sources.list.d/ros-latest.list' 
wget https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -O - | sudo apt-key add - 
sudo apt-get update
sudo apt-get install ros-indigo-desktop-full 
sudo rosdep init
rosdep update
sudo apt-get install python-rosinstall
