# Launch Gazebo & rViz
`cd cr_project`  
`roslaunch summit_xl_sim_bringup summit_xls_complete.launch`  

# launch keyboard control
`rosrun teleop_twist_keyboard teleop_twist_keyboard.py /cmd_vel:=/robot/robotnik_base_control/cmd_vel`

or 
`cd cr_req`  
`source ./devel/setup.bash`  
`rosrun cr_pkg control_wasd.py`  

# launch sensors reader node

`cd cd_req_b`  
`chmod +x script/sensor_reading.py`  
`source ./devel/setup.bash`  
`roslaunch req_b_pkg multi.launch`

# To create a new message:
Follow Document  
if it needs dependencies:
- change cmakelists.txt inside package
	- generate_messages
	- find_package
- change package.xml
	- build_depend
- catkin_make

# To run grid mapping:
`cd cr_req_c`  
`source ./devel/setup.bash`  
`rosrun req_c_pkg grid_mapping.py`
