// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    RouteAddBankAccount.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ScreenAddBankAccount(),
      );
    },
    RouteAddNewStaff.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ScreenAddNewStaff(),
      );
    },
    RouteAuthCategorySelection.name: (routeData) {
      final args = routeData.argsAs<RouteAuthCategorySelectionArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ScreenAuthCategorySelection(
          key: args.key,
          signUpReqModel: args.signUpReqModel,
        ),
      );
    },
    RouteBankAccount.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ScreenBankAccount(),
      );
    },
    RouteBusinessAddAndEditStock.name: (routeData) {
      final args = routeData.argsAs<RouteBusinessAddAndEditStockArgs>(
          orElse: () => const RouteBusinessAddAndEditStockArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ScreenBusinessAddAndEditStock(
          key: args.key,
          itemInfoModel: args.itemInfoModel,
          categoryId: args.categoryId,
        ),
      );
    },
    RouteBusinessAddCustomer.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ScreenBusinessAddCustomer(),
      );
    },
    RouteBusinessAddNewParty.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ScreenBusinessAddNewParty(),
      );
    },
    RouteBusinessAddSupplier.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ScreenBusinessAddSupplier(),
      );
    },
    RouteBusinessHome.name: (routeData) {
      final args = routeData.argsAs<RouteBusinessHomeArgs>(
          orElse: () => const RouteBusinessHomeArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ScreenBusinessHome(key: args.key),
      );
    },
    RouteBusinessManagement.name: (routeData) {
      final args = routeData.argsAs<RouteBusinessManagementArgs>(
          orElse: () => const RouteBusinessManagementArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ScreenBusinessManagement(
          key: args.key,
          store: args.store,
        ),
      );
    },
    RouteBusinessManagementStoreList.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ScreenBusinessManagementStoreList(),
      );
    },
    RouteBusinessOldHome.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ScreenBusinessOldHome(),
      );
    },
    RouteBusinessSignup.name: (routeData) {
      final args = routeData.argsAs<RouteBusinessSignupArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ScreenBusinessSignup(
          key: args.key,
          phoneNumber: args.phoneNumber,
        ),
      );
    },
    RouteBusinessStockIn.name: (routeData) {
      final args = routeData.argsAs<RouteBusinessStockInArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ScreenBusinessStockIn(
          key: args.key,
          stockItemsData: args.stockItemsData,
        ),
      );
    },
    RouteBusinessStockItemList.name: (routeData) {
      final args = routeData.argsAs<RouteBusinessStockItemListArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ScreenBusinessStockItemList(
          key: args.key,
          shopId: args.shopId,
          stock: args.stock,
          businessId: args.businessId,
          categoryId: args.categoryId,
        ),
      );
    },
    RouteBusinessStockOut.name: (routeData) {
      final args = routeData.argsAs<RouteBusinessStockOutArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ScreenBusinessStockOut(
          key: args.key,
          stockItemsData: args.stockItemsData,
        ),
      );
    },
    RouteBusinessStockTransfer.name: (routeData) {
      final args = routeData.argsAs<RouteBusinessStockTransferArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ScreenBusinessStockTransfer(
          key: args.key,
          stockItemsData: args.stockItemsData,
        ),
      );
    },
    RouteCreateItem.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ScreenCreateItem(),
      );
    },
    RouteCreateItemNew.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ScreenCreateItemNew(),
      );
    },
    RouteCreateItemSuccess.name: (routeData) {
      final args = routeData.argsAs<RouteCreateItemSuccessArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ScreenCreateItemSuccess(
          key: args.key,
          bloc: args.bloc,
          state: args.state,
        ),
      );
    },
    RouteCustomerHome.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ScreenCustomerHome(),
      );
    },
    RouteCustomerSignup.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ScreenCustomerSignup(),
      );
    },
    RouteEditItem.name: (routeData) {
      final args = routeData.argsAs<RouteEditItemArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ScreenEditItem(
          key: args.key,
          itemInfoData: args.itemInfoData,
        ),
      );
    },
    RouteEmployeeAddDetails.name: (routeData) {
      final args = routeData.argsAs<RouteEmployeeAddDetailsArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ScreenEmployeeAddDetails(
          key: args.key,
          qpid: args.qpid,
        ),
      );
    },
    RouteEmployeeHome.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ScreenEmployeeHome(),
      );
    },
    RouteEmployeePayment.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ScreenEmployeePayment(),
      );
    },
    RouteEmployeeRegister.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ScreenEmployeeRegister(),
      );
    },
    RouteEmployeeSignup.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ScreenEmployeeSignup(),
      );
    },
    RouteInvoiceAddItem.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ScreenInvoiceAddItem(),
      );
    },
    RouteInvoiceNewPurchase.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ScreenInvoiceNewPurchase(),
      );
    },
    RouteInvoiceNewSale.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ScreenInvoiceNewSale(),
      );
    },
    RouteInvoiceSelectCustomer.name: (routeData) {
      final args = routeData.argsAs<RouteInvoiceSelectCustomerArgs>(
          orElse: () => const RouteInvoiceSelectCustomerArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ScreenInvoiceSelectCustomer(
          key: args.key,
          currentCustomer: args.currentCustomer,
          suppliers: args.suppliers,
        ),
      );
    },
    RouteInvoiceSelectSupplier.name: (routeData) {
      final args = routeData.argsAs<RouteInvoiceSelectSupplierArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ScreenInvoiceSelectSupplier(
          key: args.key,
          currentSupplier: args.currentSupplier,
          suppliers: args.suppliers,
        ),
      );
    },
    RouteMyBusinessProfile.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ScreenMyBusinessProfile(),
      );
    },
    RouteMyListsInfo.name: (routeData) {
      final args = routeData.argsAs<RouteMyListsInfoArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ScreenMyListsInfo(
          key: args.key,
          itemData: args.itemData,
        ),
      );
    },
    RouteOtp.name: (routeData) {
      final args = routeData.argsAs<RouteOtpArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ScreenOtp(
          key: args.key,
          authType: args.authType,
          phoneNumber: args.phoneNumber,
        ),
      );
    },
    RouteOtpNew.name: (routeData) {
      final args = routeData.argsAs<RouteOtpNewArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ScreenOtpNew(
          key: args.key,
          authType: args.authType,
          phoneNumber: args.phoneNumber,
        ),
      );
    },
    RoutePaymentStaffMember.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ScreenPaymentStaffMember(),
      );
    },
    RouteProfile.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ScreenProfile(),
      );
    },
    RouteSignUp.name: (routeData) {
      final args = routeData.argsAs<RouteSignUpArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ScreenSignUp(
          key: args.key,
          authType: args.authType,
        ),
      );
    },
    RouteSignUpNew.name: (routeData) {
      final args = routeData.argsAs<RouteSignUpNewArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ScreenSignUpNew(
          key: args.key,
          authType: args.authType,
        ),
      );
    },
    RouteSignupOrLogin.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ScreenSignupOrLogin(),
      );
    },
    RouteSplash.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ScreenSplash(),
      );
    },
    RouteSplashNew.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ScreenSplashNew(),
      );
    },
    RouteStaffManagement.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ScreenStaffManagement(),
      );
    },
    RouteStaffMemberDayAttendance.name: (routeData) {
      final args = routeData.argsAs<RouteStaffMemberDayAttendanceArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ScreenStaffMemberDayAttendance(
          key: args.key,
          businessStaffManagementBloc: args.businessStaffManagementBloc,
        ),
      );
    },
    RouteStaffMemberProfile.name: (routeData) {
      final args = routeData.argsAs<RouteStaffMemberProfileArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ScreenStaffMemberProfile(
          key: args.key,
          bloc: args.bloc,
        ),
      );
    },
    RouteStockInSelectSupplier.name: (routeData) {
      final args = routeData.argsAs<RouteStockInSelectSupplierArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ScreenStockInSelectSupplier(
          key: args.key,
          currentSupplier: args.currentSupplier,
          suppliers: args.suppliers,
        ),
      );
    },
    RouteStockInvoice.name: (routeData) {
      final args = routeData.argsAs<RouteStockInvoiceArgs>(
          orElse: () => const RouteStockInvoiceArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ScreenStockInvoice(
          key: args.key,
          child: args.child,
        ),
      );
    },
    RouteStockItemInfo.name: (routeData) {
      final args = routeData.argsAs<RouteStockItemInfoArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ScreenStockItemInfo(
          key: args.key,
          itemsData: args.itemsData,
        ),
      );
    },
    RouteStockSelectCustomers.name: (routeData) {
      final args = routeData.argsAs<RouteStockSelectCustomersArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ScreenStockSelectCustomers(
          key: args.key,
          currentCustomer: args.currentCustomer,
          customers: args.customers,
        ),
      );
    },
    RouteTransactionSalesInvoice.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ScreenTransactionSalesInvoice(),
      );
    },
    RouteTransactionsPurchase.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ScreenTransactionsPurchase(),
      );
    },
    RouteUserSelectionNew.name: (routeData) {
      final args = routeData.argsAs<RouteUserSelectionNewArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ScreenUserSelectionNew(
          key: args.key,
          phoneNumber: args.phoneNumber,
        ),
      );
    },
  };
}

