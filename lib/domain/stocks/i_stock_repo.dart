import 'package:dartz/dartz.dart';
import 'package:quickprism/domain/core/failures/main_failures.dart';
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

import '../invoice/models/invoice_all_item_model.dart';

abstract class IStockRepo {
  Future<Either<MainFailures, CategoryModel>> getCategories();
  Future<Either<MainFailures, SubCategoryModel>> getSubCategories(
      {int categoryId = 1});
  Future<Either<MainFailures, StockTypeDetailsModel>> getStockDetails({
    required int businessId,
    required int categoryId,
  });

  Future<Either<MainFailures, StockItemsModel>> getStockShopItems({
    required int subCategoryId,
    required int shopId,
    required int businessId,
  });
  Future<Either<MainFailures, MyListItemInfoModel>> getItemInfo({
    required int itemId,
  });
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
  });

  Future<Either<MainFailures, StockCreateItemModel>> editStock({
    required int itemId,
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
  });
  Future<Either<MainFailures, String>> stockIn({
    required int itemId,
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
    required int dueAmount,
  });
  Future<Either<MainFailures, String>> stockOut({
    required int itemId,
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
    required int dueAmount,
  });
  Future<Either<MainFailures, String>> stockTransfer({
    required int itemId,
    required int toShopId,
    required int fromShopId,
    required double quantity,
    required String date,
  });

  Future<Either<MainFailures, InvoiceAllItemModel>> getAllStockItems({
    required int businessId,
  });

  Future<Either<MainFailures, TransferInfoModel>> getTransferDetails(
      {required int itemId, required int businessId});

  Future<Either<MainFailures, MyListDetailsModel>> getMyLists(
      {required int shopId});
  Future<Either<MainFailures, ItemTimeLineModel>> getItemTimeLine(
      {required int itemId});
  Future<Either<MainFailures, ItemShopModel>> getItemStores(
      {required int itemId});

  Future<Either<MainFailures, GetAllShopsModel>> getAllShops(
      {required int businessId});

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
  });
  Future<Either<MainFailures, String>> updateShop({
    required int storeId,
    required int businessId,
    required String shopName,
    required String shopColor,
    required bool isWareHouse,
    required String gstIN,
    required String state,
    required String city,
    required String street,
    required int pin,
  });
  Future<Either<MainFailures, String>> createItem(
      {required Map<String, dynamic> itemData});


  Future<Either<MainFailures, String>> updateItem({
    required String itemName,
    required String itemCode,
    required String categoryId,
    required String hsnSacCode,
    required String shopId,
    required String lowStockQty,
    required String imageUrl,
    required String itemId,
  });
  Future<Either<MainFailures, ItemCategoriesModel>> getItemCategories();

  Future<Either<MainFailures, String>> creteTask(
      {required CreateTaskRequestModel body});

  Future<Either<MainFailures, EmployeeDashboardStatusModel>> getAllTask(
      {required int? shopId});


  Future<Either<MainFailures, EmployeeUpcomingTasksModel>> getAllUpcomingTasks(
      {required int? shopId});

  Future<Either<MainFailures, EmployeeStartWorkingModel>> updateStartWorkingTask(
      {required  int taskId,required EmployeeStartWorkingModel body});

  Future<Either<MainFailures, AllItemsOfStore>> getAllStoreItems(
      {required int? shopId});

}
