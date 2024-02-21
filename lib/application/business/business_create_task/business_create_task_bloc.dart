import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:quickprism/core/utils/extensions.dart';
import 'package:quickprism/domain/stocks/i_stock_repo.dart';
import 'package:quickprism/domain/stocks/models/create_task/create_task_request_model.dart';
import 'package:quickprism/domain/user/user_constants.dart';

part 'business_create_task_event.dart';
part 'business_create_task_state.dart';

@injectable
class BusinessCreateTaskBloc
    extends Bloc<BusinessCreateTaskEvent, BusinessCreateTaskState> {
  final IStockRepo _iStockRepo;
  BusinessCreateTaskBloc(this._iStockRepo)
      : super(BusinessCreateTaskInitialState()) {
    on<BusinessCreateTaskRequestEvent>(_createTask);
  }
  Future<void> _createTask(
    BusinessCreateTaskRequestEvent event,
    Emitter<BusinessCreateTaskState> emit,
  ) async {
    emit(BusinessCreateTaskLoadingState());
    var d = event.createTaskRequestModel;
    // d.copyWith();
    var body = CreateTaskRequestModel(
        shopId: UserConstants.currentShop?.shopId,
        assignedBy:
            UserConstants.currentBusiness?.businessProfile?.businessId ?? 0,
        assignedTo: d.assignedTo,
        createdAt: d.createdAt,
        deadline: d.deadline,
        division: d.division,
        priorityLevel: d.priorityLevel,
        taskTitle: d.taskTitle,
        updatedAt: d.updatedAt);
    // UserConstants.currentShop?.shopId.toString().log("createe bloc");
    body.toJson().toString().log("createe bloc");
    var res = await _iStockRepo.creteTask(body: body);
    res.fold((l) {
      emit(BusinessCreateTaskErrorState());
    }, (r) {
      emit(BusinessCreateTaskSuccessState());
    });
    // await Future.delayed(
    //   const Duration(seconds: 2),
    //   () {
    //     emit(BusinessCreateTaskSuccessState());
    //   },
    // );
  }
}

// 


