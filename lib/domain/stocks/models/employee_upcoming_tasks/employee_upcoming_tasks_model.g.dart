// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_upcoming_tasks_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeeUpcomingTasksModel _$EmployeeUpcomingTasksModelFromJson(
        Map<String, dynamic> json) =>
    EmployeeUpcomingTasksModel(
      success: json['success'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) =>
              EmployeeUpcomingTasksData.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      time: json['time'] as String?,
    );

Map<String, dynamic> _$EmployeeUpcomingTasksModelToJson(
        EmployeeUpcomingTasksModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
      'time': instance.time,
    };

EmployeeUpcomingTasksData _$EmployeeUpcomingTasksDataFromJson(
        Map<String, dynamic> json) =>
    EmployeeUpcomingTasksData(
      taskId: json['task_id'] as int?,
      shopId: json['shop_id'] as int?,
      division: json['division'] as String?,
      taskTitle: json['task_title'] as String?,
      assignedTo: json['assigned_to'] as int?,
      assignedBy: json['assigned_by'] as int?,
      priorityLevel: json['priority_level'] as String?,
      deadline: json['deadline'] as String?,
      taskStatus: json['task_status'] as String?,
      status: json['status'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$EmployeeUpcomingTasksDataToJson(
        EmployeeUpcomingTasksData instance) =>
    <String, dynamic>{
      'task_id': instance.taskId,
      'shop_id': instance.shopId,
      'division': instance.division,
      'task_title': instance.taskTitle,
      'assigned_to': instance.assignedTo,
      'assigned_by': instance.assignedBy,
      'priority_level': instance.priorityLevel,
      'deadline': instance.deadline,
      'task_status': instance.taskStatus,
      'status': instance.status,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
