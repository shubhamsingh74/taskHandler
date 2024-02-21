part of 'auth_category_bloc.dart';

@immutable
abstract class AuthCategoryEvent {}

class AuthCategoryInitialEvent extends AuthCategoryEvent {}

class AuthCategoryTileClickEvent extends AuthCategoryEvent {
  AuthCategoryTileClickEvent({
    required this.categoryModel,
  });

  final CategoryData categoryModel;
}

class AuthCategoryNextButtonClickEvent extends AuthCategoryEvent {
  final SignUpReqModel signUpReqModel;

  AuthCategoryNextButtonClickEvent({required this.signUpReqModel});
}
