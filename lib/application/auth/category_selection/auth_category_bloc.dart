import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:quickprism/domain/auth/i_auth_repo.dart';
import 'package:quickprism/domain/auth/models/auth/auth_model.dart';
import 'package:quickprism/domain/auth/models/auth/signup_req_model.dart';
import 'package:quickprism/domain/core/failures/main_failures.dart';
import 'package:quickprism/domain/stocks/i_stock_repo.dart';
import 'package:quickprism/domain/stocks/models/category/category_model.dart';
import 'package:quickprism/domain/user/user_constants.dart';
import 'package:quickprism/infrastructure/auth/auth_service.dart';

part 'auth_category_event.dart';
part 'auth_category_state.dart';

@injectable
class AuthCategoryBloc extends Bloc<AuthCategoryEvent, AuthCategoryState> {
  final IStockRepo _stockRepo;
  final IAuthRepo _authRepo;
  final authService = AuthService();
  AuthCategoryBloc(
    this._authRepo,
    this._stockRepo,
  ) : super(const AuthCategoryInitialState()) {
    on<AuthCategoryInitialEvent>((event, emit) async {
      log('AuthCategoryInitialEvent started');
      emit(const AuthCategoryLoadingState());

      var response = await _stockRepo.getCategories();
      emit(response.fold((MainFailures f) {
        return const AuthCategoryErrorState();
      }, (CategoryModel ctgrs) {
        log('ctgrs length => ${ctgrs.data.length}');

        return AuthCategoryMainState(
            categories: ctgrs.data, selectedCategories: []);
      }));
    });

    on<AuthCategoryTileClickEvent>((event, emit) {
      var selectedCtgrs = state.selectedCategories;

      if (selectedCtgrs.contains(event.categoryModel)) {
        selectedCtgrs.remove(event.categoryModel);
        emit(AuthCategoryMainState(
            categories: state.categories, selectedCategories: selectedCtgrs));
      } else {
        selectedCtgrs.add(event.categoryModel);
        emit(AuthCategoryMainState(
            categories: state.categories, selectedCategories: selectedCtgrs));
      }
    });

    on<AuthCategoryNextButtonClickEvent>((event, emit) async {
      emit(AuthCategoryLoadingState(
        categories: state.categories,
        selectedCategories: state.selectedCategories,
      ));

      var reqModel = event.signUpReqModel;
      //
      // var response = await _authRepo.userSignUp(
      //   name: reqModel.name,
      //   businessName: reqModel.businessName,
      //   phone: reqModel.phone,
      //   userType: reqModel.userType,
      //   email: reqModel.email,
      //   panNo: reqModel.panNo,
      //   gstNo: reqModel.gstNo,
      //   pin: reqModel.pin,
      //   street: reqModel.street,
      //   city: reqModel.city,
      //   state: reqModel.state,
      // );
      //
      // emit(response.fold((MainFailures f) {
      //   return AuthCategoryShowErrorSnackBarState(
      //       categories: state.categories,
      //       selectedCategories: state.selectedCategories,
      //       error: f.errorMessage);
      // }, (AuthModel res) {
      //   UserConstants.userId = res.data.userId;
      //
      //   // authService.saveUserId(res.data.userId);
      //   return const AuthCategoryNavigateToHomeState();
      // }));

      emit(AuthCategoryNavigateToHomeState());
    });
  }
}
