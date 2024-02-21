part of 'business_transaction_bloc.dart';

@immutable
abstract class BusinessTransactionState {
  final bool? isSalesLoading;
  final bool? isPurchaseLoading;
  final bool? isReturnsLoading;
  final bool? isExpanseLoading;
  final TransactionsData? mainData;
  final List<TransactionsPurchaseData>? purchases;
  final List<TransactionsSalesData>? sales;

  const BusinessTransactionState({
    this.isSalesLoading,
    this.isPurchaseLoading,
    this.isReturnsLoading,
    this.isExpanseLoading,
    this.mainData,
    this.sales =const [],
    this.purchases = const [],
  });
}

class BusinessTransactionInitialState extends BusinessTransactionState {
  const BusinessTransactionInitialState({
    required super.isSalesLoading,
    required super.isPurchaseLoading,
    required super.isReturnsLoading,
    required super.isExpanseLoading,
    required super.mainData,
    required super.sales,
    required super.purchases,
  });
}

class BusinessTransactionMainState extends BusinessTransactionState {
  const BusinessTransactionMainState({
    required super.isSalesLoading,
    required super.isPurchaseLoading,
    required super.isReturnsLoading,
    required super.isExpanseLoading,
    required super.mainData,
    required super.sales,
    required super.purchases,
  });
}

class BusinessTransactionLoadingState extends BusinessTransactionState {}

class BusinessTransactionErrorState extends BusinessTransactionState {}

class BusinessTransactionNoBusinessState extends BusinessTransactionState {}