/// generated route for
/// [ScreenAddBankAccount]
class RouteAddBankAccount extends PageRouteInfo<void> {
  const RouteAddBankAccount({List<PageRouteInfo>? children})
      : super(
          RouteAddBankAccount.name,
          initialChildren: children,
        );

  static const String name = 'RouteAddBankAccount';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ScreenAddNewStaff]
class RouteAddNewStaff extends PageRouteInfo<void> {
  const RouteAddNewStaff({List<PageRouteInfo>? children})
      : super(
          RouteAddNewStaff.name,
          initialChildren: children,
        );

  static const String name = 'RouteAddNewStaff';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ScreenAuthCategorySelection]
class RouteAuthCategorySelection
    extends PageRouteInfo<RouteAuthCategorySelectionArgs> {
  RouteAuthCategorySelection({
    Key? key,
    required SignUpReqModel signUpReqModel,
    List<PageRouteInfo>? children,
  }) : super(
          RouteAuthCategorySelection.name,
          args: RouteAuthCategorySelectionArgs(
            key: key,
            signUpReqModel: signUpReqModel,
          ),
          initialChildren: children,
        );

  static const String name = 'RouteAuthCategorySelection';

  static const PageInfo<RouteAuthCategorySelectionArgs> page =
      PageInfo<RouteAuthCategorySelectionArgs>(name);
}

class RouteAuthCategorySelectionArgs {
  const RouteAuthCategorySelectionArgs({
    this.key,
    required this.signUpReqModel,
  });

  final Key? key;

  final SignUpReqModel signUpReqModel;

  @override
  String toString() {
    return 'RouteAuthCategorySelectionArgs{key: $key, signUpReqModel: $signUpReqModel}';
  }
}

/// generated route for
/// [ScreenBankAccount]
class RouteBankAccount extends PageRouteInfo<void> {
  const RouteBankAccount({List<PageRouteInfo>? children})
      : super(
          RouteBankAccount.name,
          initialChildren: children,
        );

  static const String name = 'RouteBankAccount';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ScreenBusinessAddAndEditStock]
