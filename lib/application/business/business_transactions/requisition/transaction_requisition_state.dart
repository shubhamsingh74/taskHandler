part of 'transaction_requisition_bloc.dart';

@immutable
abstract class BusinessTransactionRequisitionState {
  AllItemsOfStore? allItemsOfStore;
  VendorsModel? vendorsModel;

  String itemName;
  String itemCategory;
  String itemBrand;
  String itemUnit;
  int itemQuantity;
  int itemId;

  String state;
  String buyersSignature;
  String billingAddress;
  String shippingAddress;

  // String vendorName;
  // int vendorId;

  List<Map<String, dynamic>> itemDetails = [];
  List<Map<String, dynamic>> vendorDetails = [];

  BusinessTransactionRequisitionState(
      {required this.allItemsOfStore,
      required this.vendorsModel,
      required this.itemUnit,
      required this.itemCategory,
      required this.itemBrand,
      required this.itemName,
      required this.itemQuantity,
      required this.itemDetails,
      required this.itemId,
      required this.state,
      required this.billingAddress,
      required this.buyersSignature,
      required this.shippingAddress,
      required this.vendorDetails});
}

class RequisitionInitialState extends BusinessTransactionRequisitionState {
  RequisitionInitialState(
      {required super.itemUnit,
      required super.itemCategory,
      required super.itemBrand,
      required super.itemName,
      required super.itemQuantity,
      required super.itemDetails,
      required super.allItemsOfStore,
      required super.itemId,
      required super.state,
      required super.billingAddress,
      required super.buyersSignature,
      required super.shippingAddress,
      required super.vendorsModel,
      required super.vendorDetails,
     });
}

class RequisitionErrorState extends BusinessTransactionRequisitionState {
  RequisitionErrorState(
      {required super.itemUnit,
      required super.itemCategory,
      required super.itemBrand,
      required super.itemName,
      required super.itemQuantity,
      required super.itemDetails,
      required super.allItemsOfStore,
      required super.itemId,
      required super.state,
      required super.billingAddress,
      required super.buyersSignature,
      required super.shippingAddress,
      required super.vendorDetails,
      required super.vendorsModel,
     });
}

class RequisitionLoadingState extends BusinessTransactionRequisitionState {
  RequisitionLoadingState(
      {required super.itemUnit,
      required super.itemCategory,
      required super.itemBrand,
      required super.itemName,
      required super.itemQuantity,
      required super.itemDetails,
      required super.allItemsOfStore,
      required super.itemId,
      required super.state,
      required super.billingAddress,
      required super.buyersSignature,
      required super.shippingAddress,
      required super.vendorDetails,
      required super.vendorsModel,
      });
}

class CreateRequisitionSuccessState extends BusinessTransactionRequisitionState {
  CreateRequisitionSuccessState(
      {required super.itemUnit,
        required super.itemCategory,
        required super.itemBrand,
        required super.itemName,
        required super.itemQuantity,
        required super.itemDetails,
        required super.allItemsOfStore,
        required super.itemId,
        required super.state,
        required super.billingAddress,
        required super.buyersSignature,
        required super.shippingAddress,
        required super.vendorDetails,
        required super.vendorsModel,
      });
}



// class RequisitionAllStoreItemsErrorState
//     extends BusinessTransactionRequisitionState {
//   RequisitionAllStoreItemsErrorState(
//       {required super.itemUnit,
//       required super.itemCategory,
//       required super.itemBrand,
//       required super.itemName,
//       required super.itemQuantity,
//       required super.itemDetails, required super.allItemsOfStore});
// }
//
// class RequisitionAllStoreItemsSuccessState
//     extends BusinessTransactionRequisitionState {
//   final AllItemsOfStore allItemsOfStore;
//
//   RequisitionAllStoreItemsSuccessState(
//       {required this.allItemsOfStore,
//       required super.itemUnit,
//       required super.itemCategory,
//       required super.itemBrand,
//       required super.itemName,
//       required super.itemQuantity,
//       required super.itemDetails});
// }
//
// class CreateRequisitionSuccessState
//     extends BusinessTransactionRequisitionState {
//   CreateRequisitionSuccessState(
//       {required super.itemUnit,
//       required super.itemCategory,
//       required super.itemBrand,
//       required super.itemName,
//       required super.itemQuantity,
//       required super.itemDetails});
// }
//
// class CreateRequisitionErrorState extends BusinessTransactionRequisitionState {
//   CreateRequisitionErrorState(
//       {required super.itemUnit,
//       required super.itemCategory,
//       required super.itemBrand,
//       required super.itemName,
//       required super.itemQuantity,
//       required super.itemDetails});
// }
//
// class CreateRequisitionLoadingState
//     extends BusinessTransactionRequisitionState {
//   CreateRequisitionLoadingState(
//       {required super.itemUnit,
//       required super.itemCategory,
//       required super.itemBrand,
//       required super.itemName,
//       required super.itemQuantity,
//       required super.itemDetails});
// }
