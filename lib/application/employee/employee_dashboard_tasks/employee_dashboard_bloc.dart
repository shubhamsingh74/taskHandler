import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
 import 'package:quickprism/domain/stocks/i_stock_repo.dart';
import 'package:quickprism/domain/stocks/models/employee_dashboard/employee_dashboard_status_model.dart';
import 'package:quickprism/domain/user/i_user_repo.dart';
import 'package:quickprism/domain/user/models/employee_checkin_checkout/employee_checkin_checkout_model.dart';
import 'package:quickprism/domain/user/user_constants.dart';
import 'package:quickprism/infrastructure/auth/auth_service.dart';

import '../../../presentation/screens/business/transactions/screen_transactions_purchase.dart';

part 'employee_dashboard_event.dart';

part 'employee_dashboard_state.dart';

@injectable
class EmployeeDashboardBloc
    extends Bloc<EmployeeDashboardEvent, EmployeeDashboardState> {
  final IStockRepo _iStockRepo;
  final IUserRepo _iUserRepo;


  EmployeeDashboardBloc(this._iStockRepo, this._iUserRepo)
      : super(EmployeeDashboardInitialState()) {

    on<EmployeeGetAllTaskEvent>(
      (event, emit) async {
        emit(EmployeeDashboardLoadingState());
        var userId = await AuthService().getUserId();
        var res = await _iUserRepo.getUserDetails(userId: userId!);
        res.fold((l) {
          emit(EmployeeDashboardErrorState());
        }, (r) async {
           UserConstants.employeeDetails = r.data?.employeeDetails;
           // var response = await _iStockRepo.getAllTask(shopId: 1);
           // response.fold((l) {
           //   emit(EmployeeDashboardErrorState());
           // }, (r) {
           //   emit(EmployeeDashboardSuccessState(employeeDashboardStatusModel: r));
           // });
        });
        var response = await _iStockRepo.getAllTask(shopId: 1);
        response.fold((l) {
          emit(EmployeeDashboardErrorState());
        }, (r) {
          List<EmployeeTaskData> upcomingTasks = [];
          List<EmployeeTaskData> workingTasks = [];
          List<EmployeeTaskData> finishedTasks = [];
          List<EmployeeTaskData> dueTasks = [];

          for (var t in r.employeeTaskData!) {
            if (t.deadline!.isBefore(DateTime.now()) && (t.taskStatus == "Working" || t.taskStatus == "Upcoming")) {
              dueTasks.add(t);
            }
          }
          r.employeeTaskData?.forEach((element) {
            switch (element.taskStatus?.toString()) {
              case "Upcoming":
                  upcomingTasks.add(element);
              case "Working":
                workingTasks.add(element);
              case "Finished":
                finishedTasks.add(element);
              default:
            }
          });
          emit(EmployeeDashboardSuccessState(upcomingTasks: upcomingTasks,workingTasks: workingTasks,finishedTasks: finishedTasks,dueTasks: dueTasks));
        });

      },
    );

    on<EmployeeCheckInCheckOutEvent>(
      (event, emit) async {
        emit(EmployeeDashboardLoadingState());
        var response = await _iUserRepo.updateCheckInCheckOutEmployee(
          body: EmployeeCheckInCheckOutModel(
            attendanceStatus: event.attendanceStatus,
            checkIn: event.checkInTime,
            checkOut: event.checkOutTime,
            checkInAddress: EmployeeCheckAddressData(
                state: "test",
                city: "test",
                pincode: 123212,
                streetAddress: "test"),
            checkOutAddress: EmployeeCheckAddressData(
                state: "test",
                city: "test",
                pincode: 123212,
                streetAddress: "test"),
          ),
          staffId: 1,
          date: event.date,
        );
        response.fold((l) {
          emit(EmployeeDashboardErrorState());
        }, (r) {
          emit(EmployeeCheckInCheckOutSuccessState());
        });
      },
    );
  }
}
