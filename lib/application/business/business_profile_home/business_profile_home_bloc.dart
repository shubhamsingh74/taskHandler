import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:quickprism/domain/user/models/user_model.dart';
import 'package:quickprism/domain/user/user_constants.dart';
import 'package:quickprism/infrastructure/auth/auth_service.dart';

part 'business_profile_home_event.dart';
part 'business_profile_home_state.dart';

@injectable
class BusinessProfileHomeBloc
    extends Bloc<BusinessProfileHomeEvent, BusinessProfileHomeState> {
  BusinessProfileHomeBloc()
      : super(BusinessProfileHomeMainState(
          user: UserConstants.currentUser!,
          isBManagementPending: true,
          isProfilePending: true,
          isSManagementPending: true,
        )) {
    on<BusinessProfileHomeInitialEvent>((event, emit) {
      var user = UserConstants.currentUser!;

      if (user.data!.businessDetails != null) {
        emit((BusinessProfileHomeMainState(
          user: UserConstants.currentUser!,
          isBManagementPending: true,
          isProfilePending: true,
          isSManagementPending: true,
        )));
      }
      var isBManagementPending =
          user.data!.businessDetails?.businessManagement == null;
      var isProfilePending =
          user.data!.businessDetails?.businessProfile == null;

      var isSManagementPending =
          user.data!.businessDetails?.staffManagement == null;

      emit((BusinessProfileHomeMainState(
        user: UserConstants.currentUser!,
        isBManagementPending: isBManagementPending,
        isProfilePending: isProfilePending,
        isSManagementPending: isSManagementPending,
      )));
    });

    on<BusinessProfileHomeLogOutEvent>((event, emit) async {
      UserConstants.currentUser =
          UserConstants.currentBusiness = UserConstants.currentShop = null;
      UserConstants.shops = [];

      await AuthService().clearUserId();

      emit(BusinessProfileHomeLogOutState());
    });
  }
}
