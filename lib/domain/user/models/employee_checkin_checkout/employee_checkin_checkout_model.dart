import 'package:json_annotation/json_annotation.dart';

part 'employee_checkin_checkout_model.g.dart';

@JsonSerializable()
class EmployeeCheckInCheckOutModel {
  @JsonKey(name: "check_in")
  String? checkIn;
  @JsonKey(name: "check_out")
  String? checkOut;
  @JsonKey(name: "attendance_status")
  String? attendanceStatus;
  @JsonKey(name: "check_in_address")
  EmployeeCheckAddressData? checkInAddress;
  @JsonKey(name: "check_out_address")
  EmployeeCheckAddressData? checkOutAddress;

  EmployeeCheckInCheckOutModel({
    this.checkIn,
    this.checkOut,
    this.attendanceStatus,
    this.checkInAddress,
    this.checkOutAddress,
  });

  factory EmployeeCheckInCheckOutModel.fromJson(Map<String, dynamic> json) => _$EmployeeCheckInCheckOutModelFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeCheckInCheckOutModelToJson(this);
}

@JsonSerializable()
class EmployeeCheckAddressData {
  @JsonKey(name: "state")
  String? state;
  @JsonKey(name: "city")
  String? city;
  @JsonKey(name: "pincode")
  int? pincode;
  @JsonKey(name: "street_address")
  String? streetAddress;

  EmployeeCheckAddressData({
    this.state,
    this.city,
    this.pincode,
    this.streetAddress,
  });

  factory EmployeeCheckAddressData.fromJson(Map<String, dynamic> json) => _$EmployeeCheckAddressDataFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeCheckAddressDataToJson(this);
}