class RouteBusinessAddAndEditStock
    extends PageRouteInfo<RouteBusinessAddAndEditStockArgs> {
  RouteBusinessAddAndEditStock({
    Key? key,
    MyListItemInfoData? itemInfoModel,
    int? categoryId,
    List<PageRouteInfo>? children,
  }) : super(
          RouteBusinessAddAndEditStock.name,
          args: RouteBusinessAddAndEditStockArgs(
            key: key,
            itemInfoModel: itemInfoModel,
            categoryId: categoryId,
          ),
          initialChildren: children,
        );

  static const String name = 'RouteBusinessAddAndEditStock';

  static const PageInfo<RouteBusinessAddAndEditStockArgs> page =
      PageInfo<RouteBusinessAddAndEditStockArgs>(name);
}

class RouteBusinessAddAndEditStockArgs {
  const RouteBusinessAddAndEditStockArgs({
    this.key,
    this.itemInfoModel,
    this.categoryId,
  });

  final Key? key;

  final MyListItemInfoData? itemInfoModel;

  final int? categoryId;

  @override
  String toString() {
    return 'RouteBusinessAddAndEditStockArgs{key: $key, itemInfoModel: $itemInfoModel, categoryId: $categoryId}';
  }
}

/// generated route for
/// [ScreenBusinessAddCustomer]
class RouteBusinessAddCustomer extends PageRouteInfo<void> {
  const RouteBusinessAddCustomer({List<PageRouteInfo>? children})
      : super(
          RouteBusinessAddCustomer.name,
          initialChildren: children,
        );

  static const String name = 'RouteBusinessAddCustomer';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ScreenBusinessAddNewParty]
class RouteBusinessAddNewParty extends PageRouteInfo<void> {
  const RouteBusinessAddNewParty({List<PageRouteInfo>? children})
      : super(
          RouteBusinessAddNewParty.name,
          initialChildren: children,
        );

  static const String name = 'RouteBusinessAddNewParty';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ScreenBusinessAddSupplier]
class RouteBusinessAddSupplier extends PageRouteInfo<void> {
  const RouteBusinessAddSupplier({List<PageRouteInfo>? children})
      : super(
          RouteBusinessAddSupplier.name,
          initialChildren: children,
        );

  static const String name = 'RouteBusinessAddSupplier';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ScreenBusinessHome]
class RouteBusinessHome extends PageRouteInfo<RouteBusinessHomeArgs> {
  RouteBusinessHome({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          RouteBusinessHome.name,
          args: RouteBusinessHomeArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'RouteBusinessHome';

  static const PageInfo<RouteBusinessHomeArgs> page =
      PageInfo<RouteBusinessHomeArgs>(name);
}

class RouteBusinessHomeArgs {
  const RouteBusinessHomeArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'RouteBusinessHomeArgs{key: $key}';
  }
}

/// generated route for
/// [ScreenBusinessManagement]
class RouteBusinessManagement
    extends PageRouteInfo<RouteBusinessManagementArgs> {
  RouteBusinessManagement({
    Key? key,
    GetAllShopsData? store,
    List<PageRouteInfo>? children,
  }) : super(
          RouteBusinessManagement.name,
          args: RouteBusinessManagementArgs(
            key: key,
            store: store,
          ),
          initialChildren: children,
        );

  static const String name = 'RouteBusinessManagement';

  static const PageInfo<RouteBusinessManagementArgs> page =
      PageInfo<RouteBusinessManagementArgs>(name);
}

class RouteBusinessManagementArgs {
  const RouteBusinessManagementArgs({
    this.key,
    this.store,
  });

  final Key? key;

  final GetAllShopsData? store;

  @override
  String toString() {
    return 'RouteBusinessManagementArgs{key: $key, store: $store}';
  }
}

/// generated route for
/// [ScreenBusinessManagementStoreList]
class RouteBusinessManagementStoreList extends PageRouteInfo<void> {
  const RouteBusinessManagementStoreList({List<PageRouteInfo>? children})
      : super(
          RouteBusinessManagementStoreList.name,
          initialChildren: children,
        );

  static const String name = 'RouteBusinessManagementStoreList';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ScreenBusinessOldHome]
class RouteBusinessOldHome extends PageRouteInfo<void> {
  const RouteBusinessOldHome({List<PageRouteInfo>? children})
      : super(
          RouteBusinessOldHome.name,
          initialChildren: children,
        );

  static const String name = 'RouteBusinessOldHome';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ScreenBusinessSignup]
class RouteBusinessSignup extends PageRouteInfo<RouteBusinessSignupArgs> {
  RouteBusinessSignup({
    Key? key,
    required String phoneNumber,
    List<PageRouteInfo>? children,
  }) : super(
          RouteBusinessSignup.name,
          args: RouteBusinessSignupArgs(
            key: key,
            phoneNumber: phoneNumber,
          ),
          initialChildren: children,
        );

  static const String name = 'RouteBusinessSignup';

  static const PageInfo<RouteBusinessSignupArgs> page =
      PageInfo<RouteBusinessSignupArgs>(name);
}

class RouteBusinessSignupArgs {
  const RouteBusinessSignupArgs({
    this.key,
    required this.phoneNumber,
  });

  final Key? key;

  final String phoneNumber;

  @override
  String toString() {
    return 'RouteBusinessSignupArgs{key: $key, phoneNumber: $phoneNumber}';
  }
}

/// generated route for
/// [ScreenBusinessStockIn]
class RouteBusinessStockIn extends PageRouteInfo<RouteBusinessStockInArgs> {
  RouteBusinessStockIn({
    Key? key,
    required StockItemsData stockItemsData,
    List<PageRouteInfo>? children,
  }) : super(
          RouteBusinessStockIn.name,
          args: RouteBusinessStockInArgs(
            key: key,
            stockItemsData: stockItemsData,
          ),
          initialChildren: children,
        );

