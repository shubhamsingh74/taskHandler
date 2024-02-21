// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'transaction_requisition_bloc.dart';

@immutable
abstract class BusinessTransactionRequisitionEvent {}

class RequisitionGetAllItemsEvent extends BusinessTransactionRequisitionEvent {
  int shopId;

  RequisitionGetAllItemsEvent({required this.shopId});
}

class GetAllVendors extends BusinessTransactionRequisitionEvent {}

class RequisitionSelectItemSaveItemDetailsEvent
    extends BusinessTransactionRequisitionEvent {
  String itemName;
  String itemUnit;
  String itemCategory;
  String itemBrand;
  int itemQuantity;
  int itemId;

  // String vendorName;
  // int vendorId;

  String state;
  String buyersSignature;
  String billingAddress;
  String shippingAddress;

  List<Map<String, dynamic>> itemDetails = [];
  List<Map<String, dynamic>> vendorsDetails = [];

  RequisitionSelectItemSaveItemDetailsEvent({
    required this.itemUnit,
    required this.itemId,
    required this.itemQuantity,
    required this.itemName,
    required this.itemBrand,
    required this.itemCategory,
    required this.itemDetails,
    required this.vendorsDetails,
    required this.shippingAddress,
    required this.buyersSignature,
    required this.billingAddress,
    required this.state,
  });
}

class CreateRequisitionEvent extends BusinessTransactionRequisitionEvent {
  int businessId;
  // int itemId;
  // int itemQuantity;
  // String itemUnit;
  List<RequisitionItemData> itemDetails = [];
  List<VendorData> vendorsDetails = [];

  CreateRequisitionEvent(
      {required this.vendorsDetails,
      required this.businessId,
      // required this.itemId,
      // required this.itemQuantity,
      // required this.itemUnit,
      required this.itemDetails});
}
