# Install script for directory: /home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/akram/CMP4/CR/Project/cr_project/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/robotnik_msgs/msg" TYPE FILE FILES
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/msg/encoders.msg"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/msg/inputs_outputs.msg"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/msg/ptz.msg"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/msg/Data.msg"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/msg/Interfaces.msg"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/msg/Axis.msg"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/msg/AlarmSensor.msg"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/msg/Alarms.msg"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/msg/MotorStatus.msg"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/msg/MotorsStatus.msg"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/msg/State.msg"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/msg/ArmStatus.msg"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/msg/BatteryStatus.msg"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/msg/BatteryStatusStamped.msg"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/msg/OdomCalibrationStatus.msg"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/msg/OdomCalibrationStatusStamped.msg"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/msg/OdomManualCalibrationStatus.msg"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/msg/OdomManualCalibrationStatusStamped.msg"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/msg/MotorHeadingOffset.msg"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/msg/MotorsStatusDifferential.msg"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/msg/InverterStatus.msg"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/msg/RobotnikMotorsStatus.msg"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/msg/ElevatorAction.msg"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/msg/ElevatorStatus.msg"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/msg/PantiltStatus.msg"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/msg/PantiltStatusStamped.msg"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/msg/Cartesian_Euler_pose.msg"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/msg/alarmmonitor.msg"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/msg/alarmsmonitor.msg"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/msg/named_inputs_outputs.msg"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/msg/named_input_output.msg"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/msg/Register.msg"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/msg/Registers.msg"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/msg/StringArray.msg"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/msg/LaserMode.msg"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/msg/LaserStatus.msg"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/msg/SafetyModuleStatus.msg"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/msg/StringStamped.msg"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/msg/SubState.msg"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/msg/QueryAlarm.msg"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/msg/BatteryDockingStatus.msg"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/msg/BatteryDockingStatusStamped.msg"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/msg/BoolArray.msg"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/msg/MotorPID.msg"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/msg/MotorCurrent.msg"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/msg/Pose2DArray.msg"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/msg/Pose2DStamped.msg"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/msg/ReturnMessage.msg"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/msg/PresenceSensor.msg"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/msg/PresenceSensorArray.msg"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/msg/WatchdogStatus.msg"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/msg/WatchdogStatusArray.msg"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/msg/MotorReferenceValue.msg"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/msg/MotorReferenceValueArray.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/robotnik_msgs/srv" TYPE FILE FILES
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/srv/get_digital_input.srv"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/srv/set_analog_output.srv"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/srv/set_mode.srv"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/srv/set_ptz.srv"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/srv/get_mode.srv"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/srv/set_digital_output.srv"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/srv/set_odometry.srv"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/srv/set_height.srv"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/srv/enable_disable.srv"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/srv/home.srv"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/srv/axis_record.srv"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/srv/set_float_value.srv"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/srv/SetMotorStatus.srv"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/srv/SetElevator.srv"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/srv/get_alarms.srv"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/srv/ack_alarm.srv"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/srv/set_modbus_register.srv"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/srv/get_modbus_register.srv"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/srv/GetBool.srv"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/srv/set_CartesianEuler_pose.srv"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/srv/set_named_digital_output.srv"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/srv/SetLaserMode.srv"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/srv/ResetFromSubState.srv"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/srv/QueryAlarms.srv"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/srv/SetNamedDigitalOutput.srv"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/srv/InsertTask.srv"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/srv/SetMotorPID.srv"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/srv/SetMotorMode.srv"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/srv/SetBuzzer.srv"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/srv/SetEncoderTurns.srv"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/srv/GetMotorsHeadingOffset.srv"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/srv/GetPOI.srv"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/srv/SetString.srv"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/srv/SetInt16.srv"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/srv/GetPTZ.srv"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/srv/SetByte.srv"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/srv/SetCurrent.srv"
    "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/srv/SetTransform.srv"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/robotnik_msgs/action" TYPE FILE FILES "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/action/SetElevator.action")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/robotnik_msgs/msg" TYPE FILE FILES
    "/home/akram/CMP4/CR/Project/cr_project/devel/share/robotnik_msgs/msg/SetElevatorAction.msg"
    "/home/akram/CMP4/CR/Project/cr_project/devel/share/robotnik_msgs/msg/SetElevatorActionGoal.msg"
    "/home/akram/CMP4/CR/Project/cr_project/devel/share/robotnik_msgs/msg/SetElevatorActionResult.msg"
    "/home/akram/CMP4/CR/Project/cr_project/devel/share/robotnik_msgs/msg/SetElevatorActionFeedback.msg"
    "/home/akram/CMP4/CR/Project/cr_project/devel/share/robotnik_msgs/msg/SetElevatorGoal.msg"
    "/home/akram/CMP4/CR/Project/cr_project/devel/share/robotnik_msgs/msg/SetElevatorResult.msg"
    "/home/akram/CMP4/CR/Project/cr_project/devel/share/robotnik_msgs/msg/SetElevatorFeedback.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/robotnik_msgs/cmake" TYPE FILE FILES "/home/akram/CMP4/CR/Project/cr_project/build/robotnik_msgs/catkin_generated/installspace/robotnik_msgs-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/akram/CMP4/CR/Project/cr_project/devel/include/robotnik_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/akram/CMP4/CR/Project/cr_project/devel/share/roseus/ros/robotnik_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/akram/CMP4/CR/Project/cr_project/devel/share/common-lisp/ros/robotnik_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/akram/CMP4/CR/Project/cr_project/devel/share/gennodejs/ros/robotnik_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python3" -m compileall "/home/akram/CMP4/CR/Project/cr_project/devel/lib/python3/dist-packages/robotnik_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages" TYPE DIRECTORY FILES "/home/akram/CMP4/CR/Project/cr_project/devel/lib/python3/dist-packages/robotnik_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/akram/CMP4/CR/Project/cr_project/build/robotnik_msgs/catkin_generated/installspace/robotnik_msgs.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/robotnik_msgs/cmake" TYPE FILE FILES "/home/akram/CMP4/CR/Project/cr_project/build/robotnik_msgs/catkin_generated/installspace/robotnik_msgs-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/robotnik_msgs/cmake" TYPE FILE FILES
    "/home/akram/CMP4/CR/Project/cr_project/build/robotnik_msgs/catkin_generated/installspace/robotnik_msgsConfig.cmake"
    "/home/akram/CMP4/CR/Project/cr_project/build/robotnik_msgs/catkin_generated/installspace/robotnik_msgsConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/robotnik_msgs" TYPE FILE FILES "/home/akram/CMP4/CR/Project/cr_project/src/robotnik_msgs/package.xml")
endif()

