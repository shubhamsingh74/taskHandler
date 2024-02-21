// To parse this JSON data, do
//
//     final staffModel = staffModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'staff_model.g.dart';

StaffModel staffModelFromJson(String str) => StaffModel.fromJson(json.decode(str));

String staffModelToJson(StaffModel data) => json.encode(data.toJson());

@JsonSerializable()
class StaffModel {
    @JsonKey(name: "success")
    final bool? success;
    @JsonKey(name: "data")
    final List<StaffDatum>? data;
    @JsonKey(name: "message")
    final String? message;
    @JsonKey(name: "time")
    final String? time;

    StaffModel({
        this.success,
        this.data,
        this.message,
        this.time,
    });

    factory StaffModel.fromJson(Map<String, dynamic> json) => _$StaffModelFromJson(json);

    Map<String, dynamic> toJson() => _$StaffModelToJson(this);
}

@JsonSerializable()
class StaffDatum {
    @JsonKey(name: "staff_id")
    final int? staffId;
    @JsonKey(name: "qpid")
    final int? qpid;
    @JsonKey(name: "name")
    final String? name;
    @JsonKey(name: "mobile_number")
    final String? mobileNumber;
    @JsonKey(name: "role")
    final String? role;
    @JsonKey(name: "salary_start_date")
    final String? salaryStartDate;
    @JsonKey(name: "salary_interval")
    final String? salaryInterval;
    @JsonKey(name: "salary_amount")
    final int? salaryAmount;
    @JsonKey(name: "todays_attendance")
    final String? todaysAttendance;

    StaffDatum({
        this.staffId,
        this.qpid,
        this.name,
        this.mobileNumber,
        this.role,
        this.salaryStartDate,
        this.salaryInterval,
        this.salaryAmount,
        this.todaysAttendance,
    });

    factory StaffDatum.fromJson(Map<String, dynamic> json) => _$StaffDatumFromJson(json);

    Map<String, dynamic> toJson() => _$StaffDatumToJson(this);
}
