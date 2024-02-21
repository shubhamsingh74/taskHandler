import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:quickprism/core/utils/extensions.dart';
import 'package:quickprism/domain/core/api_endpoints.dart';
import 'package:quickprism/domain/core/failures/main_failures.dart';
import 'package:quickprism/domain/invoice/models/invoice_all_item_model.dart';
import 'package:quickprism/domain/stocks/i_stock_repo.dart';
import 'package:quickprism/domain/stocks/models/all_items_store/all_items_store_model.dart';
import 'package:quickprism/domain/stocks/models/category/category_model.dart';
import 'package:quickprism/domain/stocks/models/create_item/create_item_model.dart';
import 'package:quickprism/domain/stocks/models/create_task/create_task_request_model.dart';
import 'package:quickprism/domain/stocks/models/employee_dashboard/employee_dashboard_status_model.dart';
import 'package:quickprism/domain/stocks/models/employee_start_working/employee_start_working_model.dart';
import 'package:quickprism/domain/stocks/models/employee_upcoming_tasks/employee_upcoming_tasks_model.dart';
import 'package:quickprism/domain/stocks/models/item_category/item_categories_model.dart';
import 'package:quickprism/domain/stocks/models/item_info/stock_item_info_model.dart';
import 'package:quickprism/domain/stocks/models/item_shop/item_shop_model.dart';
import 'package:quickprism/domain/stocks/models/item_timeline/item_time_line_model.dart';
import 'package:quickprism/domain/stocks/models/items/stock_items_model.dart';
import 'package:quickprism/domain/stocks/models/mylist_details/mylist_details_model.dart';
import 'package:quickprism/domain/stocks/models/shops_all_model/get_all_shops_model.dart';
import 'package:quickprism/domain/stocks/models/stock_type_etails/stock_type_details_model.dart';
import 'package:quickprism/domain/stocks/models/sub_category/sub_category_model.dart';
import 'package:quickprism/domain/stocks/models/transfer_info_model/transfer_info_model.dart';
import 'package:quickprism/infrastructure/network_client.dart';
import 'package:quickprism/presentation/screens/business/transactions/screen_transactions_purchase.dart';

@LazySingleton(as: IStockRepo)
class StocksRepo extends IStockRepo {
  final _networkServices = NetworkClient();

