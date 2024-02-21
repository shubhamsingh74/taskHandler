part of 'business_stock_in_bloc.dart';

@immutable
abstract class BusinessStockInState {
  final List<SuppliersDatum>? suppliers;
  final SuppliersDatum? currentSupplier;
  const BusinessStockInState({this.currentSupplier, this.suppliers});
}

@immutable
abstract class BusinessStockInActionState extends BusinessStockInState {
  const BusinessStockInActionState({super.suppliers});
}

class BusinessStockInInitialState extends BusinessStockInState {}

class BusinessStockInLoadingState extends BusinessStockInState {}

class BusinessStockInErrorState extends BusinessStockInState {}

class BusinessStockInSuccessState extends BusinessStockInState {
  const BusinessStockInSuccessState({
    required super.suppliers,
    required super.currentSupplier,
  });
}

class BusinessStockInNavigateToSuppliersState
    extends BusinessStockInActionState {
  const BusinessStockInNavigateToSuppliersState({required super.suppliers});
}

class BusinessStockInNavigateToInvoiceState
    extends BusinessStockInActionState {}
