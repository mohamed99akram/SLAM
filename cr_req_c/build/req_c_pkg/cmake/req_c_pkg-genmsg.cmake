# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "req_c_pkg: 2 messages, 0 services")

set(MSG_I_FLAGS "-Ireq_c_pkg:/home/akram/CMP4/CR/Project/cr_req_c/src/req_c_pkg/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(req_c_pkg_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/akram/CMP4/CR/Project/cr_req_c/src/req_c_pkg/msg/HeaderAndReading.msg" NAME_WE)
add_custom_target(_req_c_pkg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "req_c_pkg" "/home/akram/CMP4/CR/Project/cr_req_c/src/req_c_pkg/msg/HeaderAndReading.msg" "geometry_msgs/Point:geometry_msgs/TwistWithCovariance:geometry_msgs/Twist:geometry_msgs/PoseWithCovariance:geometry_msgs/Quaternion:geometry_msgs/Vector3:std_msgs/Header:geometry_msgs/Pose"
)

get_filename_component(_filename "/home/akram/CMP4/CR/Project/cr_req_c/src/req_c_pkg/msg/HeaderAndReadings.msg" NAME_WE)
add_custom_target(_req_c_pkg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "req_c_pkg" "/home/akram/CMP4/CR/Project/cr_req_c/src/req_c_pkg/msg/HeaderAndReadings.msg" "std_msgs/Header:geometry_msgs/Vector3"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(req_c_pkg
  "/home/akram/CMP4/CR/Project/cr_req_c/src/req_c_pkg/msg/HeaderAndReading.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/TwistWithCovariance.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseWithCovariance.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/req_c_pkg
)
_generate_msg_cpp(req_c_pkg
  "/home/akram/CMP4/CR/Project/cr_req_c/src/req_c_pkg/msg/HeaderAndReadings.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/req_c_pkg
)

### Generating Services

### Generating Module File
_generate_module_cpp(req_c_pkg
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/req_c_pkg
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(req_c_pkg_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(req_c_pkg_generate_messages req_c_pkg_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/akram/CMP4/CR/Project/cr_req_c/src/req_c_pkg/msg/HeaderAndReading.msg" NAME_WE)
add_dependencies(req_c_pkg_generate_messages_cpp _req_c_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/akram/CMP4/CR/Project/cr_req_c/src/req_c_pkg/msg/HeaderAndReadings.msg" NAME_WE)
add_dependencies(req_c_pkg_generate_messages_cpp _req_c_pkg_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(req_c_pkg_gencpp)
add_dependencies(req_c_pkg_gencpp req_c_pkg_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS req_c_pkg_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(req_c_pkg
  "/home/akram/CMP4/CR/Project/cr_req_c/src/req_c_pkg/msg/HeaderAndReading.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/TwistWithCovariance.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseWithCovariance.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/req_c_pkg
)
_generate_msg_eus(req_c_pkg
  "/home/akram/CMP4/CR/Project/cr_req_c/src/req_c_pkg/msg/HeaderAndReadings.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/req_c_pkg
)

### Generating Services

### Generating Module File
_generate_module_eus(req_c_pkg
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/req_c_pkg
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(req_c_pkg_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(req_c_pkg_generate_messages req_c_pkg_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/akram/CMP4/CR/Project/cr_req_c/src/req_c_pkg/msg/HeaderAndReading.msg" NAME_WE)
add_dependencies(req_c_pkg_generate_messages_eus _req_c_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/akram/CMP4/CR/Project/cr_req_c/src/req_c_pkg/msg/HeaderAndReadings.msg" NAME_WE)
add_dependencies(req_c_pkg_generate_messages_eus _req_c_pkg_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(req_c_pkg_geneus)
add_dependencies(req_c_pkg_geneus req_c_pkg_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS req_c_pkg_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(req_c_pkg
  "/home/akram/CMP4/CR/Project/cr_req_c/src/req_c_pkg/msg/HeaderAndReading.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/TwistWithCovariance.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseWithCovariance.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/req_c_pkg
)
_generate_msg_lisp(req_c_pkg
  "/home/akram/CMP4/CR/Project/cr_req_c/src/req_c_pkg/msg/HeaderAndReadings.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/req_c_pkg
)

### Generating Services

### Generating Module File
_generate_module_lisp(req_c_pkg
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/req_c_pkg
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(req_c_pkg_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(req_c_pkg_generate_messages req_c_pkg_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/akram/CMP4/CR/Project/cr_req_c/src/req_c_pkg/msg/HeaderAndReading.msg" NAME_WE)
add_dependencies(req_c_pkg_generate_messages_lisp _req_c_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/akram/CMP4/CR/Project/cr_req_c/src/req_c_pkg/msg/HeaderAndReadings.msg" NAME_WE)
add_dependencies(req_c_pkg_generate_messages_lisp _req_c_pkg_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(req_c_pkg_genlisp)
add_dependencies(req_c_pkg_genlisp req_c_pkg_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS req_c_pkg_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(req_c_pkg
  "/home/akram/CMP4/CR/Project/cr_req_c/src/req_c_pkg/msg/HeaderAndReading.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/TwistWithCovariance.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseWithCovariance.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/req_c_pkg
)
_generate_msg_nodejs(req_c_pkg
  "/home/akram/CMP4/CR/Project/cr_req_c/src/req_c_pkg/msg/HeaderAndReadings.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/req_c_pkg
)

### Generating Services

### Generating Module File
_generate_module_nodejs(req_c_pkg
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/req_c_pkg
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(req_c_pkg_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(req_c_pkg_generate_messages req_c_pkg_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/akram/CMP4/CR/Project/cr_req_c/src/req_c_pkg/msg/HeaderAndReading.msg" NAME_WE)
add_dependencies(req_c_pkg_generate_messages_nodejs _req_c_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/akram/CMP4/CR/Project/cr_req_c/src/req_c_pkg/msg/HeaderAndReadings.msg" NAME_WE)
add_dependencies(req_c_pkg_generate_messages_nodejs _req_c_pkg_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(req_c_pkg_gennodejs)
add_dependencies(req_c_pkg_gennodejs req_c_pkg_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS req_c_pkg_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(req_c_pkg
  "/home/akram/CMP4/CR/Project/cr_req_c/src/req_c_pkg/msg/HeaderAndReading.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/TwistWithCovariance.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseWithCovariance.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/req_c_pkg
)
_generate_msg_py(req_c_pkg
  "/home/akram/CMP4/CR/Project/cr_req_c/src/req_c_pkg/msg/HeaderAndReadings.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/req_c_pkg
)

### Generating Services

### Generating Module File
_generate_module_py(req_c_pkg
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/req_c_pkg
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(req_c_pkg_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(req_c_pkg_generate_messages req_c_pkg_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/akram/CMP4/CR/Project/cr_req_c/src/req_c_pkg/msg/HeaderAndReading.msg" NAME_WE)
add_dependencies(req_c_pkg_generate_messages_py _req_c_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/akram/CMP4/CR/Project/cr_req_c/src/req_c_pkg/msg/HeaderAndReadings.msg" NAME_WE)
add_dependencies(req_c_pkg_generate_messages_py _req_c_pkg_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(req_c_pkg_genpy)
add_dependencies(req_c_pkg_genpy req_c_pkg_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS req_c_pkg_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/req_c_pkg)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/req_c_pkg
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(req_c_pkg_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(req_c_pkg_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/req_c_pkg)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/req_c_pkg
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(req_c_pkg_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(req_c_pkg_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/req_c_pkg)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/req_c_pkg
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(req_c_pkg_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(req_c_pkg_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/req_c_pkg)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/req_c_pkg
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(req_c_pkg_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(req_c_pkg_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/req_c_pkg)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/req_c_pkg\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/req_c_pkg
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(req_c_pkg_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(req_c_pkg_generate_messages_py geometry_msgs_generate_messages_py)
endif()
