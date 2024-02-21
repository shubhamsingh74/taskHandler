import 'package:quickprism/core/strings/app_strings.dart';

class ApiEndPoints {
  //user
  static const String sendOtp = "${kBaseUrl}users/v1/send-otp";
  static const String verifyOtp = "${kBaseUrl}users/v1/verify-otp";
  static const String userSignUp = "${kBaseUrl}users/v1/signup";
  static const String userSignIn = "${kBaseUrl}users/v1/signin";
  static const String getUser = "${kBaseUrl}users/v1/getUser/";
  static const String getVendors = "${kBaseUrl}users/v1/business";
  static const String getSuppliers = "${kBaseUrl}users/v1/businessSuppliers";
  static const String updateEmployeeAttendance = "${kBaseUrl}users/v1/attendance";

  // static const String getSuppliers =
  //     "${kBaseUrl}users/v1/DummyBusinessSuppliers";
  static const String getCustomers = "${kBaseUrl}users/v1/businessCustomers";
  static const String createSupplier = "${kBaseUrl}users/v1/businessSupplier";
  static const String createCustomers = "${kBaseUrl}users/v1/businessCustomer";
  static const String createBusiness = "${kBaseUrl}users/v1/business";
  static const String updateBusiness = "${kBaseUrl}users/v1/business/";
  static const String getBusinessType = "${kBaseUrl}users/v1/businessType";
  static const String getAllParties = "${kBaseUrl}users/v1/party";
  static const String createNewParty = "${kBaseUrl}users/v1/party";
  static const String createEmployeeUser = "${kBaseUrl}users/v1/employee";
  static const String createBusinessEmployee = "${kBaseUrl}users/v1/businessEmployee";

  //stock
  static const String getCategory = "${kBaseUrl}stocks/v1/categories";
  static const String getSubCategory = "${kBaseUrl}stocks/v1/sub-categories";
  static const String getStockDetail = "${kBaseUrl}stocks/v1/stockDetail";
  static const String getListShopItems = "${kBaseUrl}stocks/v1/listShopItems";
  static const String getAllStockItems = "${kBaseUrl}stocks/v1/items";
  static const String getStockInfo = "${kBaseUrl}stocks/v1/item/";
  static const String createStock = "${kBaseUrl}stocks/v1/item/";
  static const String editStock = "${kBaseUrl}stocks/v1/item/";
  static const String stockIn = "${kBaseUrl}stocks/v1/stockIn/";
  static const String stockOut = "${kBaseUrl}stocks/v1/stockOut/";
  static const String stockTransfer = "${kBaseUrl}stocks/v1/stockTransfer/";
  static const String getTransferInfo = "${kBaseUrl}stocks/v1/itemInBusiness/";
  static const String getItemTimeLine = "${kBaseUrl}stocks/v1/item/timeline/";
  static const String getItemInStore = "${kBaseUrl}stocks/v1/item/";
  static const String getItemLists = "${kBaseUrl}stocks/v1/item/getMyListDetail/";
  static const String getAllStores = "${kBaseUrl}stocks/v1/shops/";
  static const String addStores = "${kBaseUrl}stocks/v1/shop";
  static const String allStoreItems = "${kBaseUrl}stocks/v1/shop/";
  static const String updateStores = "${kBaseUrl}stocks/v1/shop/";
  static const String createItem = "${kBaseUrl}stocks/v1/item/";
  static const String editItem = "${kBaseUrl}stocks/v1/item/";
  static const String getItemCategories = "${kBaseUrl}stocks/v1/categories";
  static const String createTask = "${kBaseUrl}stocks/v1/tasks";
  static const String getAllTasks = "${kBaseUrl}stocks/v1/tasks/";
  static const String updateStartWorking = "${kBaseUrl}stocks//v1/tasks/";

  //invoice
  // static const String invoiceCreatePurchase = "${kBaseUrl}invoices/v1/purchase";
  static const String invoiceCreateSales = "${kBaseUrl}invoices/v1/sale";
  static const String invoiceGetSales = "${kBaseUrl}invoices/v1/sales/";
  static const String invoiceGetPurchase = "${kBaseUrl}invoices/v1/purchases/";
  static const String invoiceGetTransactionPageData =
      "${kBaseUrl}invoices/v1/invoice/pages/";
  static const String invoiceGetInvoicesByShop =
      "${kBaseUrl}invoices/v1/invoiceOfShop/";
  static const String createInvoice = "${kBaseUrl}invoices/v1/invoice/";
  static const String getItemLots = "${kBaseUrl}invoices/v1/itemLots/";

  static const String getUnitsWithQuantity =
      "${kBaseUrl}invoices/v1/sale/unitsWithQuatity";

  // staff
  static const String getAllStaff = "${kBaseUrl}users/v1/staff/";
  static const String createNewStaff = "${kBaseUrl}users/v1/staff";
  static const String getStaffAttendanceByMonth = "${kBaseUrl}users/v1/attendanceByMonth/";
  static const String getStaffAttendanceByDate = "${kBaseUrl}users/v1/attendanceByDate/";
  static const String updateStaffAttendance = "${kBaseUrl}users/v1/attendance/";
  static const String getEmployeeStatusVerifiedOrNot = "${kBaseUrl}users/v1/employee/";
  static const String getEmployeeCategoryPermission = "${kBaseUrl}users/v1/employeeCategoryPermission";
  static const String getEmployeeSubCategoryPermission = "${kBaseUrl}users/v1/empSubCategoryPermission";

  //employee
  static const String employeeTaskStatus = "${kBaseUrl}users/v1/attendance/";

  //dealings
  static const String createRequisition = "${kBaseUrl}dealings/v1/requisition";
}
