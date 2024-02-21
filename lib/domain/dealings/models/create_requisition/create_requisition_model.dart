import 'package:json_annotation/json_annotation.dart';

part 'create_requisition_model.g.dart';

@JsonSerializable()
class CreateRequisitionModel {
  @JsonKey(name: "business_id")
  int? businessId;
  @JsonKey(name: "vendors")
  List<VendorData>? vendors;
  @JsonKey(name: "requisition_items")
  List<RequisitionItemData>? requisitionItems;

  CreateRequisitionModel({
    this.businessId,
    this.vendors,
    this.requisitionItems,
  });

  factory CreateRequisitionModel.fromJson(Map<String, dynamic> json) => _$CreateRequisitionModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreateRequisitionModelToJson(this);
}

@JsonSerializable()
class RequisitionItemData {
  @JsonKey(name: "item_id")
  int? itemId;
  @JsonKey(name: "item_quantity")
  int? itemQuantity;
  @JsonKey(name: "item_units")
  String? itemUnits;

  RequisitionItemData({
    this.itemId,
    this.itemQuantity,
    this.itemUnits,
  });

  factory RequisitionItemData.fromJson(Map<String, dynamic> json) => _$RequisitionItemDataFromJson(json);

  Map<String, dynamic> toJson() => _$RequisitionItemDataToJson(this);
}

@JsonSerializable()
class VendorData {
  @JsonKey(name: "business_id")
  int? businessId;

  VendorData({
    this.businessId,
  });

  factory VendorData.fromJson(Map<String, dynamic> json) => _$VendorDataFromJson(json);

  Map<String, dynamic> toJson() => _$VendorDataToJson(this);
}
