
part of 'employee_profile_bloc.dart';

@immutable
abstract class EmployeeProfileState {}

class EmployeeProfileInitialState extends EmployeeProfileState{}



class EmployeeProfileDetailsSuccessState extends EmployeeProfileState{
  final UserModel userModel;
  EmployeeProfileDetailsSuccessState({required this.userModel});
}
class EmployeeProfileDetailsErrorState extends EmployeeProfileState {}
class EmployeeProfileDetailsLoadingState extends EmployeeProfileState {}






class EmployeeProfileAttendanceByMonthSuccessState extends EmployeeProfileState {
  EmployeeMonthAttendanceModel employeeMonthAttendanceModel;
  int month;
  int day;
  int year;
  String staffId;
  Map<DateTime, String> attendanceMap;
  EmployeeProfileAttendanceByMonthSuccessState({
    required this.day,
    required this.month,
    required this.year,
    required this.employeeMonthAttendanceModel,
    required this.staffId,
    required this.attendanceMap,
  });
}
class EmployeeProfileAttendanceByMonthErrorState
    extends EmployeeProfileState {}
class EmployeeProfileAttendanceByMonthLoadingState
    extends EmployeeProfileState {}



///--------day states
class EmployeeProfileAttendanceByDayErrorState
    extends EmployeeProfileState {}
class EmployeeProfileAttendanceByDayLoadingState
    extends EmployeeProfileState {}
class EmployeeProfileAttendanceByDaySuccessState extends EmployeeProfileState {
  EmployeeDayAttendanceModel employeeDayAttendanceModel;
  EmployeeProfileAttendanceByDaySuccessState({
    required this.employeeDayAttendanceModel,
  });
}
