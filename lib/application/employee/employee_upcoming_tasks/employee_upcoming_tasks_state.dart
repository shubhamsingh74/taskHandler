// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'employee_upcoming_tasks_bloc.dart';

@immutable
abstract class EmployeeUpcomingTasksState {}

class EmployeeTasksInitialState extends EmployeeUpcomingTasksState {}

class EmployeeTasksLoadingState extends EmployeeUpcomingTasksState {}

class EmployeeTasksUpcomingSuccessState extends EmployeeUpcomingTasksState {
  // final EmployeeUpcomingTasksModel employeeUpcomingTasksModel;
  // EmployeeTasksUpcomingSuccessState({
  //   required this.employeeUpcomingTasksModel,
  // });
  List<EmployeeUpcomingTasksData> salesDivision;
  List<EmployeeUpcomingTasksData> purchaseDivision;
  List<EmployeeUpcomingTasksData> stockDivision;
  EmployeeTasksUpcomingSuccessState({
    required this.salesDivision,
    required this.purchaseDivision,
    required this.stockDivision,
  });
}
class EmployeeTasksErrorState extends EmployeeUpcomingTasksState {}



class EmployeeStartWorkingTaskSuccessState extends EmployeeUpcomingTasksState {}
