
import 'package:json_annotation/json_annotation.dart';

part 'employee_start_working_model.g.dart';

@JsonSerializable()
class EmployeeStartWorkingModel {
  @JsonKey(name: "newStatus")
  String? newStatus;

  EmployeeStartWorkingModel({
    this.newStatus,
  });

  factory EmployeeStartWorkingModel.fromJson(Map<String, dynamic> json) => _$EmployeeStartWorkingModelFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeStartWorkingModelToJson(this);
}
