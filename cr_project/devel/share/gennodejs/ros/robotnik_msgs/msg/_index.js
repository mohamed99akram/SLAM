
"use strict";

let Alarms = require('./Alarms.js');
let OdomManualCalibrationStatus = require('./OdomManualCalibrationStatus.js');
let PresenceSensorArray = require('./PresenceSensorArray.js');
let Cartesian_Euler_pose = require('./Cartesian_Euler_pose.js');
let Axis = require('./Axis.js');
let Pose2DStamped = require('./Pose2DStamped.js');
let InverterStatus = require('./InverterStatus.js');
let SafetyModuleStatus = require('./SafetyModuleStatus.js');
let QueryAlarm = require('./QueryAlarm.js');
let PresenceSensor = require('./PresenceSensor.js');
let MotorStatus = require('./MotorStatus.js');
let Pose2DArray = require('./Pose2DArray.js');
let StringStamped = require('./StringStamped.js');
let AlarmSensor = require('./AlarmSensor.js');
let MotorReferenceValueArray = require('./MotorReferenceValueArray.js');
let named_input_output = require('./named_input_output.js');
let MotorsStatus = require('./MotorsStatus.js');
let BatteryDockingStatusStamped = require('./BatteryDockingStatusStamped.js');
let Interfaces = require('./Interfaces.js');
let named_inputs_outputs = require('./named_inputs_outputs.js');
let MotorCurrent = require('./MotorCurrent.js');
let MotorReferenceValue = require('./MotorReferenceValue.js');
let LaserStatus = require('./LaserStatus.js');
let SubState = require('./SubState.js');
let RobotnikMotorsStatus = require('./RobotnikMotorsStatus.js');
let BatteryStatus = require('./BatteryStatus.js');
let MotorHeadingOffset = require('./MotorHeadingOffset.js');
let LaserMode = require('./LaserMode.js');
let ArmStatus = require('./ArmStatus.js');
let alarmsmonitor = require('./alarmsmonitor.js');
let alarmmonitor = require('./alarmmonitor.js');
let WatchdogStatusArray = require('./WatchdogStatusArray.js');
let inputs_outputs = require('./inputs_outputs.js');
let OdomCalibrationStatusStamped = require('./OdomCalibrationStatusStamped.js');
let OdomManualCalibrationStatusStamped = require('./OdomManualCalibrationStatusStamped.js');
let BatteryStatusStamped = require('./BatteryStatusStamped.js');
let encoders = require('./encoders.js');
let PantiltStatus = require('./PantiltStatus.js');
let ReturnMessage = require('./ReturnMessage.js');
let BatteryDockingStatus = require('./BatteryDockingStatus.js');
let MotorPID = require('./MotorPID.js');
let ElevatorAction = require('./ElevatorAction.js');
let Data = require('./Data.js');
let ptz = require('./ptz.js');
let StringArray = require('./StringArray.js');
let PantiltStatusStamped = require('./PantiltStatusStamped.js');
let Registers = require('./Registers.js');
let Register = require('./Register.js');
let WatchdogStatus = require('./WatchdogStatus.js');
let ElevatorStatus = require('./ElevatorStatus.js');
let OdomCalibrationStatus = require('./OdomCalibrationStatus.js');
let MotorsStatusDifferential = require('./MotorsStatusDifferential.js');
let State = require('./State.js');
let BoolArray = require('./BoolArray.js');
let SetElevatorAction = require('./SetElevatorAction.js');
let SetElevatorGoal = require('./SetElevatorGoal.js');
let SetElevatorActionGoal = require('./SetElevatorActionGoal.js');
let SetElevatorActionFeedback = require('./SetElevatorActionFeedback.js');
let SetElevatorResult = require('./SetElevatorResult.js');
let SetElevatorActionResult = require('./SetElevatorActionResult.js');
let SetElevatorFeedback = require('./SetElevatorFeedback.js');

module.exports = {
  Alarms: Alarms,
  OdomManualCalibrationStatus: OdomManualCalibrationStatus,
  PresenceSensorArray: PresenceSensorArray,
  Cartesian_Euler_pose: Cartesian_Euler_pose,
  Axis: Axis,
  Pose2DStamped: Pose2DStamped,
  InverterStatus: InverterStatus,
  SafetyModuleStatus: SafetyModuleStatus,
  QueryAlarm: QueryAlarm,
  PresenceSensor: PresenceSensor,
  MotorStatus: MotorStatus,
  Pose2DArray: Pose2DArray,
  StringStamped: StringStamped,
  AlarmSensor: AlarmSensor,
  MotorReferenceValueArray: MotorReferenceValueArray,
  named_input_output: named_input_output,
  MotorsStatus: MotorsStatus,
  BatteryDockingStatusStamped: BatteryDockingStatusStamped,
  Interfaces: Interfaces,
  named_inputs_outputs: named_inputs_outputs,
  MotorCurrent: MotorCurrent,
  MotorReferenceValue: MotorReferenceValue,
  LaserStatus: LaserStatus,
  SubState: SubState,
  RobotnikMotorsStatus: RobotnikMotorsStatus,
  BatteryStatus: BatteryStatus,
  MotorHeadingOffset: MotorHeadingOffset,
  LaserMode: LaserMode,
  ArmStatus: ArmStatus,
  alarmsmonitor: alarmsmonitor,
  alarmmonitor: alarmmonitor,
  WatchdogStatusArray: WatchdogStatusArray,
  inputs_outputs: inputs_outputs,
  OdomCalibrationStatusStamped: OdomCalibrationStatusStamped,
  OdomManualCalibrationStatusStamped: OdomManualCalibrationStatusStamped,
  BatteryStatusStamped: BatteryStatusStamped,
  encoders: encoders,
  PantiltStatus: PantiltStatus,
  ReturnMessage: ReturnMessage,
  BatteryDockingStatus: BatteryDockingStatus,
  MotorPID: MotorPID,
  ElevatorAction: ElevatorAction,
  Data: Data,
  ptz: ptz,
  StringArray: StringArray,
  PantiltStatusStamped: PantiltStatusStamped,
  Registers: Registers,
  Register: Register,
  WatchdogStatus: WatchdogStatus,
  ElevatorStatus: ElevatorStatus,
  OdomCalibrationStatus: OdomCalibrationStatus,
  MotorsStatusDifferential: MotorsStatusDifferential,
  State: State,
  BoolArray: BoolArray,
  SetElevatorAction: SetElevatorAction,
  SetElevatorGoal: SetElevatorGoal,
  SetElevatorActionGoal: SetElevatorActionGoal,
  SetElevatorActionFeedback: SetElevatorActionFeedback,
  SetElevatorResult: SetElevatorResult,
  SetElevatorActionResult: SetElevatorActionResult,
  SetElevatorFeedback: SetElevatorFeedback,
};
