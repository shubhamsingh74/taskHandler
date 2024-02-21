part of "employee_dashboard_bloc.dart";

@immutable
abstract class EmployeeDashboardState {}

class EmployeeDashboardInitialState extends EmployeeDashboardState {}

class EmployeeDashboardLoadingState extends EmployeeDashboardState {}

class EmployeeDashboardSuccessState extends EmployeeDashboardState {
  // final EmployeeDashboardStatusModel employeeDashboardStatusModel;
  List<EmployeeTaskData> upcomingTasks;
  List<EmployeeTaskData> workingTasks;
  List<EmployeeTaskData> finishedTasks;
  List<EmployeeTaskData> dueTasks;
  EmployeeDashboardSuccessState({required this.upcomingTasks,required this.workingTasks,required this.finishedTasks,required this.dueTasks});
}

class EmployeeDashboardErrorState extends EmployeeDashboardState {}

class EmployeeCheckInCheckOutSuccessState extends EmployeeDashboardState {}
