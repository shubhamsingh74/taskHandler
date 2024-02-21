part of 'business_create_customer_bloc.dart';

@immutable
abstract class BusinessCreateCustomerState {
  final List<CategoryData> categories;

  BusinessCreateCustomerState({required this.categories});
}

@immutable
abstract class BusinessCreateCustomerActionState
    extends BusinessCreateCustomerState {
  BusinessCreateCustomerActionState({required super.categories});
}

class BusinessCreateCustomerInitial extends BusinessCreateCustomerState {
  BusinessCreateCustomerInitial({required super.categories});
}

class BusinessCreateCustomerLoadingState extends BusinessCreateCustomerState {
  BusinessCreateCustomerLoadingState({required super.categories});
}

class BusinessCreateCustomerErrorState extends BusinessCreateCustomerState {
  BusinessCreateCustomerErrorState({required super.categories});
}

class BusinessCreateCustomerSuccessState extends BusinessCreateCustomerState {
  BusinessCreateCustomerSuccessState({required super.categories});
}

class BusinessCreateCustomerNavigateBackState
    extends BusinessCreateCustomerActionState {
  final CustomersDatum newCustomer;

  BusinessCreateCustomerNavigateBackState(
      {required this.newCustomer, required super.categories});
}
