
part of 'employee_attendance_bloc.dart';


@immutable
abstract class EmployeeAttendanceState {}

class EmployeeAttendanceInitialState extends EmployeeAttendanceState{}

class EmployeeAttendanceByMonthSuccessState extends EmployeeAttendanceState {
  EmployeeMonthAttendanceModel employeeMonthAttendanceModel;
  String staffId;
  int totalDaysEmployeeWorks;
  Map<DateTime, String> attendanceMap;
  EmployeeAttendanceByMonthSuccessState({
    required this.employeeMonthAttendanceModel,
    required this.staffId,
    required this.totalDaysEmployeeWorks,
    required this.attendanceMap,
  });
}
class EmployeeAttendanceByMonthErrorState
    extends EmployeeAttendanceState {}

class EmployeeAttendanceByMonthLoadingState
    extends EmployeeAttendanceState {}



///--------day states
class EmployeeAttendanceByDayErrorState
    extends EmployeeAttendanceState {}

class EmployeeAttendanceByDayLoadingState
    extends EmployeeAttendanceState {}

class EmployeeAttendanceByDaySuccessState extends EmployeeAttendanceState {
  EmployeeDayAttendanceModel employeeDayAttendanceModel;

  EmployeeAttendanceByDaySuccessState({
    required this.employeeDayAttendanceModel,
  });
}
