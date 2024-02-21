// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staff_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StaffModel _$StaffModelFromJson(Map<String, dynamic> json) => StaffModel(
      success: json['success'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => StaffDatum.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      time: json['time'] as String?,
    );

Map<String, dynamic> _$StaffModelToJson(StaffModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
      'time': instance.time,
    };

StaffDatum _$StaffDatumFromJson(Map<String, dynamic> json) => StaffDatum(
      staffId: json['staff_id'] as int?,
      qpid: json['qpid'] as int?,
      name: json['name'] as String?,
      mobileNumber: json['mobile_number'] as String?,
      role: json['role'] as String?,
      salaryStartDate: json['salary_start_date'] as String?,
      salaryInterval: json['salary_interval'] as String?,
      salaryAmount: json['salary_amount'] as int?,
      todaysAttendance: json['todays_attendance'] as String?,
    );

Map<String, dynamic> _$StaffDatumToJson(StaffDatum instance) =>
    <String, dynamic>{
      'staff_id': instance.staffId,
      'qpid': instance.qpid,
      'name': instance.name,
      'mobile_number': instance.mobileNumber,
      'role': instance.role,
      'salary_start_date': instance.salaryStartDate,
      'salary_interval': instance.salaryInterval,
      'salary_amount': instance.salaryAmount,
      'todays_attendance': instance.todaysAttendance,
    };
