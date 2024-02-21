// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_dashboard_status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeeDashboardStatusModel _$EmployeeDashboardStatusModelFromJson(
        Map<String, dynamic> json) =>
    EmployeeDashboardStatusModel(
      success: json['success'] as bool?,
      employeeTaskData: (json['data'] as List<dynamic>?)
          ?.map((e) => EmployeeTaskData.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      time: json['time'] as String?,
    );

Map<String, dynamic> _$EmployeeDashboardStatusModelToJson(
        EmployeeDashboardStatusModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.employeeTaskData,
      'message': instance.message,
      'time': instance.time,
    };

EmployeeTaskData _$EmployeeTaskDataFromJson(Map<String, dynamic> json) =>
    EmployeeTaskData(
      taskId: json['task_id'] as int?,
      shopId: json['shop_id'] as int?,
      division: json['division'] as String?,
      taskTitle: json['task_title'] as String?,
      assignedTo: json['assigned_to'] as int?,
      assignedBy: json['assigned_by'] as int?,
      priorityLevel: json['priority_level'] as String?,
      deadline: json['deadline'] == null
          ? null
          : DateTime.parse(json['deadline'] as String),
      taskStatus: json['task_status'] as String?,
      status: json['status'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$EmployeeTaskDataToJson(EmployeeTaskData instance) =>
    <String, dynamic>{
      'task_id': instance.taskId,
      'shop_id': instance.shopId,
      'division': instance.division,
      'task_title': instance.taskTitle,
      'assigned_to': instance.assignedTo,
      'assigned_by': instance.assignedBy,
      'priority_level': instance.priorityLevel,
      'deadline': instance.deadline?.toIso8601String(),
      'task_status': instance.taskStatus,
      'status': instance.status,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
