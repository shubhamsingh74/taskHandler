// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_day_attendance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeeDayAttendanceModel _$EmployeeDayAttendanceModelFromJson(
        Map<String, dynamic> json) =>
    EmployeeDayAttendanceModel(
      success: json['success'] as bool?,
      data: json['data'] == null
          ? null
          : EmployeeDayAttendanceData.fromJson(
              json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      time: json['time'] as String?,
    );

Map<String, dynamic> _$EmployeeDayAttendanceModelToJson(
        EmployeeDayAttendanceModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
      'time': instance.time,
    };

EmployeeDayAttendanceData _$EmployeeDayAttendanceDataFromJson(
        Map<String, dynamic> json) =>
    EmployeeDayAttendanceData(
      staffId: json['staff_id'] as String?,
      attendanceDate: json['attendance_date'] == null
          ? null
          : DateTime.parse(json['attendance_date'] as String),
      attendanceStatus: json['attendance_status'] as String?,
      checkIn: json['check_in'] as String?,
      checkOut: json['check_out'] as String?,
      checkInAddress: json['check_in_address'] == null
          ? null
          : EmployeeCheckAddressData.fromJson(
              json['check_in_address'] as Map<String, dynamic>),
      checkOutAddress: json['check_out_address'] == null
          ? null
          : EmployeeCheckAddressData.fromJson(
              json['check_out_address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EmployeeDayAttendanceDataToJson(
        EmployeeDayAttendanceData instance) =>
    <String, dynamic>{
      'staff_id': instance.staffId,
      'attendance_date': instance.attendanceDate?.toIso8601String(),
      'attendance_status': instance.attendanceStatus,
      'check_in': instance.checkIn,
      'check_out': instance.checkOut,
      'check_in_address': instance.checkInAddress,
      'check_out_address': instance.checkOutAddress,
    };

EmployeeCheckAddressData _$EmployeeCheckAddressDataFromJson(
        Map<String, dynamic> json) =>
    EmployeeCheckAddressData(
      streetAddress: json['street_address'] as String?,
      pincode: json['pincode'] as int?,
      city: json['city'] as String?,
      state: json['state'] as String?,
    );

Map<String, dynamic> _$EmployeeCheckAddressDataToJson(
        EmployeeCheckAddressData instance) =>
    <String, dynamic>{
      'street_address': instance.streetAddress,
      'pincode': instance.pincode,
      'city': instance.city,
      'state': instance.state,
    };
