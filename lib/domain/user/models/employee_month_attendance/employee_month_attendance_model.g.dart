// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_month_attendance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeeMonthAttendanceModel _$EmployeeMonthAttendanceModelFromJson(
        Map<String, dynamic> json) =>
    EmployeeMonthAttendanceModel(
      success: json['success'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) =>
              EmployeeMonthAttendanceData.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      time: json['time'] as String?,
    );

Map<String, dynamic> _$EmployeeMonthAttendanceModelToJson(
        EmployeeMonthAttendanceModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
      'time': instance.time,
    };

EmployeeMonthAttendanceData _$EmployeeMonthAttendanceDataFromJson(
        Map<String, dynamic> json) =>
    EmployeeMonthAttendanceData(
      attendanceDate: json['attendance_date'] == null
          ? null
          : DateTime.parse(json['attendance_date'] as String),
      attendanceStatus: json['attendance_status'] as String?,
    );

Map<String, dynamic> _$EmployeeMonthAttendanceDataToJson(
        EmployeeMonthAttendanceData instance) =>
    <String, dynamic>{
      'attendance_date': instance.attendanceDate?.toIso8601String(),
      'attendance_status': instance.attendanceStatus,
    };