  static const String name = 'RouteBusinessStockIn';

  static const PageInfo<RouteBusinessStockInArgs> page =
      PageInfo<RouteBusinessStockInArgs>(name);
}

class RouteBusinessStockInArgs {
  const RouteBusinessStockInArgs({
    this.key,
    required this.stockItemsData,
  });

  final Key? key;

  final StockItemsData stockItemsData;

  @override
  String toString() {
    return 'RouteBusinessStockInArgs{key: $key, stockItemsData: $stockItemsData}';
  }
}

/// generated route for
/// [ScreenBusinessStockItemList]
class RouteBusinessStockItemList
    extends PageRouteInfo<RouteBusinessStockItemListArgs> {
  RouteBusinessStockItemList({
    Key? key,
    required int shopId,
    required StockTypeData stock,
    required int businessId,
    required int categoryId,
    List<PageRouteInfo>? children,
  }) : super(
          RouteBusinessStockItemList.name,
          args: RouteBusinessStockItemListArgs(
            key: key,
            shopId: shopId,
            stock: stock,
            businessId: businessId,
            categoryId: categoryId,
          ),
          initialChildren: children,
        );

  static const String name = 'RouteBusinessStockItemList';

  static const PageInfo<RouteBusinessStockItemListArgs> page =
      PageInfo<RouteBusinessStockItemListArgs>(name);
}

class RouteBusinessStockItemListArgs {
  const RouteBusinessStockItemListArgs({
    this.key,
    required this.shopId,
    required this.stock,
    required this.businessId,
    required this.categoryId,
  });

  final Key? key;

  final int shopId;

  final StockTypeData stock;

  final int businessId;

  final int categoryId;

  @override
  String toString() {
    return 'RouteBusinessStockItemListArgs{key: $key, shopId: $shopId, stock: $stock, businessId: $businessId, categoryId: $categoryId}';
  }
}

/// generated route for
/// [ScreenBusinessStockOut]
class RouteBusinessStockOut extends PageRouteInfo<RouteBusinessStockOutArgs> {
  RouteBusinessStockOut({
    Key? key,
    required StockItemsData stockItemsData,
    List<PageRouteInfo>? children,
  }) : super(
          RouteBusinessStockOut.name,
          args: RouteBusinessStockOutArgs(
            key: key,
            stockItemsData: stockItemsData,
          ),
          initialChildren: children,
        );

  static const String name = 'RouteBusinessStockOut';

  static const PageInfo<RouteBusinessStockOutArgs> page =
      PageInfo<RouteBusinessStockOutArgs>(name);
}

class RouteBusinessStockOutArgs {
  const RouteBusinessStockOutArgs({
    this.key,
    required this.stockItemsData,
  });

  final Key? key;

  final StockItemsData stockItemsData;

  @override
  String toString() {
    return 'RouteBusinessStockOutArgs{key: $key, stockItemsData: $stockItemsData}';
  }
}

/// generated route for
/// [ScreenBusinessStockTransfer]
class RouteBusinessStockTransfer
    extends PageRouteInfo<RouteBusinessStockTransferArgs> {
  RouteBusinessStockTransfer({
    Key? key,
    required StockItemsData stockItemsData,
    List<PageRouteInfo>? children,
  }) : super(
          RouteBusinessStockTransfer.name,
          args: RouteBusinessStockTransferArgs(
            key: key,
            stockItemsData: stockItemsData,
          ),
          initialChildren: children,
        );

  static const String name = 'RouteBusinessStockTransfer';

  static const PageInfo<RouteBusinessStockTransferArgs> page =
      PageInfo<RouteBusinessStockTransferArgs>(name);
}

class RouteBusinessStockTransferArgs {
  const RouteBusinessStockTransferArgs({
    this.key,
    required this.stockItemsData,
  });

  final Key? key;

  final StockItemsData stockItemsData;

  @override
  String toString() {
    return 'RouteBusinessStockTransferArgs{key: $key, stockItemsData: $stockItemsData}';
  }
}

/// generated route for
/// [ScreenCreateItem]
class RouteCreateItem extends PageRouteInfo<void> {
  const RouteCreateItem({List<PageRouteInfo>? children})
      : super(
          RouteCreateItem.name,
          initialChildren: children,
        );

  static const String name = 'RouteCreateItem';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ScreenCreateItemNew]
class RouteCreateItemNew extends PageRouteInfo<void> {
  const RouteCreateItemNew({List<PageRouteInfo>? children})
      : super(
          RouteCreateItemNew.name,
          initialChildren: children,
        );

  static const String name = 'RouteCreateItemNew';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ScreenCreateItemSuccess]
class RouteCreateItemSuccess extends PageRouteInfo<RouteCreateItemSuccessArgs> {
  RouteCreateItemSuccess({
    Key? key,
    required BusinessCreateItemBloc bloc,
    required BusinessCreateItemState state,
    List<PageRouteInfo>? children,
  }) : super(
          RouteCreateItemSuccess.name,
          args: RouteCreateItemSuccessArgs(
            key: key,
            bloc: bloc,
            state: state,
          ),
          initialChildren: children,
        );

  static const String name = 'RouteCreateItemSuccess';

  static const PageInfo<RouteCreateItemSuccessArgs> page =
      PageInfo<RouteCreateItemSuccessArgs>(name);
}

class RouteCreateItemSuccessArgs {
  const RouteCreateItemSuccessArgs({
    this.key,
    required this.bloc,
    required this.state,
  });

