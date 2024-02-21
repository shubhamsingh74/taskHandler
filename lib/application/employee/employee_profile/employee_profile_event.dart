// ignore_for_file: public_member_api_docs, sort_constructors_first


part of 'employee_profile_bloc.dart';


@immutable
abstract class EmployeeProfileEvent {}

class EmployeeProfileDetailsEvent extends EmployeeProfileEvent {}


class EmployeeProfileAttendanceByMonthEvent
    extends EmployeeProfileEvent {
  String staffId;
  String month;
  String year;

  EmployeeProfileAttendanceByMonthEvent(
      {required this.staffId,
        required this.month,
        required this.year,});
}



class EmployeeProfileAttendanceByDayEvent
    extends EmployeeProfileEvent {
  DateTime dateTime;
  String staffId;

  EmployeeProfileAttendanceByDayEvent({
    required this.staffId,
    required this.dateTime,
  });
}



