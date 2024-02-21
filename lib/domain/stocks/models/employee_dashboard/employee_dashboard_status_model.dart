import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'employee_dashboard_status_model.g.dart';

EmployeeDashboardStatusModel employeeDashboardStatusModelFromJson(String str) => EmployeeDashboardStatusModel.fromJson(json.decode(str));

String employeeDashboardStatusModelToJson(EmployeeDashboardStatusModel data) => json.encode(data.toJson());

@JsonSerializable()
class EmployeeDashboardStatusModel {
  @JsonKey(name: "success")
  bool? success;
  @JsonKey(name: "data")
  List<EmployeeTaskData>? employeeTaskData;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "time")
  String? time;

  EmployeeDashboardStatusModel({
    this.success,
    this.employeeTaskData,
    this.message,
    this.time,
  });

  factory EmployeeDashboardStatusModel.fromJson(Map<String, dynamic> json) => _$EmployeeDashboardStatusModelFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeDashboardStatusModelToJson(this);
}

@JsonSerializable()
class EmployeeTaskData {
  @JsonKey(name: "task_id")
  int? taskId;
  @JsonKey(name: "shop_id")
  int? shopId;
  @JsonKey(name: "division")
  String? division;
  @JsonKey(name: "task_title")
  String? taskTitle;
  @JsonKey(name: "assigned_to")
  int? assignedTo;
  @JsonKey(name: "assigned_by")
  int? assignedBy;
  @JsonKey(name: "priority_level")
  String? priorityLevel;
  @JsonKey(name: "deadline")
  DateTime? deadline;
  @JsonKey(name: "task_status")
  String? taskStatus;
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "created_at")
  DateTime? createdAt;
  @JsonKey(name: "updated_at")
  DateTime? updatedAt;

  EmployeeTaskData({
    this.taskId,
    this.shopId,
    this.division,
    this.taskTitle,
    this.assignedTo,
    this.assignedBy,
    this.priorityLevel,
    this.deadline,
    this.taskStatus,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory EmployeeTaskData.fromJson(Map<String, dynamic> json) => _$EmployeeTaskDataFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeTaskDataToJson(this);
}