  final Key? key;

  final BusinessCreateItemBloc bloc;

  final BusinessCreateItemState state;

  @override
  String toString() {
    return 'RouteCreateItemSuccessArgs{key: $key, bloc: $bloc, state: $state}';
  }
}

/// generated route for
/// [ScreenCustomerHome]
class RouteCustomerHome extends PageRouteInfo<void> {
  const RouteCustomerHome({List<PageRouteInfo>? children})
      : super(
          RouteCustomerHome.name,
          initialChildren: children,
        );

  static const String name = 'RouteCustomerHome';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ScreenCustomerSignup]
class RouteCustomerSignup extends PageRouteInfo<void> {
  const RouteCustomerSignup({List<PageRouteInfo>? children})
      : super(
          RouteCustomerSignup.name,
          initialChildren: children,
        );

  static const String name = 'RouteCustomerSignup';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ScreenEditItem]
class RouteEditItem extends PageRouteInfo<RouteEditItemArgs> {
  RouteEditItem({
    Key? key,
    required MyListItemInfoData? itemInfoData,
    List<PageRouteInfo>? children,
  }) : super(
          RouteEditItem.name,
          args: RouteEditItemArgs(
            key: key,
            itemInfoData: itemInfoData,
          ),
          initialChildren: children,
        );

  static const String name = 'RouteEditItem';

  static const PageInfo<RouteEditItemArgs> page =
      PageInfo<RouteEditItemArgs>(name);
}

class RouteEditItemArgs {
  const RouteEditItemArgs({
    this.key,
    required this.itemInfoData,
  });

  final Key? key;

  final MyListItemInfoData? itemInfoData;

  @override
  String toString() {
    return 'RouteEditItemArgs{key: $key, itemInfoData: $itemInfoData}';
  }
}

/// generated route for
/// [ScreenEmployeeAddDetails]
class RouteEmployeeAddDetails
    extends PageRouteInfo<RouteEmployeeAddDetailsArgs> {
  RouteEmployeeAddDetails({
    Key? key,
    required int qpid,
    List<PageRouteInfo>? children,
  }) : super(
          RouteEmployeeAddDetails.name,
          args: RouteEmployeeAddDetailsArgs(
            key: key,
            qpid: qpid,
          ),
          initialChildren: children,
        );

  static const String name = 'RouteEmployeeAddDetails';

  static const PageInfo<RouteEmployeeAddDetailsArgs> page =
      PageInfo<RouteEmployeeAddDetailsArgs>(name);
}

class RouteEmployeeAddDetailsArgs {
  const RouteEmployeeAddDetailsArgs({
    this.key,
    required this.qpid,
  });

  final Key? key;

  final int qpid;

  @override
  String toString() {
    return 'RouteEmployeeAddDetailsArgs{key: $key, qpid: $qpid}';
  }
}

/// generated route for
/// [ScreenEmployeeHome]
class RouteEmployeeHome extends PageRouteInfo<void> {
  const RouteEmployeeHome({List<PageRouteInfo>? children})
      : super(
          RouteEmployeeHome.name,
          initialChildren: children,
        );

  static const String name = 'RouteEmployeeHome';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ScreenEmployeePayment]
class RouteEmployeePayment extends PageRouteInfo<void> {
  const RouteEmployeePayment({List<PageRouteInfo>? children})
      : super(
          RouteEmployeePayment.name,
          initialChildren: children,
        );

  static const String name = 'RouteEmployeePayment';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ScreenEmployeeRegister]
class RouteEmployeeRegister extends PageRouteInfo<void> {
  const RouteEmployeeRegister({List<PageRouteInfo>? children})
      : super(
          RouteEmployeeRegister.name,
          initialChildren: children,
        );

  static const String name = 'RouteEmployeeRegister';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ScreenEmployeeSignup]
class RouteEmployeeSignup extends PageRouteInfo<void> {
  const RouteEmployeeSignup({List<PageRouteInfo>? children})
      : super(
          RouteEmployeeSignup.name,
          initialChildren: children,
        );

  static const String name = 'RouteEmployeeSignup';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ScreenInvoiceAddItem]
class RouteInvoiceAddItem extends PageRouteInfo<void> {
  const RouteInvoiceAddItem({List<PageRouteInfo>? children})
      : super(
          RouteInvoiceAddItem.name,
          initialChildren: children,
        );

  static const String name = 'RouteInvoiceAddItem';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ScreenInvoiceNewPurchase]
class RouteInvoiceNewPurchase extends PageRouteInfo<void> {
  const RouteInvoiceNewPurchase({List<PageRouteInfo>? children})
      : super(
          RouteInvoiceNewPurchase.name,
          initialChildren: children,
        );

  static const String name = 'RouteInvoiceNewPurchase';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ScreenInvoiceNewSale]
class RouteInvoiceNewSale extends PageRouteInfo<void> {
  const RouteInvoiceNewSale({List<PageRouteInfo>? children})
      : super(
          RouteInvoiceNewSale.name,
          initialChildren: children,
        );

  static const String name = 'RouteInvoiceNewSale';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ScreenInvoiceSelectCustomer]
class RouteInvoiceSelectCustomer
    extends PageRouteInfo<RouteInvoiceSelectCustomerArgs> {
  RouteInvoiceSelectCustomer({
    Key? key,
    CustomersDatum? currentCustomer,
    List<CustomersDatum>? suppliers,
    List<PageRouteInfo>? children,
  }) : super(
          RouteInvoiceSelectCustomer.name,
          args: RouteInvoiceSelectCustomerArgs(
            key: key,
            currentCustomer: currentCustomer,
            suppliers: suppliers,
          ),
          initialChildren: children,
        );

  static const String name = 'RouteInvoiceSelectCustomer';

  static const PageInfo<RouteInvoiceSelectCustomerArgs> page =
      PageInfo<RouteInvoiceSelectCustomerArgs>(name);
}

class RouteInvoiceSelectCustomerArgs {
  const RouteInvoiceSelectCustomerArgs({
    this.key,
    this.currentCustomer,
    this.suppliers,
  });

