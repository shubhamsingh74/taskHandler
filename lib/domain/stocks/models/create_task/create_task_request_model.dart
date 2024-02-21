// To parse this JSON data, do
//
//     final createTaskRequestModel = createTaskRequestModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'create_task_request_model.g.dart';

CreateTaskRequestModel createTaskRequestModelFromJson(String str) => CreateTaskRequestModel.fromJson(json.decode(str));

String createTaskRequestModelToJson(CreateTaskRequestModel data) => json.encode(data.toJson());

@JsonSerializable()
class CreateTaskRequestModel {
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
    @JsonKey(name: "created_at")
    DateTime? createdAt;
    @JsonKey(name: "updated_at")
    DateTime? updatedAt;

    CreateTaskRequestModel({
        this.shopId,
        this.division,
        this.taskTitle,
        this.assignedTo,
        this.assignedBy,
        this.priorityLevel,
        this.deadline,
        this.createdAt,
        this.updatedAt,
    });

    factory CreateTaskRequestModel.fromJson(Map<String, dynamic> json) => _$CreateTaskRequestModelFromJson(json);

    Map<String, dynamic> toJson() => _$CreateTaskRequestModelToJson(this);
}
