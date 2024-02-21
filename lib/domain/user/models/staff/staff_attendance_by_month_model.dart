// To parse this JSON data, do
//
//     final staffAttendanceByMonthModel = staffAttendanceByMonthModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'staff_attendance_by_month_model.g.dart';

StaffAttendanceByMonthModel staffAttendanceByMonthModelFromJson(String str) => StaffAttendanceByMonthModel.fromJson(json.decode(str));

String staffAttendanceByMonthModelToJson(StaffAttendanceByMonthModel data) => json.encode(data.toJson());

@JsonSerializable()
class StaffAttendanceByMonthModel {
    @JsonKey(name: "success")
    final bool? success;
    @JsonKey(name: "data")
    final List<StaffAttendanceByMonthDatum>? data;
    @JsonKey(name: "message")
    final String? message;
    @JsonKey(name: "time")
    final String? time;

    StaffAttendanceByMonthModel({
        this.success,
        this.data,
        this.message,
        this.time,
    });

    StaffAttendanceByMonthModel copyWith({
        bool? success,
        List<StaffAttendanceByMonthDatum>? data,
        String? message,
        String? time,
    }) => 
        StaffAttendanceByMonthModel(
            success: success ?? this.success,
            data: data ?? this.data,
            message: message ?? this.message,
            time: time ?? this.time,
        );

    factory StaffAttendanceByMonthModel.fromJson(Map<String, dynamic> json) => _$StaffAttendanceByMonthModelFromJson(json);

    Map<String, dynamic> toJson() => _$StaffAttendanceByMonthModelToJson(this);
}

@JsonSerializable()
class StaffAttendanceByMonthDatum {
    @JsonKey(name: "attendance_date")
    final DateTime? attendanceDate;
    @JsonKey(name: "attendance_status")
    final AttendanceStatus? attendanceStatus;

    StaffAttendanceByMonthDatum({
        this.attendanceDate,
        this.attendanceStatus,
    });

    StaffAttendanceByMonthDatum copyWith({
        DateTime? attendanceDate,
        AttendanceStatus? attendanceStatus,
    }) => 
        StaffAttendanceByMonthDatum(
            attendanceDate: attendanceDate ?? this.attendanceDate,
            attendanceStatus: attendanceStatus ?? this.attendanceStatus,
        );

    factory StaffAttendanceByMonthDatum.fromJson(Map<String, dynamic> json) => _$StaffAttendanceByMonthDatumFromJson(json);

    Map<String, dynamic> toJson() => _$StaffAttendanceByMonthDatumToJson(this);
}

enum AttendanceStatus {
    @JsonValue("half_day")
    HALF_DAY,
    @JsonValue("paid_leave")
    PAID_LEAVE,
    @JsonValue("present")
    PRESENT
}

final attendanceStatusValues = EnumValues({
    "half_day": AttendanceStatus.HALF_DAY,
    "paid_leave": AttendanceStatus.PAID_LEAVE,
    "present": AttendanceStatus.PRESENT
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
