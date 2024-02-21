import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:quickprism/domain/auth/i_auth_repo.dart';

part 'business_sign_up_event.dart';
part 'business_sign_up_state.dart';

@injectable
class BusinessSignUpBloc
    extends Bloc<BusinessSignUpEvent, BusinessSignUpState> {
  final IAuthRepo _authRepo;

  BusinessSignUpBloc(this._authRepo) : super(BusinessSignUpInitialState()) {
    on<BusinessSignUpButtonClickEvent>((event, emit) {
      emit(BusinessSignupNavigateToCategorySelection());
    });
  }
}
