// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staff_attendance_by_month_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StaffAttendanceByMonthModel _$StaffAttendanceByMonthModelFromJson(
        Map<String, dynamic> json) =>
    StaffAttendanceByMonthModel(
      success: json['success'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) =>
              StaffAttendanceByMonthDatum.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      time: json['time'] as String?,
    );

Map<String, dynamic> _$StaffAttendanceByMonthModelToJson(
        StaffAttendanceByMonthModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
      'time': instance.time,
    };

StaffAttendanceByMonthDatum _$StaffAttendanceByMonthDatumFromJson(
        Map<String, dynamic> json) =>
    StaffAttendanceByMonthDatum(
      attendanceDate: json['attendance_date'] == null
          ? null
          : DateTime.parse(json['attendance_date'] as String),
      attendanceStatus: $enumDecodeNullable(
          _$AttendanceStatusEnumMap, json['attendance_status']),
    );

Map<String, dynamic> _$StaffAttendanceByMonthDatumToJson(
        StaffAttendanceByMonthDatum instance) =>
    <String, dynamic>{
      'attendance_date': instance.attendanceDate?.toIso8601String(),
      'attendance_status': _$AttendanceStatusEnumMap[instance.attendanceStatus],
    };

const _$AttendanceStatusEnumMap = {
  AttendanceStatus.HALF_DAY: 'half_day',
  AttendanceStatus.PAID_LEAVE: 'paid_leave',
  AttendanceStatus.PRESENT: 'present',
};
