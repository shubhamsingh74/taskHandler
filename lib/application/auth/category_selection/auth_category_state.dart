part of 'auth_category_bloc.dart';

@immutable
abstract class AuthCategoryState {
  final List<CategoryData> categories;
  final List<CategoryData> selectedCategories;

  const AuthCategoryState(
      {required this.categories, required this.selectedCategories});
}

@immutable
abstract class AuthCategoryActionState extends AuthCategoryState {
  const AuthCategoryActionState(
      {required super.categories, required super.selectedCategories});
}

class AuthCategoryInitialState extends AuthCategoryState {
  const AuthCategoryInitialState(
      {super.categories = const [], super.selectedCategories = const []});
}

class AuthCategoryErrorState extends AuthCategoryState {
  const AuthCategoryErrorState(
      {super.categories = const [], super.selectedCategories = const []});
}

class AuthCategoryLoadingState extends AuthCategoryState {
  const AuthCategoryLoadingState(
      {super.categories = const [], super.selectedCategories = const []});
}

class AuthCategoryMainState extends AuthCategoryState {
  const AuthCategoryMainState(
      {required super.categories, required super.selectedCategories});
}

class AuthCategoryNavigateToHomeState extends AuthCategoryActionState {
  const AuthCategoryNavigateToHomeState(
      {super.categories = const [], super.selectedCategories = const []});
}

class AuthCategoryShowErrorSnackBarState extends AuthCategoryActionState {
  final String error;

  const AuthCategoryShowErrorSnackBarState(
      {required this.error,
      super.categories = const [],
      super.selectedCategories = const []});
}
