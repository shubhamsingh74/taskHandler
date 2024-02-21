import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:quickprism/domain/user/i_user_repo.dart';
import 'package:quickprism/domain/user/models/employee_day_attendance/employee_day_attendance_model.dart';
import 'package:quickprism/domain/user/models/employee_month_attendance/employee_month_attendance_model.dart';
import 'package:quickprism/domain/user/user_constants.dart';

part 'employee_attendance_event.dart';
part 'employee_attendance_state.dart';


@injectable
class EmployeeAttendanceBloc extends Bloc<EmployeeAttendanceEvent, EmployeeAttendanceState> {
  final IUserRepo _userRepo;
  EmployeeAttendanceBloc(this._userRepo)
      : super(EmployeeAttendanceInitialState()) {

    on<EmployeeGetAttendanceByMonthEvent>(
        _getEmployeeAttendanceByMonth);

    on<EmployeeGetAttendanceByDayEvent>(
        _getEmployeeAttendanceByDay);

  }

  // get staff attendance by month
  Future<void> _getEmployeeAttendanceByMonth(
      EmployeeGetAttendanceByMonthEvent event,
      Emitter<EmployeeAttendanceState> emit) async {
    emit(EmployeeAttendanceByMonthLoadingState());

    final res = await _userRepo.getEmployeeAttendanceByMonth(
        staffId: event.staffId, year: event.year, month: event.month);


    emit(res.fold((l) {
      return EmployeeAttendanceByMonthErrorState();
    }, (r) {

      Map<DateTime, String> mp = {};
      //List<int> present = [];
      for (var t in r.data!) {
        mp.addAll({
          DateTime.utc(t.attendanceDate!.year, t.attendanceDate!.month,
              t.attendanceDate!.day):
          t.attendanceStatus.toString()
        });
        // if(t.attendanceStatus.toString() == "Present"){
        //   present.add(t as int);
        // }
      }
      DateTime? startDate = (UserConstants.employeeDetails?.employeeProfile?.createdAt ?? 0) as DateTime?;
      DateTime endDate = DateTime.now();
      Duration difference = endDate.difference(startDate!);
      int numberOfDaysEmployeeWorks = difference.inDays;


      return EmployeeAttendanceByMonthSuccessState(
          employeeMonthAttendanceModel: r,
          attendanceMap: mp,
          staffId: event.staffId,
          totalDaysEmployeeWorks: numberOfDaysEmployeeWorks
      );
    }));
  }



  Future<void> _getEmployeeAttendanceByDay(
      EmployeeGetAttendanceByDayEvent event,
      Emitter<EmployeeAttendanceState> emit) async {
    emit(EmployeeAttendanceByDayLoadingState());
    final res = await _userRepo.getEmployeeAttendanceByDay(
        staffId: event.staffId,
        year: event.dateTime.year.toString(),
        month: event.dateTime.month.toString(),
        day: event.dateTime.day.toString());
    res.fold(
            (l) => {
          emit(EmployeeAttendanceByDayErrorState()),
        }, (r) {
      emit(EmployeeAttendanceByDaySuccessState(employeeDayAttendanceModel: r));
    });
  }



}