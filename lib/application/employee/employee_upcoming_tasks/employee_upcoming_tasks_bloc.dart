import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:quickprism/domain/stocks/i_stock_repo.dart';
import 'package:quickprism/domain/stocks/models/employee_start_working/employee_start_working_model.dart';
import 'package:quickprism/domain/stocks/models/employee_upcoming_tasks/employee_upcoming_tasks_model.dart';

part 'employee_upcoming_tasks_event.dart';
part 'employee_upcoming_tasks_state.dart';

@injectable
class EmployeeTasksBloc
    extends Bloc<EmployeeUpcomingTasksEvent, EmployeeUpcomingTasksState> {
  final IStockRepo _iStockRepo;

  EmployeeTasksBloc(this._iStockRepo) : super(EmployeeTasksInitialState()) {
    on<EmployeeGetAllUpcomingTasksEvent>(
      (event, emit) async {
        emit(EmployeeTasksLoadingState());
        var response = await _iStockRepo.getAllUpcomingTasks(shopId: 1);
        response.fold((l) {
          emit(EmployeeTasksErrorState());
        }, (r) {
          List<EmployeeUpcomingTasksData> salesDivision = [];
          List<EmployeeUpcomingTasksData> purchaseDivision = [];
          List<EmployeeUpcomingTasksData> stockDivision = [];

          r.data?.forEach((element) {
            switch (element.division?.toString()) {
              case "Sales":
                if (element.taskStatus == "Upcoming") {
                  salesDivision.add(element);
                }
              case "Purchase":
                if (element.taskStatus == "Upcoming") {
                  purchaseDivision.add(element);
                }
              case "Stocks":
                if (element.taskStatus == "Upcoming") {
                  stockDivision.add(element);
                }
              default:
            }
          });
          emit(
              EmployeeTasksUpcomingSuccessState(stockDivision: stockDivision,purchaseDivision: purchaseDivision,salesDivision: salesDivision));
        });
      },
    );

    on<EmployeeStartWorkingTaskEvent>(
      (event, emit) async {
        emit(EmployeeTasksLoadingState());
        var response = await _iStockRepo.updateStartWorkingTask(
          taskId: event.taskId,
          body: EmployeeStartWorkingModel(
            newStatus: event.newStatus,
          ),
        );
        response.fold((l) {
          emit(EmployeeTasksErrorState());
        }, (r) {
          add(EmployeeGetAllUpcomingTasksEvent());
          emit(EmployeeStartWorkingTaskSuccessState());
        });
      },
    );
  }


  
}
