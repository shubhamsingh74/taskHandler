import 'package:json_annotation/json_annotation.dart';

part 'employee_day_attendance_model.g.dart';


@JsonSerializable()
class EmployeeDayAttendanceModel {
  @JsonKey(name: "success")
  bool? success;
  @JsonKey(name: "data")
  EmployeeDayAttendanceData? data;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "time")
  String? time;

  EmployeeDayAttendanceModel({
    this.success,
    this.data,
    this.message,
    this.time,
  });

  factory EmployeeDayAttendanceModel.fromJson(Map<String, dynamic> json) => _$EmployeeDayAttendanceModelFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeDayAttendanceModelToJson(this);
}

@JsonSerializable()
class EmployeeDayAttendanceData {
  @JsonKey(name: "staff_id")
  String? staffId;
  @JsonKey(name: "attendance_date")
  DateTime? attendanceDate;
  @JsonKey(name: "attendance_status")
  String? attendanceStatus;
  @JsonKey(name: "check_in")
  String? checkIn;
  @JsonKey(name: "check_out")
  String? checkOut;
  @JsonKey(name: "check_in_address")
  EmployeeCheckAddressData? checkInAddress;
  @JsonKey(name: "check_out_address")
  EmployeeCheckAddressData? checkOutAddress;

  EmployeeDayAttendanceData({
    this.staffId,
    this.attendanceDate,
    this.attendanceStatus,
    this.checkIn,
    this.checkOut,
    this.checkInAddress,
    this.checkOutAddress,
  });

  factory EmployeeDayAttendanceData.fromJson(Map<String, dynamic> json) => _$EmployeeDayAttendanceDataFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeDayAttendanceDataToJson(this);
}

@JsonSerializable()
class EmployeeCheckAddressData {
  @JsonKey(name: "street_address")
  String? streetAddress;
  @JsonKey(name: "pincode")
  int? pincode;
  @JsonKey(name: "city")
  String? city;
  @JsonKey(name: "state")
  String? state;

  EmployeeCheckAddressData({
    this.streetAddress,
    this.pincode,
    this.city,
    this.state,
  });

  factory EmployeeCheckAddressData.fromJson(Map<String, dynamic> json) => _$EmployeeCheckAddressDataFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeCheckAddressDataToJson(this);
}