  final Key? key;

  final CustomersDatum? currentCustomer;

  final List<CustomersDatum>? suppliers;

  @override
  String toString() {
    return 'RouteInvoiceSelectCustomerArgs{key: $key, currentCustomer: $currentCustomer, suppliers: $suppliers}';
  }
}

/// generated route for
/// [ScreenInvoiceSelectSupplier]
class RouteInvoiceSelectSupplier
    extends PageRouteInfo<RouteInvoiceSelectSupplierArgs> {
  RouteInvoiceSelectSupplier({
    Key? key,
    SuppliersDatum? currentSupplier,
    required List<SuppliersDatum> suppliers,
    List<PageRouteInfo>? children,
  }) : super(
          RouteInvoiceSelectSupplier.name,
          args: RouteInvoiceSelectSupplierArgs(
            key: key,
            currentSupplier: currentSupplier,
            suppliers: suppliers,
          ),
          initialChildren: children,
        );

  static const String name = 'RouteInvoiceSelectSupplier';

  static const PageInfo<RouteInvoiceSelectSupplierArgs> page =
      PageInfo<RouteInvoiceSelectSupplierArgs>(name);
}

class RouteInvoiceSelectSupplierArgs {
  const RouteInvoiceSelectSupplierArgs({
    this.key,
    this.currentSupplier,
    required this.suppliers,
  });

  final Key? key;

  final SuppliersDatum? currentSupplier;

  final List<SuppliersDatum> suppliers;

  @override
  String toString() {
    return 'RouteInvoiceSelectSupplierArgs{key: $key, currentSupplier: $currentSupplier, suppliers: $suppliers}';
  }
}

/// generated route for
/// [ScreenMyBusinessProfile]
class RouteMyBusinessProfile extends PageRouteInfo<void> {
  const RouteMyBusinessProfile({List<PageRouteInfo>? children})
      : super(
          RouteMyBusinessProfile.name,
          initialChildren: children,
        );

  static const String name = 'RouteMyBusinessProfile';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ScreenMyListsInfo]
class RouteMyListsInfo extends PageRouteInfo<RouteMyListsInfoArgs> {
  RouteMyListsInfo({
    Key? key,
    required MyListDetailsData itemData,
    List<PageRouteInfo>? children,
  }) : super(
          RouteMyListsInfo.name,
          args: RouteMyListsInfoArgs(
            key: key,
            itemData: itemData,
          ),
          initialChildren: children,
        );

  static const String name = 'RouteMyListsInfo';

  static const PageInfo<RouteMyListsInfoArgs> page =
      PageInfo<RouteMyListsInfoArgs>(name);
}

class RouteMyListsInfoArgs {
  const RouteMyListsInfoArgs({
    this.key,
    required this.itemData,
  });

  final Key? key;

  final MyListDetailsData itemData;

  @override
  String toString() {
    return 'RouteMyListsInfoArgs{key: $key, itemData: $itemData}';
  }
}

/// generated route for
/// [ScreenOtp]
class RouteOtp extends PageRouteInfo<RouteOtpArgs> {
  RouteOtp({
    Key? key,
    required String authType,
    required String phoneNumber,
    List<PageRouteInfo>? children,
  }) : super(
          RouteOtp.name,
          args: RouteOtpArgs(
            key: key,
            authType: authType,
            phoneNumber: phoneNumber,
          ),
          initialChildren: children,
        );

  static const String name = 'RouteOtp';

  static const PageInfo<RouteOtpArgs> page = PageInfo<RouteOtpArgs>(name);
}

class RouteOtpArgs {
  const RouteOtpArgs({
    this.key,
    required this.authType,
    required this.phoneNumber,
  });

  final Key? key;

  final String authType;

  final String phoneNumber;

  @override
  String toString() {
    return 'RouteOtpArgs{key: $key, authType: $authType, phoneNumber: $phoneNumber}';
  }
}

/// generated route for
/// [ScreenOtpNew]
class RouteOtpNew extends PageRouteInfo<RouteOtpNewArgs> {
  RouteOtpNew({
    Key? key,
    required String authType,
    required String phoneNumber,
    List<PageRouteInfo>? children,
  }) : super(
          RouteOtpNew.name,
          args: RouteOtpNewArgs(
            key: key,
            authType: authType,
            phoneNumber: phoneNumber,
          ),
          initialChildren: children,
        );

  static const String name = 'RouteOtpNew';

  static const PageInfo<RouteOtpNewArgs> page = PageInfo<RouteOtpNewArgs>(name);
}

class RouteOtpNewArgs {
  const RouteOtpNewArgs({
    this.key,
    required this.authType,
    required this.phoneNumber,
  });

  final Key? key;

  final String authType;

  final String phoneNumber;

  @override
  String toString() {
    return 'RouteOtpNewArgs{key: $key, authType: $authType, phoneNumber: $phoneNumber}';
  }
}

/// generated route for
/// [ScreenPaymentStaffMember]
class RoutePaymentStaffMember extends PageRouteInfo<void> {
  const RoutePaymentStaffMember({List<PageRouteInfo>? children})
      : super(
          RoutePaymentStaffMember.name,
          initialChildren: children,
        );

