part of 'business_transaction_bloc.dart';

@immutable
abstract class BusinessTransactionEvent {}

class BusinessTransactionInitialEvent extends BusinessTransactionEvent {
  final int shopId;

  BusinessTransactionInitialEvent({required this.shopId});
}

class BusinessTransactionNoStoreEvent extends BusinessTransactionEvent {}
