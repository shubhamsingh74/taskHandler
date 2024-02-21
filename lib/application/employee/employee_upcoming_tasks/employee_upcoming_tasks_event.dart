// ignore_for_file: public_member_api_docs, sort_constructors_first


part of 'employee_upcoming_tasks_bloc.dart';


@immutable
abstract class EmployeeUpcomingTasksEvent {}

class EmployeeGetAllUpcomingTasksEvent extends EmployeeUpcomingTasksEvent {

}

class EmployeeStartWorkingTaskEvent extends EmployeeUpcomingTasksEvent {
 final String newStatus;
 final int taskId;
 EmployeeStartWorkingTaskEvent({required this.newStatus,required this.taskId});
}