  static const String name = 'RoutePaymentStaffMember';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ScreenProfile]
class RouteProfile extends PageRouteInfo<void> {
  const RouteProfile({List<PageRouteInfo>? children})
      : super(
          RouteProfile.name,
          initialChildren: children,
        );

  static const String name = 'RouteProfile';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ScreenSignUp]
class RouteSignUp extends PageRouteInfo<RouteSignUpArgs> {
  RouteSignUp({
    Key? key,
    required String authType,
    List<PageRouteInfo>? children,
  }) : super(
          RouteSignUp.name,
          args: RouteSignUpArgs(
            key: key,
            authType: authType,
          ),
          initialChildren: children,
        );

  static const String name = 'RouteSignUp';

  static const PageInfo<RouteSignUpArgs> page = PageInfo<RouteSignUpArgs>(name);
}

class RouteSignUpArgs {
  const RouteSignUpArgs({
    this.key,
    required this.authType,
  });

  final Key? key;

  final String authType;

  @override
  String toString() {
    return 'RouteSignUpArgs{key: $key, authType: $authType}';
  }
}

/// generated route for
/// [ScreenSignUpNew]
class RouteSignUpNew extends PageRouteInfo<RouteSignUpNewArgs> {
  RouteSignUpNew({
    Key? key,
    required String authType,
    List<PageRouteInfo>? children,
  }) : super(
          RouteSignUpNew.name,
          args: RouteSignUpNewArgs(
            key: key,
            authType: authType,
          ),
          initialChildren: children,
        );

  static const String name = 'RouteSignUpNew';

  static const PageInfo<RouteSignUpNewArgs> page =
      PageInfo<RouteSignUpNewArgs>(name);
}

class RouteSignUpNewArgs {
  const RouteSignUpNewArgs({
    this.key,
    required this.authType,
  });

  final Key? key;

  final String authType;

  @override
  String toString() {
    return 'RouteSignUpNewArgs{key: $key, authType: $authType}';
  }
}

/// generated route for
/// [ScreenSignupOrLogin]
class RouteSignupOrLogin extends PageRouteInfo<void> {
  const RouteSignupOrLogin({List<PageRouteInfo>? children})
      : super(
          RouteSignupOrLogin.name,
          initialChildren: children,
        );

  static const String name = 'RouteSignupOrLogin';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ScreenSplash]
class RouteSplash extends PageRouteInfo<void> {
  const RouteSplash({List<PageRouteInfo>? children})
      : super(
          RouteSplash.name,
          initialChildren: children,
        );

  static const String name = 'RouteSplash';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ScreenSplashNew]
class RouteSplashNew extends PageRouteInfo<void> {
  const RouteSplashNew({List<PageRouteInfo>? children})
      : super(
          RouteSplashNew.name,
          initialChildren: children,
        );

  static const String name = 'RouteSplashNew';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ScreenStaffManagement]
class RouteStaffManagement extends PageRouteInfo<void> {
  const RouteStaffManagement({List<PageRouteInfo>? children})
      : super(
          RouteStaffManagement.name,
          initialChildren: children,
        );

  static const String name = 'RouteStaffManagement';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ScreenStaffMemberDayAttendance]
class RouteStaffMemberDayAttendance
    extends PageRouteInfo<RouteStaffMemberDayAttendanceArgs> {
  RouteStaffMemberDayAttendance({
    Key? key,
    required BusinessStaffManagementBloc businessStaffManagementBloc,
    List<PageRouteInfo>? children,
  }) : super(
          RouteStaffMemberDayAttendance.name,
          args: RouteStaffMemberDayAttendanceArgs(
            key: key,
            businessStaffManagementBloc: businessStaffManagementBloc,
          ),
          initialChildren: children,
        );

  static const String name = 'RouteStaffMemberDayAttendance';

  static const PageInfo<RouteStaffMemberDayAttendanceArgs> page =
      PageInfo<RouteStaffMemberDayAttendanceArgs>(name);
}

class RouteStaffMemberDayAttendanceArgs {
  const RouteStaffMemberDayAttendanceArgs({
    this.key,
    required this.businessStaffManagementBloc,
  });

  final Key? key;

  final BusinessStaffManagementBloc businessStaffManagementBloc;

  @override
  String toString() {
    return 'RouteStaffMemberDayAttendanceArgs{key: $key, businessStaffManagementBloc: $businessStaffManagementBloc}';
  }
}

/// generated route for
/// [ScreenStaffMemberProfile]
class RouteStaffMemberProfile
    extends PageRouteInfo<RouteStaffMemberProfileArgs> {
  RouteStaffMemberProfile({
    Key? key,
    required BusinessStaffManagementBloc bloc,
    List<PageRouteInfo>? children,
  }) : super(
          RouteStaffMemberProfile.name,
          args: RouteStaffMemberProfileArgs(
            key: key,
            bloc: bloc,
          ),
          initialChildren: children,
        );

  static const String name = 'RouteStaffMemberProfile';

  static const PageInfo<RouteStaffMemberProfileArgs> page =
      PageInfo<RouteStaffMemberProfileArgs>(name);
}

class RouteStaffMemberProfileArgs {
  const RouteStaffMemberProfileArgs({
    this.key,
    required this.bloc,
  });

  final Key? key;

  final BusinessStaffManagementBloc bloc;

