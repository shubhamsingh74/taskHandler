// To parse this JSON data, do
//
//     final staffAttendanceByDayModel = staffAttendanceByDayModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'staff_attendance_by_day_model.g.dart';

StaffAttendanceByDayModel staffAttendanceByDayModelFromJson(String str) =>
    StaffAttendanceByDayModel.fromJson(json.decode(str));

String staffAttendanceByDayModelToJson(StaffAttendanceByDayModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class StaffAttendanceByDayModel {
  @JsonKey(name: "success")
  final bool? success;
  @JsonKey(name: "data")
  final StaffAttendanceByDayData? data;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "time")
  final String? time;

  StaffAttendanceByDayModel({
    this.success,
    this.data,
    this.message,
    this.time,
  });

  factory StaffAttendanceByDayModel.fromJson(Map<String, dynamic> json) =>
      _$StaffAttendanceByDayModelFromJson(json);

  Map<String, dynamic> toJson() => _$StaffAttendanceByDayModelToJson(this);
}

@JsonSerializable()
class StaffAttendanceByDayData {
  @JsonKey(name: "staff_id")
  final String? staffId;
  @JsonKey(name: "attendance_date")
  final DateTime? attendanceDate;
  @JsonKey(name: "attendance_status")
  final String? attendanceStatus;
  @JsonKey(name: "check_in")
  final String? checkIn;
  @JsonKey(name: "check_out")
  final String? checkOut;
  @JsonKey(name: "check_in_address")
  final CheckAddress? checkInAddress;
  @JsonKey(name: "check_out_address")
  final CheckAddress? checkOutAddress;

  StaffAttendanceByDayData({
    this.staffId,
    this.attendanceDate,
    this.attendanceStatus,
    this.checkIn,
    this.checkOut,
    this.checkInAddress,
    this.checkOutAddress,
  });

  factory StaffAttendanceByDayData.fromJson(Map<String, dynamic> json) =>
      _$StaffAttendanceByDayDataFromJson(json);

  Map<String, dynamic> toJson() => _$StaffAttendanceByDayDataToJson(this);
}

@JsonSerializable()
class CheckAddress {
  @JsonKey(name: "street_address")
  final String? streetAddress;
  @JsonKey(name: "pincode")
  final int? pincode;
  @JsonKey(name: "city")
  final String? city;
  @JsonKey(name: "state")
  final String? state;

  CheckAddress({
    this.streetAddress,
    this.pincode,
    this.city,
    this.state,
  });

  factory CheckAddress.fromJson(Map<String, dynamic> json) =>
      _$CheckAddressFromJson(json);

  Map<String, dynamic> toJson() => _$CheckAddressToJson(this);
}
