part of 'business_stock_out_bloc.dart';

@immutable
abstract class BusinessStockOutState {
  final List<CustomersDatum>? customers;
  final CustomersDatum? currentCustomer;
  const BusinessStockOutState({this.currentCustomer, this.customers});
}

@immutable
abstract class BusinessStockOutActionState extends BusinessStockOutState {
  const BusinessStockOutActionState({super.customers});
}

class BusinessStockOutInitialState extends BusinessStockOutState {}

class BusinessStockOutLoadingState extends BusinessStockOutState {}

class BusinessStockOutErrorState extends BusinessStockOutState {}

class BusinessStockOutSuccessState extends BusinessStockOutState {
  const BusinessStockOutSuccessState({
    required super.customers,
    required super.currentCustomer,
  });
}

class BusinessStockOutNavigateToCustomersState
    extends BusinessStockOutActionState {
  const BusinessStockOutNavigateToCustomersState({required super.customers});
}

class BusinessStockOutNavigateToInvoiceState
    extends BusinessStockOutActionState {}
