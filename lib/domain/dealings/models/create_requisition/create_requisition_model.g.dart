// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_requisition_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateRequisitionModel _$CreateRequisitionModelFromJson(
        Map<String, dynamic> json) =>
    CreateRequisitionModel(
      businessId: json['business_id'] as int?,
      vendors: (json['vendors'] as List<dynamic>?)
          ?.map((e) => VendorData.fromJson(e as Map<String, dynamic>))
          .toList(),
      requisitionItems: (json['requisition_items'] as List<dynamic>?)
          ?.map((e) => RequisitionItemData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CreateRequisitionModelToJson(
        CreateRequisitionModel instance) =>
    <String, dynamic>{
      'business_id': instance.businessId,
      'vendors': instance.vendors,
      'requisition_items': instance.requisitionItems,
    };

RequisitionItemData _$RequisitionItemDataFromJson(Map<String, dynamic> json) =>
    RequisitionItemData(
      itemId: json['item_id'] as int?,
      itemQuantity: json['item_quantity'] as int?,
      itemUnits: json['item_units'] as String?,
    );

Map<String, dynamic> _$RequisitionItemDataToJson(
        RequisitionItemData instance) =>
    <String, dynamic>{
      'item_id': instance.itemId,
      'item_quantity': instance.itemQuantity,
      'item_units': instance.itemUnits,
    };

VendorData _$VendorDataFromJson(Map<String, dynamic> json) => VendorData(
      businessId: json['business_id'] as int?,
    );

Map<String, dynamic> _$VendorDataToJson(VendorData instance) =>
    <String, dynamic>{
      'business_id': instance.businessId,
    };
