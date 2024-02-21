part of 'business_stock_transfer_bloc.dart';

@immutable
abstract class BusinessStockTransferState {
  final TransferInfoData? transferData;

  const BusinessStockTransferState({this.transferData});
}

@immutable
abstract class BusinessStockTransferActionState
    extends BusinessStockTransferState {}

class BusinessStockTransferInitialState extends BusinessStockTransferState {
  BusinessStockTransferInitialState({super.transferData});
}

class BusinessStockTransferLoadingState extends BusinessStockTransferState {
  BusinessStockTransferLoadingState({super.transferData});
}

class BusinessStockTransferErrorState extends BusinessStockTransferState {}

class BusinessStockTransferSuccessState extends BusinessStockTransferState {
  BusinessStockTransferSuccessState({required super.transferData});
}

class BusinessStockTransferNavigateBackState
    extends BusinessStockTransferActionState {}
