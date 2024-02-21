// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_checkin_checkout_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeeCheckInCheckOutModel _$EmployeeCheckInCheckOutModelFromJson(
        Map<String, dynamic> json) =>
    EmployeeCheckInCheckOutModel(
      checkIn: json['check_in'] as String?,
      checkOut: json['check_out'] as String?,
      attendanceStatus: json['attendance_status'] as String?,
      checkInAddress: json['check_in_address'] == null
          ? null
          : EmployeeCheckAddressData.fromJson(
              json['check_in_address'] as Map<String, dynamic>),
      checkOutAddress: json['check_out_address'] == null
          ? null
          : EmployeeCheckAddressData.fromJson(
              json['check_out_address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EmployeeCheckInCheckOutModelToJson(
        EmployeeCheckInCheckOutModel instance) =>
    <String, dynamic>{
      'check_in': instance.checkIn,
      'check_out': instance.checkOut,
      'attendance_status': instance.attendanceStatus,
      'check_in_address': instance.checkInAddress,
      'check_out_address': instance.checkOutAddress,
    };

EmployeeCheckAddressData _$EmployeeCheckAddressDataFromJson(
        Map<String, dynamic> json) =>
    EmployeeCheckAddressData(
      state: json['state'] as String?,
      city: json['city'] as String?,
      pincode: json['pincode'] as int?,
      streetAddress: json['street_address'] as String?,
    );

Map<String, dynamic> _$EmployeeCheckAddressDataToJson(
        EmployeeCheckAddressData instance) =>
    <String, dynamic>{
      'state': instance.state,
      'city': instance.city,
      'pincode': instance.pincode,
      'street_address': instance.streetAddress,
    };
