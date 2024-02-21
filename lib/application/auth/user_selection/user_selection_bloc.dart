import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:quickprism/core/utils/extensions.dart';
import 'package:quickprism/domain/user/user_constants.dart';

import '../../../domain/user/i_user_repo.dart';
import '../../../infrastructure/auth/auth_service.dart';

part 'user_selection_event.dart';
part 'user_selection_state.dart';

@injectable
class UserSelectionBloc extends Bloc<UserSelectionEvent, UserSelectionState> {
  final IUserRepo _userRepo;

  UserSelectionBloc(this._userRepo) : super(UserSelectionInitialState()) {
    on<UserSelectionTypeSelectedEvent>(_userTypeSelected);
  }
  Future<void> _userTypeSelected(UserSelectionTypeSelectedEvent event,
      Emitter<UserSelectionState> emit) async {
    await AuthService().saveUserType(event.userType);


    if (event.userType.contains("business")) {
      emit(UserSelectionBusinessSelectedState());
    } else if (event.userType.contains("employee")) {
      emit(UserSelectionLoadingState());
      var res = await _userRepo.getUserDetails(userId: UserConstants.userId!);
      res.fold((l) {}, (r) {
        if (r.data?.employeeDetails == null) {
          emit(UserSelectionEmployeeSelectedNotRegisteredState());
          log("no employeeDetailss");
        } else {
          log("employeeDetaill");
          emit(UserSelectionEmployeeSelectedRegisteredState());
          UserConstants.employeeDetails = r.data?.employeeDetails;
        }
      });
    }
  }
}