  @override
  String toString() {
    return 'RouteStaffMemberProfileArgs{key: $key, bloc: $bloc}';
  }
}

/// generated route for
/// [ScreenStockInSelectSupplier]
class RouteStockInSelectSupplier
    extends PageRouteInfo<RouteStockInSelectSupplierArgs> {
  RouteStockInSelectSupplier({
    Key? key,
    required SuppliersDatum? currentSupplier,
    required List<SuppliersDatum> suppliers,
    List<PageRouteInfo>? children,
  }) : super(
          RouteStockInSelectSupplier.name,
          args: RouteStockInSelectSupplierArgs(
            key: key,
            currentSupplier: currentSupplier,
            suppliers: suppliers,
          ),
          initialChildren: children,
        );

  static const String name = 'RouteStockInSelectSupplier';

  static const PageInfo<RouteStockInSelectSupplierArgs> page =
      PageInfo<RouteStockInSelectSupplierArgs>(name);
}

class RouteStockInSelectSupplierArgs {
  const RouteStockInSelectSupplierArgs({
    this.key,
    required this.currentSupplier,
    required this.suppliers,
  });

  final Key? key;

  final SuppliersDatum? currentSupplier;

  final List<SuppliersDatum> suppliers;

  @override
  String toString() {
    return 'RouteStockInSelectSupplierArgs{key: $key, currentSupplier: $currentSupplier, suppliers: $suppliers}';
  }
}

/// generated route for
/// [ScreenStockInvoice]
class RouteStockInvoice extends PageRouteInfo<RouteStockInvoiceArgs> {
  RouteStockInvoice({
    Key? key,
    Widget? child,
    List<PageRouteInfo>? children,
  }) : super(
          RouteStockInvoice.name,
          args: RouteStockInvoiceArgs(
            key: key,
            child: child,
          ),
          initialChildren: children,
        );

  static const String name = 'RouteStockInvoice';

  static const PageInfo<RouteStockInvoiceArgs> page =
      PageInfo<RouteStockInvoiceArgs>(name);
}

class RouteStockInvoiceArgs {
  const RouteStockInvoiceArgs({
    this.key,
    this.child,
  });

  final Key? key;

  final Widget? child;

  @override
  String toString() {
    return 'RouteStockInvoiceArgs{key: $key, child: $child}';
  }
}

/// generated route for
/// [ScreenStockItemInfo]
class RouteStockItemInfo extends PageRouteInfo<RouteStockItemInfoArgs> {
  RouteStockItemInfo({
    Key? key,
    required StockItemsData itemsData,
    List<PageRouteInfo>? children,
  }) : super(
          RouteStockItemInfo.name,
          args: RouteStockItemInfoArgs(
            key: key,
            itemsData: itemsData,
          ),
          initialChildren: children,
        );

  static const String name = 'RouteStockItemInfo';

  static const PageInfo<RouteStockItemInfoArgs> page =
      PageInfo<RouteStockItemInfoArgs>(name);
}

class RouteStockItemInfoArgs {
  const RouteStockItemInfoArgs({
    this.key,
    required this.itemsData,
  });

  final Key? key;

  final StockItemsData itemsData;

  @override
  String toString() {
    return 'RouteStockItemInfoArgs{key: $key, itemsData: $itemsData}';
  }
}

/// generated route for
/// [ScreenStockSelectCustomers]
class RouteStockSelectCustomers
    extends PageRouteInfo<RouteStockSelectCustomersArgs> {
  RouteStockSelectCustomers({
    Key? key,
    CustomersDatum? currentCustomer,
    required List<CustomersDatum> customers,
    List<PageRouteInfo>? children,
  }) : super(
          RouteStockSelectCustomers.name,
          args: RouteStockSelectCustomersArgs(
            key: key,
            currentCustomer: currentCustomer,
            customers: customers,
          ),
          initialChildren: children,
        );

  static const String name = 'RouteStockSelectCustomers';

  static const PageInfo<RouteStockSelectCustomersArgs> page =
      PageInfo<RouteStockSelectCustomersArgs>(name);
}

class RouteStockSelectCustomersArgs {
  const RouteStockSelectCustomersArgs({
    this.key,
    this.currentCustomer,
    required this.customers,
  });

  final Key? key;

  final CustomersDatum? currentCustomer;

  final List<CustomersDatum> customers;

  @override
  String toString() {
    return 'RouteStockSelectCustomersArgs{key: $key, currentCustomer: $currentCustomer, customers: $customers}';
  }
}

/// generated route for
/// [ScreenTransactionSalesInvoice]
class RouteTransactionSalesInvoice extends PageRouteInfo<void> {
  const RouteTransactionSalesInvoice({List<PageRouteInfo>? children})
      : super(
          RouteTransactionSalesInvoice.name,
          initialChildren: children,
        );

  static const String name = 'RouteTransactionSalesInvoice';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ScreenTransactionsPurchase]
class RouteTransactionsPurchase extends PageRouteInfo<void> {
  const RouteTransactionsPurchase({List<PageRouteInfo>? children})
      : super(
          RouteTransactionsPurchase.name,
          initialChildren: children,
        );

  static const String name = 'RouteTransactionsPurchase';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ScreenUserSelectionNew]
class RouteUserSelectionNew extends PageRouteInfo<RouteUserSelectionNewArgs> {
  RouteUserSelectionNew({
    Key? key,
    required String phoneNumber,
    List<PageRouteInfo>? children,
  }) : super(
          RouteUserSelectionNew.name,
          args: RouteUserSelectionNewArgs(
            key: key,
            phoneNumber: phoneNumber,
          ),
          initialChildren: children,
        );

  static const String name = 'RouteUserSelectionNew';

  static const PageInfo<RouteUserSelectionNewArgs> page =
      PageInfo<RouteUserSelectionNewArgs>(name);
}

class RouteUserSelectionNewArgs {
  const RouteUserSelectionNewArgs({
    this.key,
    required this.phoneNumber,
  });

  final Key? key;

  final String phoneNumber;

  @override
  String toString() {
    return 'RouteUserSelectionNewArgs{key: $key, phoneNumber: $phoneNumber}';
  }
}
