import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:quickprism/domain/auth/i_auth_repo.dart';
import 'package:quickprism/domain/core/failures/main_failures.dart';
import 'package:quickprism/domain/user/user_constants.dart';
import 'package:quickprism/infrastructure/auth/auth_service.dart';

part 'verify_otp_event.dart';
part 'verify_otp_state.dart';

@injectable
class VerifyOtpBloc extends Bloc<VerifyOtpEvent, VerifyOtpState> {
  final authService = AuthService();

  final IAuthRepo _authRepo;
  VerifyOtpBloc(this._authRepo) : super(VerifyOtpInitial()) {
    on<VerifyOtpStartEvent>(verifyOtpStartEvent);

    on<VerifyOtpButtonClickEventSignUp>(verifyOtpButtonClickEvent);
    on<VerifyOtpButtonClickEventLogin>(verifyOtpButtonClickEventLogin);
  }

  FutureOr<void> verifyOtpStartEvent(
      VerifyOtpStartEvent event, Emitter<VerifyOtpState> emit) {
    emit(VerifyOtpInitial());
  }

  FutureOr<void> verifyOtpButtonClickEvent(
      VerifyOtpButtonClickEventSignUp event,
      Emitter<VerifyOtpState> emit) async {
    emit(VerifyOtpLoadingState());

    var result = await _authRepo.verifyOtp(
      phone: event.phone,
      otp: event.otp,
    );

    emit(VerifyOtpInitial());
// todo add error to mainFailures
    emit(result.fold((MainFailures f) {
      return VerifyOtpErrorSnackBarState('OTP');
    }, (authResponse) {
      return VerifyOtpNavigateToRegisterState();
    }));
  }

  FutureOr<void> verifyOtpButtonClickEventLogin(
      VerifyOtpButtonClickEventLogin event,
      Emitter<VerifyOtpState> emit) async {
    emit(VerifyOtpLoadingState());

    var result = await _authRepo.signIn(
      phone: event.phone,
      otp: event.otp,
    );

    emit(VerifyOtpInitial());

    emit(result.fold((MainFailures f) {
      return VerifyOtpErrorSnackBarState(f.errorMessage);
    }, (authResp) {
      UserConstants.userId = authResp.data.userId;
      //
      // if (authResp.data.isBusiness) {
      //   return VerifyOtpNavigateToBusinessHomeState();
      // } else if (authResp.data.isCustomer) {
      //   return VerifyOtpNavigateToCustomerHomeState();
      // } else {
      //   return VerifyOtpNavigateToEmployeeHomeState();
      // }
      return VerifyOtpNavigateToBusinessHomeState();
    }));
  }
}
