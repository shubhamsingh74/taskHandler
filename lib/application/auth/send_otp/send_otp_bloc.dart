import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:quickprism/domain/auth/i_auth_repo.dart';
import 'package:quickprism/domain/core/failures/main_failures.dart';

part 'send_otp_event.dart';
part 'send_otp_state.dart';

@injectable
class SendOtpBloc extends Bloc<SendOtpEvent, SendOtpState> {
  final IAuthRepo _authRepo;

  SendOtpBloc(this._authRepo) : super(SendOtpInitialState()) {
    on<SendOtpStartEvent>(sendOtpStartEvent);

    on<SendOtpButtonClickEvent>(sendOtpButtonClickEvent);
  }

  FutureOr<void> sendOtpButtonClickEvent(
      SendOtpButtonClickEvent event, Emitter<SendOtpState> emit) async {
    emit(SendOtpLoadingState());

    var result = await _authRepo.sendOtp(
      phone: event.phone,
    );

    emit(SendOtpInitialState());

    emit(result.fold((MainFailures f) {
      return SendOtpErrorSnackBarState(error: f.errorMessage);
    }, (String message) {
      return SendOtpNavigateToVerifyState();
    }));
  }

  FutureOr<void> sendOtpStartEvent(
      SendOtpStartEvent event, Emitter<SendOtpState> emit) {
    emit(SendOtpInitialState());
  }
}
