part of 'business_staff_management_bloc.dart';

@immutable
abstract class BusinessStaffManagementState {}

class BusinessStaffManagementInitialState
    extends BusinessStaffManagementState {}

class BusinessStaffManagementLoadingState
    extends BusinessStaffManagementState {}

class BusinessStaffManagementErrorState extends BusinessStaffManagementState {}

class BusinessStaffManagementNoStaffState
    extends BusinessStaffManagementState {}

class BusinessStaffManagementProfileIncompleteState
    extends BusinessStaffManagementState {}

class BusinessStaffManagementSuccessState extends BusinessStaffManagementState {
  final StaffModel? staffModel;

  BusinessStaffManagementSuccessState({this.staffModel});
}

// add staff

class BusinessStaffManagementNewStaffInitialState
    extends BusinessStaffManagementState {}

class BusinessStaffManagementNewStaffAddedState
    extends BusinessStaffManagementState {}

///

class BusinessStaffManagementStaffAttendanceByMonthSuccessState
    extends BusinessStaffManagementState {
  StaffAttendanceByMonthModel staffAttendanceByMonthModel;
  String qpId;
  String staffName;
  String staffId;
  Map<DateTime, String> attendanceMap;
  BusinessStaffManagementStaffAttendanceByMonthSuccessState({
    required this.staffAttendanceByMonthModel,
    required this.qpId,
    required this.staffId,
    required this.attendanceMap,
    required this.staffName,
  });
}

// class BusinessStaffManagementStaffAttendanceByMonthSuccess2State
//     extends BusinessStaffManagementState {}

class BusinessStaffManagementStaffAttendanceByMonthErrorState
    extends BusinessStaffManagementState {}

class BusinessStaffManagementStaffAttendanceByMonthLoadingState
    extends BusinessStaffManagementState {}

class BusinessStaffManagementStaffAttendanceByDayErrorState
    extends BusinessStaffManagementState {}

class BusinessStaffManagementStaffAttendanceByDayLoadingState
    extends BusinessStaffManagementState {}

class BusinessStaffManagementStaffAttendanceByDaySuccessState
    extends BusinessStaffManagementState {
  StaffAttendanceByDayModel? staffAttendanceByDayModel;

  BusinessStaffManagementStaffAttendanceByDaySuccessState({
    this.staffAttendanceByDayModel,
  });
}

class BusinessStaffManagementUpdateStaffAttendanceDataLoadingState
    extends BusinessStaffManagementState {}

class BusinessStaffManagementUpdateStaffAttendanceDataErrorState
    extends BusinessStaffManagementState {}

class BusinessStaffManagementUpdateStaffAttendanceDataSuccessState
    extends BusinessStaffManagementState {
  String staffId;
  DateTime date;
  BusinessStaffManagementUpdateStaffAttendanceDataSuccessState(
      {required this.date, required this.staffId});
}
