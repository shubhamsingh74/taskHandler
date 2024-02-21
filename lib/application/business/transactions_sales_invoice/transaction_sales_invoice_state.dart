part of 'transaction_sales_invoice_bloc.dart';

@immutable
abstract class TransactionSalesInvoiceState {
  final List<MyListDetailsData> items;
  final List<InvoiceBodyModelSaleItem> selectedItems;
  final List<LotsDataDatum> lotsData;
  const TransactionSalesInvoiceState({
    required this.selectedItems,
    required this.items,
    required this.lotsData,
  });
}

class TransactionSalesInvoiceInitial extends TransactionSalesInvoiceState {
  const TransactionSalesInvoiceInitial({
    required super.items,
    required super.lotsData,
    required super.selectedItems,
  });
}

class TransactionSalesInvoicePartySelected
    extends TransactionSalesInvoiceState {
  final PartiesListDatum? partyDetail;
  const TransactionSalesInvoicePartySelected({
    required super.items,
    required super.selectedItems,
    required super.lotsData,
    required this.partyDetail,
  });
}

class TransactionSalesInvoiceMainState extends TransactionSalesInvoiceState {
  const TransactionSalesInvoiceMainState({
    required super.lotsData,
    required super.items,
    required super.selectedItems,
  });
}

class TransactionSalesInvoiceErrorState extends TransactionSalesInvoiceState {
  const TransactionSalesInvoiceErrorState({
    required super.lotsData,
    required super.items,
    required super.selectedItems,
  });
}

class TransactionSalesInvoiceSuccessState extends TransactionSalesInvoiceState {
  CreatedInvoiceResponseModel createSalesResponseModel;
  TransactionSalesInvoiceSuccessState({
    required super.lotsData,
    required super.items,
    required super.selectedItems,
    required this.createSalesResponseModel,
  });
}

class TransactionSalesInvoiceLoadingState extends TransactionSalesInvoiceState {
  const TransactionSalesInvoiceLoadingState({
    required super.lotsData,
    required super.items,
    required super.selectedItems,
  });
}

class TransactionSalesInvoiceGettingQuantityAndLotsLoadingState
    extends TransactionSalesInvoiceState {
  const TransactionSalesInvoiceGettingQuantityAndLotsLoadingState({
    required super.lotsData,
    required super.items,
    required super.selectedItems,
  });
}

class TransactionSalesInvoiceGettingQuantityAndLotsSuccessState
    extends TransactionSalesInvoiceState {
  final List<UnitAndQuantityList> unitAndQuantityList;
  final int noOfLotsAsPerQuantityEnteredByUser;
  const TransactionSalesInvoiceGettingQuantityAndLotsSuccessState({
    required super.items,
    required super.selectedItems,
    required super.lotsData,
    required this.unitAndQuantityList,
    required this.noOfLotsAsPerQuantityEnteredByUser,
  });
}

// class TransactionSalesInvoiceNoOfLotsBasedOnEnteredQuantityState
//     extends TransactionSalesInvoiceState {
//   final List<LotsDataDatum> lotsData;
//  final  List<UnitAndQuantityList> unitAndQuantityList;

//   const TransactionSalesInvoiceNoOfLotsBasedOnEnteredQuantityState({
//     required super.items,
//     required super.selectedItems,
//     required this.lotsData,
//     required this.unitAndQuantityList,
//   });
// }

class TransactionSalesInvoiceGettingQuantityAndLotsErrorState
    extends TransactionSalesInvoiceState {
  const TransactionSalesInvoiceGettingQuantityAndLotsErrorState({
    required super.items,
    required super.selectedItems,
    required super.lotsData,
  });
}
