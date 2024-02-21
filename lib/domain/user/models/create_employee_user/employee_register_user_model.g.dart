// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_register_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeeRegisterUserModel _$EmployeeRegisterUserModelFromJson(
        Map<String, dynamic> json) =>
    EmployeeRegisterUserModel(
      empName: json['emp_name'] as String?,
      empAddress: json['emp_address'] as String?,
      empEmail: json['emp_email'] as String?,
    );

Map<String, dynamic> _$EmployeeRegisterUserModelToJson(
        EmployeeRegisterUserModel instance) =>
    <String, dynamic>{
      'emp_name': instance.empName,
      'emp_address': instance.empAddress,
      'emp_email': instance.empEmail,
    };
