import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:quickprism/domain/stocks/i_stock_repo.dart';
import 'package:quickprism/domain/stocks/models/get_business_type/get_business_type_model.dart';
import 'package:quickprism/domain/user/i_user_repo.dart';
import 'package:quickprism/domain/user/user_constants.dart';

part 'my_business_profile_event.dart';
part 'my_business_profile_state.dart';

@injectable
class MyBusinessProfileBloc
    extends Bloc<MyBusinessProfileEvent, MyBusinessProfileState> {
  final IUserRepo _userRepo;
  MyBusinessProfileBloc(this._userRepo)
      : super(const MyBusinessProfileMainState(
            isCINvisible: true, newUser: true, businessTypes: [])) {
    on<MyBusinessProfileInitialEvent>((event, emit) async {
      List<BusinessTypeData> types = [];

      var getList = await _userRepo.getBusinessTypes();

      getList.fold((l) {}, (r) {
        types = r.data ?? [];
      });
      var profile =
          UserConstants.currentUser!.data?.businessDetails?.businessProfile;

      if (profile == null) {
        emit(MyBusinessProfileMainState(
            isCINvisible: true, newUser: true, businessTypes: types));
      } else if (profile.cin == null) {
        emit(MyBusinessProfileMainState(
            isCINvisible: false, newUser: false, businessTypes: types));
      } else {
        emit(MyBusinessProfileMainState(
            isCINvisible: true, newUser: false, businessTypes: types));
      }
    });

    on<MyBusinessProfileChangeBusinessTypeEvent>((event, emit) {
      var currentType = state.businessTypes
          .firstWhere((element) => element.businessType == event.type);

      emit(MyBusinessProfileMainState(
          isCINvisible: currentType.isCinRequired,
          newUser: state.newUser,
          businessTypes: state.businessTypes));
    });

    on<MyBusinessProfileSaveEvent>((event, emit) async {
      emit(MyBusinessProfileLoadingState(
          newUser: state.newUser,
          isCINvisible: state.isCINvisible,
          businessTypes: state.businessTypes));

      if (state.newUser!) {
        var resp = await _userRepo.createBusiness(
            userId: event.userId,
            type: event.type,
            businessName: event.bName,
            cin: event.cin,
            pan: event.pan,
            gst: event.gst);
        var response = await _userRepo.getUserDetails(userId: event.userId);

        response.fold((l) {}, (r) {
          UserConstants.currentUser = r;
          UserConstants.currentBusiness = r.data!.businessDetails;
          UserConstants.shops =
              r.data!.businessDetails?.businessManagement ?? [];
        });
        emit(MyBusinessProfileMainState(
            isCINvisible: state.isCINvisible,
            newUser: state.newUser,
            businessTypes: state.businessTypes));

        emit(resp.fold((l) {
          return MyBusinessProfileErrorSnackBarState(
              isCINvisible: state.isCINvisible,
              newUser: state.newUser,
              businessTypes: state.businessTypes);
        }, (r) {
          return MyBusinessProfileNavigateBackState(
              isCINvisible: state.isCINvisible,
              newUser: state.newUser,
              businessTypes: state.businessTypes);
        }));
      } else {
        var resp = await _userRepo.updateBusiness(
            businessId:
                UserConstants.currentBusiness!.businessProfile!.businessId!,
            userId: event.userId,
            type: event.type,
            businessName: event.bName,
            cin: event.cin,
            pan: event.pan,
            gst: event.gst);

        var response = await _userRepo.getUserDetails(userId: event.userId);

        response.fold((l) {}, (r) {
          UserConstants.currentUser = r;
          UserConstants.currentBusiness = r.data?.businessDetails;
          UserConstants.shops =
              r.data!.businessDetails?.businessManagement ?? [];
        });

        emit(MyBusinessProfileMainState(
            isCINvisible: state.isCINvisible,
            newUser: state.newUser,
            businessTypes: state.businessTypes));

        emit(resp.fold((l) {
          return MyBusinessProfileErrorSnackBarState(
              isCINvisible: state.isCINvisible,
              newUser: state.newUser,
              businessTypes: state.businessTypes);
        }, (r) {
          return MyBusinessProfileNavigateBackState(
              isCINvisible: state.isCINvisible,
              newUser: state.newUser,
              businessTypes: state.businessTypes);
        }));
      }
    });
  }
}
