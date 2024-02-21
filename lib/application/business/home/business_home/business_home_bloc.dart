import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:quickprism/core/utils/extensions.dart';
import 'package:quickprism/domain/user/i_user_repo.dart';
import 'package:quickprism/domain/user/models/user_model.dart';
import 'package:quickprism/domain/user/user_constants.dart';
import 'package:quickprism/main.dart';

part 'business_home_event.dart';
part 'business_home_state.dart';

@injectable
class BusinessHomeBloc extends Bloc<BusinessHomeEvent, BusinessHomeState> {
  final IUserRepo _userRepo;

  BusinessHomeBloc(
    this._userRepo,
  ) : super(const BusinessHomeInitialState(
          isLoading: true,
        )) {
    on<BusinessHomeInitialEvent>((event, emit) async {
      emit(const BusinessHomeLoadingState(
        isLoading: true,
      ));

      if (UserConstants.userId == null) {
        emit(const BusinessHomeErrorState(isLoading: true));
        return;
      }

      var response =
          await _userRepo.getUserDetails(userId: UserConstants.userId!);

      response.fold((l) {
        emit(const BusinessHomeErrorState(isLoading: true));
      }, (userDetails) {
        // stateBusinessDetails = userDetails.data!.businessDetails ?? [];
        if (userDetails.data == null) {
          emit(const BusinessHomeErrorState(isLoading: true));
        } else {
          UserConstants.currentUser = userDetails;

          UserConstants.currentBusiness = userDetails.data!.businessDetails;

          if (UserConstants.currentBusiness != null) {
            UserConstants.shops =
                UserConstants.currentBusiness!.businessManagement ?? [];
            UserConstants.currentShop = UserConstants.shops.isEmpty
                ? null
                : UserConstants.currentShop ?? UserConstants.shops[0];

            emit(BusinessHomeMainState(
                user: userDetails,
                currentBusiness: UserConstants.currentBusiness,
                currentShop: UserConstants.currentShop,
                isLoading: false));
          } else {
            emit(const BusinessHomeNewUserState(isLoading: false));
          }
        }
      });
    });

    on<BusinessHomeChangeShopEvent>((event, emit) {
      var currentShop = event.shop;
      UserConstants.currentShop = currentShop;
      UserConstants.currentShop?.shopName.toString().log("shopp nameNew");
      //  BusinessHomeBloc(_userRepo).add(BusinessHomeInitialEvent());
      emit(BusinessHomeMainState(
          user: UserConstants.currentUser,
          currentBusiness: UserConstants.currentBusiness,
          currentShop: UserConstants.currentShop,
          isLoading: false));
    });
  }
}
