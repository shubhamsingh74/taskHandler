import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'employee_upcoming_tasks_model.g.dart';


@JsonSerializable()
class EmployeeUpcomingTasksModel {
  @JsonKey(name: "success")
  bool? success;
  @JsonKey(name: "data")
  List<EmployeeUpcomingTasksData>? data;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "time")
  String? time;

  EmployeeUpcomingTasksModel({
    this.success,
    this.data,
    this.message,
    this.time,
  });

  factory EmployeeUpcomingTasksModel.fromJson(Map<String, dynamic> json) => _$EmployeeUpcomingTasksModelFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeUpcomingTasksModelToJson(this);
}

@JsonSerializable()
class EmployeeUpcomingTasksData {
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
  String? deadline;
  @JsonKey(name: "task_status")
  String? taskStatus;
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "created_at")
  String? createdAt;
  @JsonKey(name: "updated_at")
  String? updatedAt;

  EmployeeUpcomingTasksData({
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

  factory EmployeeUpcomingTasksData.fromJson(Map<String, dynamic> json) => _$EmployeeUpcomingTasksDataFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeUpcomingTasksDataToJson(this);
}
