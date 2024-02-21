import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:quickprism/core/utils/extensions.dart';
import 'package:quickprism/domain/user/models/staff/staff_attendance_by_day_model.dart';
import 'package:quickprism/domain/user/models/staff/staff_attendance_by_month_model.dart';
import 'package:quickprism/domain/user/models/staff/staff_model.dart';
import 'package:quickprism/domain/user/user_constants.dart';
import 'package:quickprism/main.dart';

import '../../../domain/user/i_user_repo.dart';

part 'business_staff_management_event.dart';
part 'business_staff_management_state.dart';

@injectable
class BusinessStaffManagementBloc
    extends Bloc<BusinessStaffManagementEvent, BusinessStaffManagementState> {
  final IUserRepo _userRepo;
  BusinessStaffManagementBloc(this._userRepo)
      : super(BusinessStaffManagementInitialState()) {
    on<BusinessStaffManagementInitialEvent>(_getAllStaff);
    on<BusinessStaffManagementAddNewStaffInitialEvent>(
      (event, emit) {
        emit(BusinessStaffManagementNewStaffInitialState());
      },
    );
    on<BusinessStaffManagementAddNewStaffEvent>(_addNewStaff);
    on<BusinessStaffManagementGetStaffAttendanceByMonthEvent>(
        _getStaffAttendanceByMonth);
    on<BusinessStaffManagementGetStaffAttendanceByDayEvent>(
        _getStaffAttendanceByDay);
    on<BusinessStaffManagementUpdateStaffAttendanceDataEvent>(
        _updateStaffAttendanceData);
  }

  Future<void> _getAllStaff(BusinessStaffManagementInitialEvent event,
      Emitter<BusinessStaffManagementState> emit) async {
    emit(BusinessStaffManagementLoadingState());
    var t = UserConstants.currentUser;

    if (t?.data?.businessDetails != null) {
      final res = await _userRepo
          .getAllStaff(
              businessId: t?.data?.businessDetails?.businessProfile?.businessId
                      .toString() ??
                  "")
          .then((res) {
        res.fold((l) {
          emit(BusinessStaffManagementErrorState());
        }, (r) {
          if (r.data != null && r.data!.isEmpty) {
            emit(BusinessStaffManagementNoStaffState());
            emit(BusinessStaffManagementNoStaffState());
          } else {
            emit(BusinessStaffManagementSuccessState(staffModel: r));
          }
        });
      }).onError((error, stackTrace) {
        if (devMode) stackTrace.log(event.toString());
      });
    } else {
      emit(BusinessStaffManagementProfileIncompleteState());
    }
  }

  // add new staff

  Future<void> _addNewStaff(BusinessStaffManagementAddNewStaffEvent event,
      Emitter<BusinessStaffManagementState> emit) async {
    emit(BusinessStaffManagementLoadingState());
    var t = UserConstants.currentUser;
    final res = await _userRepo.addNewStaff(
      businessId:
          t?.data?.businessDetails?.businessProfile?.businessId.toString() ??
              "",
      qpId: event.qpId,
      name: event.name,
      mobileNo: event.mobileNo,
      role: event.role,
      isAttendanceAndSalary: event.isAttendanceAndSalary,
      salaryAmount: event.salaryAmount,
      salaryInterval: event.salaryInterval,
      salaryStartedDate: event.salaryStartedDate,
    );
    res.fold((l) {
      emit(BusinessStaffManagementErrorState());
    }, (r) {
      emit(BusinessStaffManagementNewStaffAddedState());
    });
  }

  // get staff attendance by month
  Future<void> _getStaffAttendanceByMonth(
      BusinessStaffManagementGetStaffAttendanceByMonthEvent event,
      Emitter<BusinessStaffManagementState> emit) async {
    emit(BusinessStaffManagementStaffAttendanceByMonthLoadingState());

    final res = await _userRepo.getStaffAttendanceByMonth(
        staffId: event.staffId, year: event.year, month: event.month);

    res.fold(
      (l) {
        emit(BusinessStaffManagementStaffAttendanceByMonthErrorState());
      },
      (r) {
        Map<DateTime, String> mp = {};
        for (var t in r.data!) {
          mp.addAll({
            DateTime.utc(t.attendanceDate!.year, t.attendanceDate!.month,
                    t.attendanceDate!.day):
                t.attendanceStatus.toString().split(".")[1]
          });
        }
        emit(BusinessStaffManagementStaffAttendanceByMonthSuccessState(
            staffAttendanceByMonthModel: r,
            qpId: event.qpId,
            attendanceMap: mp,
            staffName: event.staffName,
            staffId: event.staffId));
        // emit(BusinessStaffManagementStaffAttendanceByMonthSuccess2State());
      },
    );
    emit(res.fold((l) {
      //  emit(BusinessStaffManagementStaffAttendanceByMonthErrorState());
      return BusinessStaffManagementStaffAttendanceByMonthErrorState();
    }, (r) {
      Map<DateTime, String> mp = {};
      for (var t in r.data!) {
        mp.addAll({
          DateTime.utc(t.attendanceDate!.year, t.attendanceDate!.month,
                  t.attendanceDate!.day):
              t.attendanceStatus.toString().split(".")[1]
        });
      }
      // emit(BusinessStaffManagementStaffAttendanceByMonthSuccessState(
      //   staffAttendanceByMonthModel: r,
      //   qpId: event.qpId,
      //   attendanceMap: mp,
      //   staffName: event.staffName,
      // ));
      return BusinessStaffManagementStaffAttendanceByMonthSuccessState(
          staffAttendanceByMonthModel: r,
          qpId: event.qpId,
          attendanceMap: mp,
          staffName: event.staffName,
          staffId: event.staffId);
    }));
  }

  Future<void> _getStaffAttendanceByDay(
      BusinessStaffManagementGetStaffAttendanceByDayEvent event,
      Emitter<BusinessStaffManagementState> emit) async {
    emit(BusinessStaffManagementStaffAttendanceByDayLoadingState());
    final res = await _userRepo.getStaffAttendanceByDay(
        staffId: event.staffId,
        year: event.dateTime.year.toString(),
        month: event.dateTime.month.toString(),
        day: event.dateTime.day.toString());
    res.fold(
        (l) => {
              emit(BusinessStaffManagementStaffAttendanceByDayErrorState()),
            }, (r) {
      emit(BusinessStaffManagementStaffAttendanceByDaySuccessState(
          staffAttendanceByDayModel: r));
    });
  }

  Future<void> _updateStaffAttendanceData(
      BusinessStaffManagementUpdateStaffAttendanceDataEvent event,
      Emitter<BusinessStaffManagementState> emit) async {
    emit(BusinessStaffManagementUpdateStaffAttendanceDataLoadingState());
    final res = await _userRepo.updateStaffAttendanceData(
        checkInTime: event.checkInTime,
        checkOutTime: event.checkOutTime,
        attendanceStatus: event.attendanceStatus,
        checkInState: event.checkInState,
        checkInCity: event.checkInCity,
        checkInPinCode: event.checkInPinCode,
        checkInStreetAddress: event.checkInStreetAddress,
        checkOutState: event.checkOutState,
        checkOutCity: event.checkOutCity,
        checkOutPinCode: event.checkOutPinCode,
        checkOutStreetAddress: event.checkOutStreetAddress,
        date: event.date,
        staffId: event.staffId);
    res.fold((l) {
      emit(BusinessStaffManagementUpdateStaffAttendanceDataErrorState());
    },
        (r) => {
              emit(BusinessStaffManagementUpdateStaffAttendanceDataSuccessState(
                date: event.date,
                staffId: event.staffId,
              )),
            });
  }
}
