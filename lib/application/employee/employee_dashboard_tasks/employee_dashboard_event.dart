// ignore_for_file: public_member_api_docs, sort_constructors_first
part of "employee_dashboard_bloc.dart";

@immutable
abstract class EmployeeDashboardEvent {}

class EmployeeGetAllTaskEvent extends EmployeeDashboardEvent {}

class EmployeeCheckInCheckOutEvent extends EmployeeDashboardEvent {
  final String checkInTime;
  final String checkOutTime;
  final String attendanceStatus;
  final Date date;
  final EmployeeCheckInCheckOutModel employeeCheckInCheckOutModel;

  EmployeeCheckInCheckOutEvent(
      {required this.attendanceStatus,
      required this.checkInTime,
      required this.checkOutTime,
      required this.date,
      required this.employeeCheckInCheckOutModel});
}
