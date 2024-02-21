import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:quickprism/domain/user/i_user_repo.dart';
import 'package:quickprism/domain/user/models/employee_day_attendance/employee_day_attendance_model.dart';
import 'package:quickprism/domain/user/models/employee_month_attendance/employee_month_attendance_model.dart';
import 'package:quickprism/domain/user/models/user_model.dart';
import 'package:quickprism/domain/user/user_constants.dart';

import '../../../infrastructure/auth/auth_service.dart';

part 'employee_profile_event.dart';
part 'employee_profile_state.dart';


@injectable
class EmployeeProfileBloc extends Bloc<EmployeeProfileEvent, EmployeeProfileState> {
  final IUserRepo _userRepo;
  EmployeeProfileBloc(this._userRepo)
      : super(EmployeeProfileInitialState()) {

    on<EmployeeProfileDetailsEvent>(
        _getEmployeeProfileDetails);

    on<EmployeeProfileAttendanceByMonthEvent>(
        _getEmployeeAttendanceByMonth);

    on<EmployeeProfileAttendanceByDayEvent>(
        _getEmployeeAttendanceByDay);

  }

  Future<void> _getEmployeeProfileDetails(
      EmployeeProfileDetailsEvent event,
      Emitter<EmployeeProfileState> emit) async {
    emit(EmployeeProfileDetailsLoadingState());
    var userId = await AuthService().getUserId();
    var response = await _userRepo.getUserDetails(userId: userId!);

    response.fold((l) {
      emit(EmployeeProfileDetailsErrorState());
    }, (r) async {
      emit(EmployeeProfileDetailsSuccessState(userModel: r));
      // UserConstants.staffManagement = r.data?.businessDetails?.staffManagement;
    });
  }




  // get staff attendance by month
  Future<void> _getEmployeeAttendanceByMonth(
      EmployeeProfileAttendanceByMonthEvent event,
      Emitter<EmployeeProfileState> emit) async {
    emit(EmployeeProfileAttendanceByMonthLoadingState());

    final res = await _userRepo.getEmployeeAttendanceByMonth(
        staffId: event.staffId, year: event.year, month: event.month);

    emit(res.fold((l) {
      return EmployeeProfileAttendanceByMonthErrorState();
    }, (r) {
      DateTime dateTime = DateTime.parse(UserConstants.employeeDetails?.employeeProfile?.createdAt.toString()??"");
      int month = dateTime.month;
      int year = dateTime.year;
      int day = dateTime.day;


      Map<DateTime, String> mp = {};
      for (var t in r.data!) {
        mp.addAll({
          DateTime.utc(t.attendanceDate!.year, t.attendanceDate!.month, t.attendanceDate!.day):
          t.attendanceStatus.toString().toUpperCase(),
        });
      }
      return EmployeeProfileAttendanceByMonthSuccessState(
          employeeMonthAttendanceModel: r,
          attendanceMap: mp,
          staffId: event.staffId, month: month, year: year, day: day
      );
    }));
  }



  Future<void> _getEmployeeAttendanceByDay(
      EmployeeProfileAttendanceByDayEvent event,
      Emitter<EmployeeProfileState> emit) async {
    emit(EmployeeProfileAttendanceByDayLoadingState());
    final res = await _userRepo.getEmployeeAttendanceByDay(
        staffId: event.staffId,
        year: event.dateTime.year.toString(),
        month: event.dateTime.month.toString(),
        day: event.dateTime.day.toString());
    res.fold(
            (l) => {
          emit(EmployeeProfileAttendanceByDayErrorState()),
        }, (r) {
      emit(EmployeeProfileAttendanceByDaySuccessState(employeeDayAttendanceModel: r));
    });
  }



}