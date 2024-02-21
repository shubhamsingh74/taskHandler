import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:quickprism/domain/user/i_user_repo.dart';
import 'package:quickprism/domain/user/models/create_employee_user/employee_register_user_model.dart';

part 'employee_register_user_event.dart';

part 'employee_register_user_state.dart';

@injectable
class EmployeeRegisterUserBloc
    extends Bloc<EmployeeRegisterUserEvent, EmployeeRegisterUserState> {
  final IUserRepo _iUserRepo;

  EmployeeRegisterUserBloc(this._iUserRepo)
      : super(EmployeeRegisterUserInitialState()) {
    on<EmployeeRegisterUserButtonEvent>(_createEmployeeUser);
  }

  Future<void> _createEmployeeUser(
    EmployeeRegisterUserButtonEvent event,
    Emitter<EmployeeRegisterUserState> emit,
  ) async {
    emit(EmployeeRegisterUserLoadingState());
    var response = await _iUserRepo.createEmployeeUser(
        body: EmployeeRegisterUserModel(
      empName: event.name,
      empAddress: event.address,
      empEmail: event.email,
    ));
    response.fold((l) {
      emit(EmployeeRegisterUserErrorState());
    }, (r) {
      emit(EmployeeRegisterUserSuccessState());
    });
  }
}
