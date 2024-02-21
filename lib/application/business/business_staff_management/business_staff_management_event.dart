// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'business_staff_management_bloc.dart';

@immutable
abstract class BusinessStaffManagementEvent {}

class BusinessStaffManagementInitialEvent
    extends BusinessStaffManagementEvent {}

class BusinessStaffManagementAddNewStaffInitialEvent
    extends BusinessStaffManagementEvent {}

class BusinessStaffManagementAddNewStaffEvent
    extends BusinessStaffManagementEvent {
  String qpId;
  String name;
  String mobileNo;
  String role;
  bool isAttendanceAndSalary;
  String? salaryAmount;
  String? salaryInterval;
  String? salaryStartedDate;

  BusinessStaffManagementAddNewStaffEvent({
    required this.qpId,
    required this.name,
    required this.mobileNo,
    required this.role,
    required this.isAttendanceAndSalary,
    required this.salaryAmount,
    required this.salaryInterval,
    required this.salaryStartedDate,
  });
}

// 

class BusinessStaffManagementGetStaffAttendanceByMonthEvent
    extends BusinessStaffManagementEvent {
  String staffId;
  String month;
  String year;
  String qpId;
  String staffName;

  BusinessStaffManagementGetStaffAttendanceByMonthEvent(
      {required this.staffId,
      required this.month,
      required this.year,
      required this.qpId,
      required this.staffName});
}

class BusinessStaffManagementGetStaffAttendanceByDayEvent
    extends BusinessStaffManagementEvent {
  DateTime dateTime;
  String staffId;

  BusinessStaffManagementGetStaffAttendanceByDayEvent({
    required this.staffId,
    required this.dateTime,
  });
}

class BusinessStaffManagementUpdateStaffAttendanceDataEvent
    extends BusinessStaffManagementEvent {
  String checkInTime;
  String checkOutTime;
  String attendanceStatus;
  String checkInState;
  String checkInCity;
  String checkInPinCode;
  String checkInStreetAddress;
  String checkOutState;
  String checkOutCity;
  String checkOutPinCode;
  String checkOutStreetAddress;
  DateTime date;
  String staffId;

  BusinessStaffManagementUpdateStaffAttendanceDataEvent({
    required this.checkInTime,
    required this.checkOutTime,
    required this.attendanceStatus,
    required this.checkInState,
    required this.checkInCity,
    required this.checkInPinCode,
    required this.checkInStreetAddress,
    required this.checkOutState,
    required this.checkOutCity,
    required this.checkOutPinCode,
    required this.checkOutStreetAddress,
    required this.date,
    required this.staffId,
  });
}
