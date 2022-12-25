prefix="ros-noetic"
# List of packages we need 
packages=("navigation" "gmapping" "robot-localization" "mavros-msgs" "velocity-controllers" "twist-mux" "teleop-twist-keyboard")

# Base install command
apt_command="sudo apt-get install "

# Build a long command that should look like 
# `sudo apt-get install ros-noetic-pkg1 ros-noetic-pkg2 ... ros-noetic-pkgn -y`
for pkg in ${packages[@]}; do
	apt_command+="$prefix-$pkg "
done
apt_command+=" -y"

# Run the command
eval $apt_command

# Create `cr_project` and `src` inside it
mkdir -p ./cr_project/src

# Download all the needed repos into `cr_project/src`
cd ./cr_project/src
git clone https://github.com/RobotnikAutomation/summit_xl_common.git
git clone https://github.com/RobotnikAutomation/summit_xl_sim.git
git clone https://github.com/RobotnikAutomation/robotnik_msgs.git
git clone https://github.com/RobotnikAutomation/robotnik_sensors.git

cd ..

# Initialize `cr_project` as a catkin workspace
catkin_make 

# source the setup script 
source ./devel/setup.bash

# $(pwd) should return the absolute path to `cr_project`
# Add a command to automatically source the setup script 
echo "source $(pwd)/devel/setup.bash" >> ~/.bashrc
source ~/.bashrc
