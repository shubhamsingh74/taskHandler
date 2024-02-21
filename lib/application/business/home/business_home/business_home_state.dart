part of 'business_home_bloc.dart';

@immutable
abstract class BusinessHomeState {
  final UserModel? user;
  final BusinessDetails? currentBusiness;
  final BusinessManagement? currentShop;
  final bool isLoading;

  const BusinessHomeState(
      {this.currentBusiness,
      this.currentShop,
      this.user,
      required this.isLoading});
}

class BusinessHomeInitialState extends BusinessHomeState {
  const BusinessHomeInitialState(
      {super.currentBusiness,
      super.currentShop,
      super.user,
      required super.isLoading});
}

class BusinessHomeMainState extends BusinessHomeState {
  const BusinessHomeMainState(
      {super.currentBusiness,
      super.currentShop,
      required super.user,
      required super.isLoading});
}

class BusinessHomeErrorState extends BusinessHomeState {
  const BusinessHomeErrorState(
      {super.currentBusiness,
      super.currentShop,
      super.user,
      required super.isLoading});
}

class BusinessHomeLoadingState extends BusinessHomeState {
  const BusinessHomeLoadingState(
      {super.currentBusiness,
      super.currentShop,
      super.user,
      required super.isLoading});
}

class BusinessHomeNewUserState extends BusinessHomeState {
  const BusinessHomeNewUserState(
      {super.currentBusiness,
      super.currentShop,
      super.user,
      required super.isLoading});
}
