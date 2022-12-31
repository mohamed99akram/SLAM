# Getting Started:
1- Download ROS
Full version: [link](http://wiki.ros.org/noetic/Installation/Ubuntu)

2- Clone this Repo

3- Delete build folders

4- in each directory cr_req..: run `catkin_make`
# Launch Gazebo & rViz
`cd cr_project`  
`roslaunch summit_xl_sim_bringup summit_xls_complete.launch`  

# launch keyboard control
`rosrun teleop_twist_keyboard teleop_twist_keyboard.py /cmd_vel:=/robot/robotnik_base_control/cmd_vel`

or 
`cd cr_req`  
`source ./devel/setup.bash`  
`chmod +x src/req_pkg/script/control_wasd.py`  -> only once   
`rosrun req_pkg control_wasd.py`  

# launch sensors reader node

`cd cr_req_b`  
`chmod +x src/req_b_pkg/script/sensor_reading.py`    -> only once   
`source ./devel/setup.bash`  
`roslaunch req_b_pkg multi.launch`


# To run grid mapping:
`cd cr_req_c`  
`source ./devel/setup.bash`  
`chmod +x src/req_c_pkg/script/grid_mapping.py`    -> only once   
`rosrun req_c_pkg grid_mapping.py`

# To create a new message:
Follow Document  
if it needs dependencies:
- change cmakelists.txt inside package
	- generate_messages
	- find_package
- change package.xml
	- build_depend
- catkin_make
