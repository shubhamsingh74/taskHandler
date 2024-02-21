import 'package:json_annotation/json_annotation.dart';

part 'employee_month_attendance_model.g.dart';

@JsonSerializable()
class EmployeeMonthAttendanceModel {
  @JsonKey(name: "success")
  bool? success;
  @JsonKey(name: "data")
  List<EmployeeMonthAttendanceData>? data;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "time")
  String? time;

  EmployeeMonthAttendanceModel({
    this.success,
    this.data,
    this.message,
    this.time,
  });

  factory EmployeeMonthAttendanceModel.fromJson(Map<String, dynamic> json) => _$EmployeeMonthAttendanceModelFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeMonthAttendanceModelToJson(this);
}

@JsonSerializable()
class EmployeeMonthAttendanceData {
  @JsonKey(name: "attendance_date")
  DateTime? attendanceDate;
  @JsonKey(name: "attendance_status")
  String? attendanceStatus;

  EmployeeMonthAttendanceData({
    this.attendanceDate,
    this.attendanceStatus,
  });

  factory EmployeeMonthAttendanceData.fromJson(Map<String, dynamic> json) => _$EmployeeMonthAttendanceDataFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeMonthAttendanceDataToJson(this);
}

