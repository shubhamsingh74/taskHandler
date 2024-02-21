// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_task_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateTaskRequestModel _$CreateTaskRequestModelFromJson(
        Map<String, dynamic> json) =>
    CreateTaskRequestModel(
      shopId: json['shop_id'] as int?,
      division: json['division'] as String?,
      taskTitle: json['task_title'] as String?,
      assignedTo: json['assigned_to'] as int?,
      assignedBy: json['assigned_by'] as int?,
      priorityLevel: json['priority_level'] as String?,
      deadline: json['deadline'] == null
          ? null
          : DateTime.parse(json['deadline'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$CreateTaskRequestModelToJson(
        CreateTaskRequestModel instance) =>
    <String, dynamic>{
      'shop_id': instance.shopId,
      'division': instance.division,
      'task_title': instance.taskTitle,
      'assigned_to': instance.assignedTo,
      'assigned_by': instance.assignedBy,
      'priority_level': instance.priorityLevel,
      'deadline': instance.deadline?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
