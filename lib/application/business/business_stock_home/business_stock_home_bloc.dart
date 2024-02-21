import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:quickprism/domain/stocks/i_stock_repo.dart';
import 'package:quickprism/domain/stocks/models/category/category_model.dart';
import 'package:quickprism/domain/stocks/models/stock_type_etails/stock_type_details_model.dart';
import 'package:quickprism/domain/user/i_user_repo.dart';
import 'package:quickprism/domain/user/models/user_model.dart';
import 'package:quickprism/domain/user/user_constants.dart';
import 'package:quickprism/infrastructure/auth/auth_service.dart';

part 'business_stock_home_event.dart';
part 'business_stock_home_state.dart';

@injectable
class BusinessStockHomeBloc
    extends Bloc<BusinessStockHomeEvent, BusinessStockHomeState> {
  final IUserRepo _userRepo;
  final IStockRepo _stockRepo;
  final AuthService _authService = AuthService();
  BusinessStockHomeBloc(this._userRepo, this._stockRepo)
      : super(BusinessStockHomeInitialState(
            stockTypes: [], subCategories: [], businessDetails: [])) {
    on<BusinessStockHomeInitialEvent>((event, emit) async {
      log('BusinessStockHomeInitialEvent started');
      emit(BusinessStockHomeLoadingState(
          businessDetails: [], subCategories: [], stockTypes: []));

      // List<ShopDetail> stateShops = [];
      BusinessProfile? stateBusinessDetails;
      List<CategoryData> stateSubCategories = [];
      List<StockTypeData> stateStockTypes = [];

      if (UserConstants.userId == null) {
        emit(BusinessStockHomeErrorState());
      }

      var response =
          await _userRepo.getUserDetails(userId: UserConstants.userId!);
      var categoryResponse = await _stockRepo.getCategories();
      //

      response.fold((l) {
        emit(BusinessStockHomeErrorState());
      }, (userdetails) {
        stateBusinessDetails =
            userdetails.data!.businessDetails!.businessProfile;
        UserConstants.shops =
            userdetails.data!.businessDetails!.businessManagement!;
      });
      if (stateBusinessDetails != null) {
        categoryResponse.fold((l) {
          emit(BusinessStockHomeErrorState());
        }, (categories) {
          log("categories");

          stateSubCategories = categories.data ?? [];
        });
        
        var firstCategory = stateSubCategories[0];
        var firstBusiness = stateBusinessDetails;

        var stockDetails = await _stockRepo.getStockDetails(
            businessId: firstBusiness!.businessId!,
            categoryId: firstCategory.categoryId);

        stockDetails.fold((l) {
          emit(BusinessStockHomeErrorState());
        }, (stocks) {
          log("stocks");

          stateStockTypes = stocks.data ?? [];
        });

        // log("businessDetails => ${stateBusinessDetails.length}");

        emit(BusinessStockHomeStockSuccessState(
            businessDetails: [stateBusinessDetails!],
            subCategories: stateSubCategories,
            stockTypes: stateStockTypes));
      } else {
        emit(BusinessStockHomeErrorState());
      }
    });

    on<BusinessStockHomeSignOutEvent>((event, emit) async {
      await _authService.clearUserId();
      emit(BusinessStockHomeSignOutState());
    });

    on<BusinessStockHomeChangeCategoryEvent>((event, emit) async {
      emit(BusinessStockHomeStockTypeLoading(
        businessDetails: state.businessDetails,
        subCategories: state.subCategories,
        stockTypes: state.stockTypes,
      ));

      var stockDetails = await _stockRepo.getStockDetails(
          businessId: event.businessId,
          categoryId: event.categoryData.categoryId);

      emit(stockDetails.fold((l) {
        return BusinessStockHomeStockTypesErrorState(
          businessDetails: state.businessDetails,
          subCategories: state.subCategories,
          stockTypes: state.stockTypes,
        );
      }, (r) {
        return BusinessStockHomeStockSuccessState(
            businessDetails: state.businessDetails,
            subCategories: state.subCategories,
            stockTypes: r.data!);
      }));
    });
    on<BusinessStockHomeStockTypeTileTapEvent>((event, emit) async {
      emit(BusinessStockHomeNavigateToItemListState(event.stockTypeData,
          businessDetails: state.businessDetails,
          subCategories: state.subCategories));
    });
  }
}
