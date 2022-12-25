
"use strict";

let GetPOI = require('./GetPOI.js')
let set_analog_output = require('./set_analog_output.js')
let set_float_value = require('./set_float_value.js')
let ack_alarm = require('./ack_alarm.js')
let set_ptz = require('./set_ptz.js')
let get_alarms = require('./get_alarms.js')
let InsertTask = require('./InsertTask.js')
let SetEncoderTurns = require('./SetEncoderTurns.js')
let set_mode = require('./set_mode.js')
let enable_disable = require('./enable_disable.js')
let set_odometry = require('./set_odometry.js')
let QueryAlarms = require('./QueryAlarms.js')
let SetBuzzer = require('./SetBuzzer.js')
let SetMotorStatus = require('./SetMotorStatus.js')
let SetMotorPID = require('./SetMotorPID.js')
let set_digital_output = require('./set_digital_output.js')
let GetBool = require('./GetBool.js')
let SetLaserMode = require('./SetLaserMode.js')
let get_mode = require('./get_mode.js')
let GetMotorsHeadingOffset = require('./GetMotorsHeadingOffset.js')
let set_named_digital_output = require('./set_named_digital_output.js')
let get_digital_input = require('./get_digital_input.js')
let axis_record = require('./axis_record.js')
let SetInt16 = require('./SetInt16.js')
let SetMotorMode = require('./SetMotorMode.js')
let get_modbus_register = require('./get_modbus_register.js')
let SetElevator = require('./SetElevator.js')
let set_CartesianEuler_pose = require('./set_CartesianEuler_pose.js')
let ResetFromSubState = require('./ResetFromSubState.js')
let SetTransform = require('./SetTransform.js')
let set_modbus_register = require('./set_modbus_register.js')
let set_height = require('./set_height.js')
let home = require('./home.js')
let GetPTZ = require('./GetPTZ.js')
let SetByte = require('./SetByte.js')
let SetNamedDigitalOutput = require('./SetNamedDigitalOutput.js')
let SetString = require('./SetString.js')
let SetCurrent = require('./SetCurrent.js')

module.exports = {
  GetPOI: GetPOI,
  set_analog_output: set_analog_output,
  set_float_value: set_float_value,
  ack_alarm: ack_alarm,
  set_ptz: set_ptz,
  get_alarms: get_alarms,
  InsertTask: InsertTask,
  SetEncoderTurns: SetEncoderTurns,
  set_mode: set_mode,
  enable_disable: enable_disable,
  set_odometry: set_odometry,
  QueryAlarms: QueryAlarms,
  SetBuzzer: SetBuzzer,
  SetMotorStatus: SetMotorStatus,
  SetMotorPID: SetMotorPID,
  set_digital_output: set_digital_output,
  GetBool: GetBool,
  SetLaserMode: SetLaserMode,
  get_mode: get_mode,
  GetMotorsHeadingOffset: GetMotorsHeadingOffset,
  set_named_digital_output: set_named_digital_output,
  get_digital_input: get_digital_input,
  axis_record: axis_record,
  SetInt16: SetInt16,
  SetMotorMode: SetMotorMode,
  get_modbus_register: get_modbus_register,
  SetElevator: SetElevator,
  set_CartesianEuler_pose: set_CartesianEuler_pose,
  ResetFromSubState: ResetFromSubState,
  SetTransform: SetTransform,
  set_modbus_register: set_modbus_register,
  set_height: set_height,
  home: home,
  GetPTZ: GetPTZ,
  SetByte: SetByte,
  SetNamedDigitalOutput: SetNamedDigitalOutput,
  SetString: SetString,
  SetCurrent: SetCurrent,
};
