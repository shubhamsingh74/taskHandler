// ignore_for_file: public_member_api_docs, sort_constructors_first


part of 'employee_attendance_bloc.dart';


@immutable
abstract class EmployeeAttendanceEvent {}

class EmployeeGetAttendanceByMonthEvent
    extends EmployeeAttendanceEvent {
  String staffId;
  String month;
  String year;

  EmployeeGetAttendanceByMonthEvent(
      {required this.staffId,
        required this.month,
        required this.year,});
}

class EmployeeGetAttendanceByDayEvent
    extends EmployeeAttendanceEvent {
  DateTime dateTime;
  String staffId;

  EmployeeGetAttendanceByDayEvent({
    required this.staffId,
    required this.dateTime,
  });
}