  @override
  Future<Either<MainFailures, CategoryModel>> getCategories() async {
    try {
      final Response response = await _networkServices.createGetRequest(
        url: ApiEndPoints.getCategory,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.data.toString());

        final category = CategoryModel.fromJson(response.data);

        return right(category);
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
  Future<Either<MainFailures, SubCategoryModel>> getSubCategories(
      {int categoryId = 1}) async {
    log('getsubcategories started');

    try {
      final Response response = await _networkServices.createGetRequest(
        url: ApiEndPoints.getSubCategory,
        data: {"category_id": categoryId},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        log('getSubCategories');
        log(response.data.toString());

        final category = SubCategoryModel.fromJson(response.data);

        return right(category);
      } else {
        log('getSubCategories => failed');

        return Left(MainFailures.serverFailure(
            errorMessage: response.statusMessage ?? 'Something went wrong'));
      }
    } catch (e) {
      log('getSubCategories => catched');

      return const Left(
          MainFailures.clientFailure(errorMessage: 'Connection failed'));
    }
  }

  @override
  Future<Either<MainFailures, StockTypeDetailsModel>> getStockDetails({
    required int businessId,
    required int categoryId,
  }) async {
    try {
      final Response response = await _networkServices.createPostRequest(
        url: ApiEndPoints.getStockDetail,
        data: {"business_id": businessId, "category_id": categoryId},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        log('getStockDetails');
        log(response.data.toString());
        final stockData = StockTypeDetailsModel.fromJson(response.data);

        return right(stockData);
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
  Future<Either<MainFailures, StockItemsModel>> getStockShopItems({
    required int subCategoryId,
    required int shopId,
    required int businessId,
  }) async {
    try {
      final Response response = await _networkServices.createGetRequest(
        url: ApiEndPoints.getListShopItems,
        data: {
          "sub_category_id": subCategoryId,
          "business_id": businessId,
          "shop_id": shopId
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.data.toString());

        final items = StockItemsModel.fromJson(response.data);

        return right(items);
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
  Future<Either<MainFailures, MyListItemInfoModel>> getItemInfo(
      {required int itemId}) async {
    var url = "${ApiEndPoints.getStockInfo}$itemId";

    try {
      final Response response = await _networkServices.createGetRequest(
        url: url,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.data.toString());

        final item = MyListItemInfoModel.fromJson(response.data);

        return right(item);
      } else {
        return Left(MainFailures.serverFailure(
            errorMessage: response.statusMessage ?? 'Something went wrong'));
      }
    } catch (e) {
      log('mylist info error => ${e.toString()}');
      return const Left(
          MainFailures.clientFailure(errorMessage: 'Connection failed'));
    }
  }

  @override
  Future<Either<MainFailures, StockCreateItemModel>> createStock({
    required int subCategoryId,
    required int categoryId,
    required int businessId,
    required String brand,
    required String itemName,
    required String unit,
    required String hsn,
    required int skuCode,
    required int gstPercentage,
    required double salesPrice,
    required double purchasePrice,
    required int shopId,
    required int availableStock,
    required int lowAlertUnits,
    required bool lowAlertStatus,
  }) async {
    try {
      final Response response = await _networkServices.createPostRequest(
        url: ApiEndPoints.createStock,
        data: {
          "sub_category_id": subCategoryId,
          "business_id": businessId,
          "brand": brand,
          "item_name": itemName,
          "sku_code": skuCode,
          "unit": unit,
          "sales_price": salesPrice,
          "purchase_price": purchasePrice,
          "hsn": hsn,
          "gst_percentage": gstPercentage,
          "shop_data": {
            "shop_id": shopId,
            "available_stock": availableStock,
            "low_alert_units": lowAlertUnits,
            "low_alert_status": lowAlertStatus
          }
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.data.toString());
        final createData = StockCreateItemModel.fromJson(response.data);

        return right(createData);
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
  Future<Either<MainFailures, StockCreateItemModel>> editStock(
      {required int itemId,
      required int subCategoryId,
      required int categoryId,
      required int businessId,
      required String brand,
      required String itemName,
      required String unit,
      required String hsn,
      required int skuCode,
      required int gstPercentage,
      required double salesPrice,
      required double purchasePrice,
      required int shopId,
      required int availableStock,
      required int lowAlertUnits,
      required bool lowAlertStatus}) async {
    try {
      final Response response = await _networkServices.createPutRequest(
        url: "${ApiEndPoints.createStock}$itemId",
        data: {
          "sub_category_id": subCategoryId,
          "category_id": categoryId,
          "business_id": businessId,
          "brand": brand,
          "item_name": itemName,
          "sku_code": skuCode,
          "unit": unit,
          "sales_price": salesPrice,
          "purchase_price": purchasePrice,
          "hsn": hsn,
          "gst_percentage": gstPercentage,
          "shop_data": {
            "shop_id": shopId,
            "available_stock": availableStock,
            "low_alert_units": lowAlertUnits,
            "low_alert_status": lowAlertStatus
          }
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.data.toString());
        final createData = StockCreateItemModel.fromJson(response.data);

        return right(createData);
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
  Future<Either<MainFailures, String>> stockIn(
      {required int itemId,
      required int shopId,
      required int quantity,
      required int supplierId,
      required String date,
      required String remarks,
      required int invoiceNumber,
      required double gstPercentage,
      required double purchasePrice,
      required double totalAmount,
      required double cashAmount,
      required double onlineAmount,
      required int dueAmount}) async {
    try {
      final Response response = await _networkServices.createPostRequest(
        url: ApiEndPoints.stockIn,
        data: {
          "item_id": itemId,
          "shop_id": shopId,
          "quantity": quantity,
          "supplier_id": supplierId,
          "date": date,
          "purchase_price": purchasePrice,
          "gst_percentage": gstPercentage,
          "total_amount": totalAmount,
          "cash_amount_recieved": cashAmount,
          "online_amount_recieved": onlineAmount,
          "due_amount": dueAmount,
          "invoice_number": invoiceNumber,
          "remarks": remarks
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.data.toString());
        // final stockIn = StockInModel.fromJson(response.data);

        return right('Stock in successFull');
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
  Future<Either<MainFailures, String>> stockOut(
      {required int itemId,
      required int shopId,
      required int quantity,
      required int customerId,
      required String date,
      required String remarks,
      required int invoiceNumber,
      required double gstPercentage,
      required double salesPrice,
      required double totalAmount,
      required double cashAmount,
      required double onlineAmount,
      required int dueAmount}) async {
    try {
      final Response response = await _networkServices
          .createPostRequest(url: ApiEndPoints.stockOut, data: {
        "item_id": itemId,
        "shop_id": shopId,
        "quantity": quantity,
        "customer_id": customerId,
        "date": date,
        "sales_price": salesPrice,
        "gst_percentage": gstPercentage,
        "total_amount": totalAmount,
        "cash_amount_received": cashAmount,
        "online_amount_received": onlineAmount,
        "due_amount": dueAmount,
        "invoice_number": invoiceNumber,
        "remarks": remarks
      });
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.data.toString());
        // final stockOut = StockOutModel.fromJson(response.data);

        return right('Stock out successFull');
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
  Future<Either<MainFailures, String>> stockTransfer(
      {required int itemId,
      required int toShopId,
      required int fromShopId,
      required double quantity,
      required String date}) async {
    try {
      log('Stock transfer stock repo');
      final Response response = await _networkServices
          .createPostRequest(url: ApiEndPoints.stockTransfer, data: {
        "item_id": itemId,
        "source_shop_id": fromShopId,
        "destination_shop_id": toShopId,
        "quantity": quantity,
        "date": date
      });

      if (response.statusCode == 200 || response.statusCode == 201) {
        // final stockOut = StockOutModel.fromJson(response.data);

        return const Right('Stock transfer successFull');
      } else {
        return Left(MainFailures.serverFailure(
            errorMessage: response.statusMessage ?? 'Something went wrong'));
      }
    } catch (e) {
      log(e.toString());

      return const Left(
          MainFailures.clientFailure(errorMessage: 'Connection failed'));
    }
  }

  @override
  Future<Either<MainFailures, InvoiceAllItemModel>> getAllStockItems(
      {required int businessId}) async {
    try {
      final Response response = await _networkServices.createGetRequest(
          url: ApiEndPoints.getAllStockItems,
          data: {"business_id": businessId});

      if (response.statusCode == 200 || response.statusCode == 201) {
        final allItemResp = InvoiceAllItemModel.fromJson(response.data);

        return Right(allItemResp);
      } else {
        return Left(MainFailures.serverFailure(
            errorMessage: response.statusMessage ?? 'Something went wrong'));
      }
    } catch (e) {
      log('Stock transfer stock repo error');

      return const Left(
          MainFailures.clientFailure(errorMessage: 'Connection failed'));
    }
  }

  @override
  Future<Either<MainFailures, TransferInfoModel>> getTransferDetails(
      {required int itemId, required int businessId}) async {
    try {
      final Response response = await _networkServices.createGetRequest(
        url: "${ApiEndPoints.getTransferInfo}$businessId/$itemId}",
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.toString());

        final allItemResp = TransferInfoModel.fromJson(response.data);

        return Right(allItemResp);
      } else {
        return Left(MainFailures.serverFailure(
            errorMessage: response.statusMessage ?? 'Something went wrong'));
      }
    } catch (e) {
      log('Stock transfer stock repo error');

      return const Left(
          MainFailures.clientFailure(errorMessage: 'Connection failed'));
    }
  }

  @override
  Future<Either<MainFailures, MyListDetailsModel>> getMyLists(
      {required int shopId}) async {
    try {
      final Response response = await _networkServices.createGetRequest(
        url: "${ApiEndPoints.getItemLists}$shopId}",
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final myItems = MyListDetailsModel.fromJson(response.data);

        return Right(myItems);
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
  Future<Either<MainFailures, ItemTimeLineModel>> getItemTimeLine(
      {required int itemId}) async {
    try {
      final Response response = await _networkServices.createGetRequest(
        url: "${ApiEndPoints.getItemTimeLine}$itemId}",
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.toString());

        final myItems = ItemTimeLineModel.fromJson(response.data);

        return Right(myItems);
      } else {
        return Left(MainFailures.serverFailure(
            errorMessage: response.statusMessage ?? 'Something went wrong'));
      }
    } catch (e) {
      log('getItemTimeLine repo error => ${e.toString()}');

      return const Left(
          MainFailures.clientFailure(errorMessage: 'Connection failed'));
    }
  }

  @override
  Future<Either<MainFailures, ItemShopModel>> getItemStores(
      {required int itemId}) async {
    try {
      final Response response = await _networkServices.createGetRequest(
        url: "${ApiEndPoints.getItemInStore}$itemId}",
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.toString());

        final myItems = ItemShopModel.fromJson(response.data);

        return Right(myItems);
      } else {
        return Left(MainFailures.serverFailure(
            errorMessage: response.statusMessage ?? 'Something went wrong'));
      }
    } catch (e) {
      log('ItemShopModel repo error => ${e.toString()}');
      return const Left(
          MainFailures.clientFailure(errorMessage: 'Connection failed'));
    }
  }

  @override
  Future<Either<MainFailures, GetAllShopsModel>> getAllShops(
      {required int businessId}) async {
    try {
      final Response response = await _networkServices.createGetRequest(
        url: "${ApiEndPoints.getAllStores}$businessId}",
      );
      log('getAllShops repo error => ${response.toString()}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.toString());

        final shops = GetAllShopsModel.fromJson(response.data);

        return Right(shops);
      } else {
        return Left(MainFailures.serverFailure(
            errorMessage: response.statusMessage ?? 'Something went wrong'));
      }
    } catch (e) {
      log('getAllShops repo error => ${e.toString()}');

      return const Left(
          MainFailures.clientFailure(errorMessage: 'Connection failed'));
    }
  }

  @override
  Future<Either<MainFailures, String>> addShop({
    required int businessId,
    required String shopName,
    required String shopColor,
    required bool isWareHouse,
    required String gstIN,
    required String state,
    required String city,
    required String street,
    required int pin,
  }) async {
    try {
      final Response response = await _networkServices
          .createPostRequest(url: ApiEndPoints.addStores, data: {
        "business_id": businessId,
        "shop_name": shopName,
        "shop_colour": shopColor,
        "is_warehouse": isWareHouse,
        "gst_in": gstIN,
        "address": {
          "state": state,
          "city": city,
          "pincode": pin,
          "street_address": street
        },
      });
      log('addShop => ${response.toString()}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(response.data.toString());
      } else {
        return Left(MainFailures.serverFailure(
            errorMessage: response.statusMessage ?? 'Something went wrong'));
      }
    } catch (e) {
      log('addShop repo error => ${e.toString()}');

      return const Left(
          MainFailures.clientFailure(errorMessage: 'Connection failed'));
    }
  }

  @override
  Future<Either<MainFailures, String>> updateShop(
      {required int storeId,
      required int businessId,
      required String shopName,
      required String shopColor,
      required bool isWareHouse,
      required String gstIN,
      required String state,
      required String city,
      required String street,
      required int pin}) async {
    try {
      final Response response = await _networkServices
          .createPutRequest(url: "${ApiEndPoints.updateStores}$storeId", data: {
        "business_id": businessId,
        "shop_name": shopName,
        "shop_colour": shopColor,
        "is_warehouse": isWareHouse,
        "gst_in": gstIN,
        "address": {
          "state": state,
          "city": city,
          "pincode": pin,
          "street_address": street
        },
      });
      log('updateShop => ${response.toString()}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(response.data.toString());
      } else {
        return Left(MainFailures.serverFailure(
            errorMessage: response.statusMessage ?? 'Something went wrong'));
      }
    } catch (e) {
      log('addShop repo error => ${e.toString()}');

      return const Left(
          MainFailures.clientFailure(errorMessage: 'Connection failed'));
    }
  }

  @override
  Future<Either<MainFailures, String>> updateItem({
    required String itemName,
    required String itemCode,
    required String categoryId,
    required String hsnSacCode,
    required String shopId,
    required String lowStockQty,
    required String imageUrl,
    required String itemId,
  }) async {
    try {
      String endPoint = "${ApiEndPoints.editItem}$itemId";
      final response =
          await _networkServices.createPutRequest(url: endPoint, data: {
        "item_name": itemName,
        "item_code": itemCode,
        "category_id": categoryId,
        "hsn_sac_code": hsnSacCode,
        "image_url": imageUrl,
        "shop_id": shopId,
        "low_stock_quantity": lowStockQty
      });

      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(response.data.toString());
      } else {
        return Left(MainFailures.serverFailure(
            errorMessage: response.statusMessage ?? "Something went wrong"));
      }
    } catch (e) {
      return const Left(
          MainFailures.clientFailure(errorMessage: 'Connection failed'));
    }
  }

  @override
  Future<Either<MainFailures, ItemCategoriesModel>> getItemCategories() async {
    /// getItemCategories
    try {
      String endPoint = "${ApiEndPoints.getItemCategories}";
      final response = await _networkServices.createGetRequest(url: endPoint);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final categories = ItemCategoriesModel.fromJson(response.data);
        return Right(categories);
      } else {
        return Left(MainFailures.serverFailure(
            errorMessage: response.statusMessage ?? "Something went wrong"));
      }
    } catch (e) {
      return const Left(
          MainFailures.clientFailure(errorMessage: 'Connection failed'));
    }
  }

  @override
  Future<Either<MainFailures, String>> createItem(
      {required Map<String, dynamic> itemData}) async {
    // TODO: implement createItem
    try {
      await Future.delayed(const Duration(seconds: 2));
      final Response response = await _networkServices.createPostRequest(
        //
        url: ApiEndPoints.createItem,
        data:
            //
            itemData,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(response.data.toString());
        // return Right(response.data.toString());
      } else {
        return Left(MainFailures.serverFailure(
            errorMessage: response.statusMessage ?? "Something went wrong"));
      }
      // return Right("_r");
      //
      // itemData.toString().log("createe itembody");
      // return Right("created");
    } catch (e) {
      e.toString().log("createe item");
      return const Left(
          MainFailures.clientFailure(errorMessage: 'Connection failed'));
    }
  }

  @override
  Future<Either<MainFailures, String>> creteTask(
      {required CreateTaskRequestModel body}) async {
    // TODO: implement creteTask
    try {
      var response = await _networkServices.createPostRequest(
          url: ApiEndPoints.createTask, data: body.toJson());
      response.data.toString().log("createe task");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return const Right("task created");
      } else {
        return Left(MainFailures.serverFailure(
            errorMessage: response.statusMessage ?? "Something went wrong"));
      }
    } catch (e) {
      return const Left(
          MainFailures.clientFailure(errorMessage: 'Connection failed'));
    }
  }

  @override
  Future<Either<MainFailures, EmployeeDashboardStatusModel>> getAllTask(
      {required int? shopId}) async {
    try {
      String endPoint = "${ApiEndPoints.getAllTasks}$shopId";
      final response = await _networkServices.createGetRequest(url: endPoint);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final employeeAllTasks =
            EmployeeDashboardStatusModel.fromJson(response.data);
        return Right(employeeAllTasks);
      } else {
        return Left(MainFailures.serverFailure(
            errorMessage: response.statusMessage ?? "Something went wrong"));
      }
    } catch (e) {
      return const Left(
          MainFailures.clientFailure(errorMessage: 'Connection failed'));
    }
  }

  @override
  Future<Either<MainFailures, EmployeeUpcomingTasksModel>> getAllUpcomingTasks(
      {required int? shopId}) async {
    try {
      String endPoint = "${ApiEndPoints.getAllTasks}$shopId";
      final response = await _networkServices.createGetRequest(url: endPoint);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final employeeAllUpcomingTasks =
            EmployeeUpcomingTasksModel.fromJson(response.data);
        return Right(employeeAllUpcomingTasks);
      } else {
        return Left(MainFailures.serverFailure(
            errorMessage: response.statusMessage ?? "Something went wrong"));
      }
    } catch (e) {
      return const Left(
          MainFailures.clientFailure(errorMessage: 'Connection failed'));
    }
  }

  @override
  Future<Either<MainFailures, EmployeeStartWorkingModel>>
      updateStartWorkingTask(
          {required int taskId,
          required EmployeeStartWorkingModel body}) async {
    body.toJson().toString().log("updated body");
    try {
      String endPoint = "${ApiEndPoints.updateStartWorking}$taskId";
      final response = await _networkServices.createPutRequest(
        url: endPoint,
        data: body.toJson(),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final employeeStartWorkingModel =
            EmployeeStartWorkingModel.fromJson(response.data);
        response.data.toString().log("The task has been in upcoming section");
        return Right(employeeStartWorkingModel);
      } else {
        return Left(MainFailures.serverFailure(
            errorMessage: response.statusMessage ?? "Something went wrong"));
      }
    } catch (e) {
      return const Left(
          MainFailures.clientFailure(errorMessage: 'Connection failed'));
    }
  }

  @override
  Future<Either<MainFailures, AllItemsOfStore>> getAllStoreItems(
      {required int? shopId}) async {
    try {
      String endPoint = "${ApiEndPoints.allStoreItems}$shopId";
      final response = await _networkServices.createGetRequest(url: endPoint);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final allItemsOfStore = AllItemsOfStore.fromJson(response.data);
        return Right(allItemsOfStore);
      } else {
        return Left(MainFailures.serverFailure(
            errorMessage: response.statusMessage ?? "Something went wrong"));
      }
    } catch (e) {
      return const Left(
          MainFailures.clientFailure(errorMessage: 'Connection failed'));
    }
  }
}

// ===========
