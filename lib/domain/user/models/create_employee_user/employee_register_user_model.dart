import 'package:freezed_annotation/freezed_annotation.dart';

part 'employee_register_user_model.g.dart';

@JsonSerializable()
class EmployeeRegisterUserModel {
  @JsonKey(name: "emp_name")
  String? empName;
  @JsonKey(name: "emp_address")
  String? empAddress;
  @JsonKey(name: "emp_email")
  String? empEmail;

  EmployeeRegisterUserModel({
    this.empName,
    this.empAddress,
    this.empEmail,
  });

  factory EmployeeRegisterUserModel.fromJson(Map<String, dynamic> json) => _$EmployeeRegisterUserModelFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeRegisterUserModelToJson(this);
}
