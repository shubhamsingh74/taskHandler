import 'package:dartz/dartz.dart';
import 'package:quickprism/domain/core/failures/main_failures.dart';
import 'package:quickprism/domain/invoice/create_purchase_response_model/created_invoice_response_model.dart';
import 'package:quickprism/domain/invoice/models/purchase_list/invoice_purchase_list_model.dart';
import 'package:quickprism/domain/invoice/models/sales_list/invoice_sales_list_model.dart';
import 'package:quickprism/domain/invoice/models/transactions/transactions_model.dart';
import 'package:quickprism/domain/invoice/models/transactions_sales/transactions_sales_model.dart';

 import 'create_purchase_response_model/purchaseBodyModel/invoice_body_model.dart';
import 'models/item_lots/item_lots_model.dart';
import 'models/item_units_with_quantity/units_with_quantity_of_item_model.dart';
import 'models/transactions_purchases/transactions_purchase_model.dart';

abstract class IInvoiceRepo {
  // Future<Either<MainFailures, String>> createPurchase(
  //     {required InvoiceBodyModel request});
  Future<Either<MainFailures, CreatedInvoiceResponseModel>> createInvoice(
      {required InvoiceBodyModel request, required bool isPurchaseInvoice});
  Future<Either<MainFailures, UnitsWithQuantityOfItemModel>>
      getUnitsWithQuantity({
    required int itemId,
  });
  Future<Either<MainFailures, ItemLotsModel>> getItemLots({
    required int itemId,
    required String unit,
  });

  // Future<Either<MainFailures, CreateSalesResponseModel>> createSales(
  //     {required CreateSalesBodyModel request});
  Future<Either<MainFailures, InvoicePurchaseListModel>> getPurchase(
      {required int shopId});
  Future<Either<MainFailures, InvoiceSalesListModel>> getSales(
      {required int shopId});
  Future<Either<MainFailures, TransactionsModel>> getTransactionPageData(
      {required int shopId});
  Future<Either<MainFailures, TransactionsSalesModel>> getTransactionSales(
      {required int shopId});
  Future<Either<MainFailures, TransactionsPurchaseModel>>
      getTransactionPurchase({required int shopId});
}
