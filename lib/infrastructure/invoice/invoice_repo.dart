import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:quickprism/core/utils/extensions.dart';
import 'package:quickprism/domain/core/api_endpoints.dart';
import 'package:quickprism/domain/core/failures/main_failures.dart';
import 'package:quickprism/domain/invoice/create_purchase_response_model/created_invoice_response_model.dart';
import 'package:quickprism/domain/invoice/i_invoice_repo.dart';
import 'package:quickprism/domain/invoice/models/item_lots/item_lots_model.dart';
import 'package:quickprism/domain/invoice/models/item_units_with_quantity/units_with_quantity_of_item_model.dart';
import 'package:quickprism/domain/invoice/models/purchase_list/invoice_purchase_list_model.dart';
import 'package:quickprism/domain/invoice/models/sales_list/invoice_sales_list_model.dart';
import 'package:quickprism/domain/invoice/models/transactions/transactions_model.dart';
import 'package:quickprism/domain/invoice/models/transactions_purchases/transactions_purchase_model.dart';
import 'package:quickprism/domain/invoice/models/transactions_sales/transactions_sales_model.dart';
import 'package:quickprism/infrastructure/network_client.dart';

import '../../domain/invoice/create_purchase_response_model/purchaseBodyModel/invoice_body_model.dart';

 
@LazySingleton(as: IInvoiceRepo)
class InvoiceRepo extends IInvoiceRepo {
  final _networkServices = NetworkClient();
  @override
  Future<Either<MainFailures, CreatedInvoiceResponseModel>> createInvoice(
      {required InvoiceBodyModel request,
      required bool isPurchaseInvoice}) async {
    String month = request.date.month.toString();
    String day = request.date.day.toString();
    if (month.length == 1) {
      month = "0$month";
    }
    if (day.length == 1) {
      day = "0$day";
    }
    try {
      final Response response = await _networkServices.createPostRequest(
        url: ApiEndPoints.createInvoice,
        data: {
          "shop_id": request.shopId,
          "date": "${request.date.year}-$month-$day",
          "time": request.time,
          "record_type": request.recordType,
          "party_id": request.partyId,
          "additional_charges": request.additionalCharges,
          "additional_discount": request.additionalDiscount,
          "amount": request.amount,
          "gst_no": request.gstNo,
          "cash_amount_received": request.cashAmountReceived,
          "cash_notes_reference": request.cashNotesReference,
          "online_amount_received": request.onlineAmountReceived,
          "online_notes_reference": request.onlineNotesReference,
          "due_amount": request.dueAmount,
          "credit_amount": request.creditAmount,
          "items_details": isPurchaseInvoice
              ? request.invoiceBodyModelPurchaseItem
                  .map((e) => {
                        // "item_id": e.itemId,
                        // "quantity": e.quantity,
                        // "price": e.price,
                        // "discount": e.discount,
                        // "unit": "pcs",
                        // "hsn_code": e.hsnCode,
                        // "gst_rate": e.gstRate
                        "item_id": e.itemId,
                        "quantity": e.quantity,
                        "purchase_price": e.purchasePrice,
                        "unit": e.unit,
                        "mrp": e.mrp
                      })
                  .toList()
              : request.invoiceBodyModelSaleItem
                  .map((e) => {
                        // "item_id": e.itemId,
                        // "quantity": e.quantity,
                        // "price": e.price,
                        // "discount": e.discount,
                        // "unit": "pcs",
                        // "hsn_code": e.hsnCode,
                        // "gst_rate": e.gstRate
                        "item_id": e.itemId,
                        "quantity": e.quantity,
                        "sale_price": e.salePrice,
                        "unit": e.unit,
                        "discount": e.discount
                      })
                  .toList(),
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(CreatedInvoiceResponseModel.fromJson(response.data));
      } else {
        return Left(MainFailures.serverFailure(
            errorMessage: response.statusMessage ?? 'Something went wrong'));
      }
    } catch (e) {
      e.toString().log("createInvoice Error");
      return const Left(
          MainFailures.clientFailure(errorMessage: 'Connection failed'));
    }
  }

  @override
  Future<Either<MainFailures, InvoicePurchaseListModel>> getPurchase(
      {required int shopId}) async {
    var endPoint = "${ApiEndPoints.invoiceGetPurchase}$shopId";

    try {
      final Response response = await _networkServices.createGetRequest(
        url: endPoint,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(InvoicePurchaseListModel.fromJson(response.data));
      } else {
        return Left(MainFailures.serverFailure(
            errorMessage: response.statusMessage ?? 'Something went wrong'));
      }
    } catch (e) {
      return const Left(
          MainFailures.clientFailure(errorMessage: 'Connection failed'));
    }
  }

  @override
  Future<Either<MainFailures, InvoiceSalesListModel>> getSales(
      {required int shopId}) async {
    var endPoint = "${ApiEndPoints.invoiceGetSales}$shopId";

    try {
      final Response response = await _networkServices.createGetRequest(
        url: endPoint,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(InvoiceSalesListModel.fromJson(response.data));
      } else {
        return Left(MainFailures.serverFailure(
            errorMessage: response.statusMessage ?? 'Something went wrong'));
      }
    } catch (e) {
      return const Left(
          MainFailures.clientFailure(errorMessage: 'Connection failed'));
    }
  }

  // @override
  // Future<Either<MainFailures, CreateSalesResponseModel>> createSales(
  //     {required CreateSalesBodyModel request}) async {
  //   try {
  //     final Response response = await _networkServices
  //         .createPostRequest(url: ApiEndPoints.invoiceCreateSales, data: {
  //       "customer_id": request.customerId,
  //       "shop_id": request.shopId,
  //       "items_details": request.itemsDetails!
  //           .map((e) => {
  //                 "item_id": e.itemId,
  //                 "quantity": e.quantity,
  //                 "price": e.price,
  //                 "date": e.date
  //               })
  //           .toList(),
  //       "gst_percentage": request.gstPercentage,
  //       "cash_amount_recieved": request.cashAmountRecieved,
  //       "online_amount_recieved": request.cashAmountRecieved,
  //       "due_amount": request.dueAmount,
  //       "remarks": request.remarks,
  //       "date": request.date.toString(),
  //       "time": "15:30"
  //     });

  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       return Right(CreateSalesResponseModel.fromJson(response.data));
  //     } else {
  //       return Left(MainFailures.serverFailure(
  //           errorMessage: response.statusMessage ?? 'Something went wrong'));
  //     }
  //   } catch (e) {
  //     log(e.toString());

  //     return const Left(
  //         MainFailures.clientFailure(errorMessage: 'Connection failed'));
  //   }
  // }

  @override
  Future<Either<MainFailures, TransactionsModel>> getTransactionPageData(
      {required int shopId}) async {
    var endPoint = "${ApiEndPoints.invoiceGetTransactionPageData}$shopId";

    try {
      final Response response = await _networkServices.createGetRequest(
        url: endPoint,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(TransactionsModel.fromJson(response.data));
      } else {
        return Left(MainFailures.serverFailure(
            errorMessage: response.statusMessage ?? 'Something went wrong'));
      }
    } catch (e) {
      return const Left(
          MainFailures.clientFailure(errorMessage: 'Connection failed'));
    }
  }

  @override
  Future<Either<MainFailures, TransactionsPurchaseModel>>
      getTransactionPurchase({required int shopId}) async {
    // var endPoint = "${ApiEndPoints.invoiceGetInvoicesByShop}4/purchase";

    var endPoint = "${ApiEndPoints.invoiceGetInvoicesByShop}$shopId/purchase";

    try {
      final Response response = await _networkServices.createGetRequest(
        url: endPoint,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        var purchases = TransactionsPurchaseModel.fromJson(response.data);
        return Right(purchases);
      } else {
        return Left(MainFailures.serverFailure(
            errorMessage: response.statusMessage ?? 'Something went wrong'));
      }
    } catch (e) {
      return const Left(
          MainFailures.clientFailure(errorMessage: 'Connection failed'));
    }
  }

  @override
  Future<Either<MainFailures, TransactionsSalesModel>> getTransactionSales(
      {required int shopId}) async {
    var endPoint = "${ApiEndPoints.invoiceGetInvoicesByShop}$shopId/sale";

    try {
      final Response response = await _networkServices.createGetRequest(
        url: endPoint,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(TransactionsSalesModel.fromJson(response.data));
      } else {
        return Left(MainFailures.serverFailure(
            errorMessage: response.statusMessage ?? 'Something went wrong'));
      }
    } catch (e) {
      return const Left(
          MainFailures.clientFailure(errorMessage: 'Connection failed'));
    }
  }

  @override
  Future<Either<MainFailures, ItemLotsModel>> getItemLots(
      {required int itemId, required String unit}) async {
    var endPoint = "${ApiEndPoints.getItemLots}/$itemId/$unit";

    try {
      final Response response = await _networkServices.createGetRequest(
        url: endPoint,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(ItemLotsModel.fromJson(response.data));
      } else {
        return Left(MainFailures.serverFailure(
            errorMessage: response.statusMessage ?? 'Something went wrong'));
      }
    } catch (e) {
      return const Left(
          MainFailures.clientFailure(errorMessage: 'Connection failed'));
    }
  }

  @override
  Future<Either<MainFailures, UnitsWithQuantityOfItemModel>>
      getUnitsWithQuantity({required int itemId}) async {
    var endPoint = "${ApiEndPoints.getUnitsWithQuantity}/$itemId";
    try {
      final Response response = await _networkServices.createGetRequest(
        url: endPoint,
      );
       if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(UnitsWithQuantityOfItemModel.fromJson(response.data));
      } else {
        return Left(MainFailures.serverFailure(
            errorMessage: response.statusMessage ?? 'Something went wrong'));
      }
    } catch (e) {
      return const Left(
          MainFailures.clientFailure(errorMessage: 'Connection failed'));
    }
  }
}
