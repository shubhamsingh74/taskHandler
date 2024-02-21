import 'package:json_annotation/json_annotation.dart';

part 'create_purchase_body_model.g.dart';

@JsonSerializable()
class CreatePurchaseBodyModel {
  @JsonKey(name: "supplier_id")
  final int? supplierId;
  @JsonKey(name: "shop_id")
  final int? shopId;
  @JsonKey(name: "items_details")
  final List<CreatePurchaseItemsDetail>? itemsDetails;
  @JsonKey(name: "gst_percentage")
  final int? gstPercentage;
  @JsonKey(name: "cash_amount_recieved")
  final int? cashAmountRecieved;
  @JsonKey(name: "online_amount_recieved")
  final int? onlineAmountRecieved;
  @JsonKey(name: "due_amount")
  final int? dueAmount;
  @JsonKey(name: "remarks")
  final String? remarks;
  @JsonKey(name: "date")
  final String? date;
  @JsonKey(name: "time")
  final String? time;

  CreatePurchaseBodyModel({
    this.supplierId,
    this.shopId,
    this.itemsDetails,
    this.gstPercentage,
    this.cashAmountRecieved,
    this.onlineAmountRecieved,
    this.dueAmount,
    this.remarks,
    this.date,
    this.time,
  });

  CreatePurchaseBodyModel copyWith({
    int? supplierId,
    int? shopId,
    List<CreatePurchaseItemsDetail>? itemsDetails,
    int? gstPercentage,
    int? cashAmountRecieved,
    int? onlineAmountRecieved,
    int? dueAmount,
    String? remarks,
    String? date,
    String? time,
  }) =>
      CreatePurchaseBodyModel(
        supplierId: supplierId ?? this.supplierId,
        shopId: shopId ?? this.shopId,
        itemsDetails: itemsDetails ?? this.itemsDetails,
        gstPercentage: gstPercentage ?? this.gstPercentage,
        cashAmountRecieved: cashAmountRecieved ?? this.cashAmountRecieved,
        onlineAmountRecieved: onlineAmountRecieved ?? this.onlineAmountRecieved,
        dueAmount: dueAmount ?? this.dueAmount,
        remarks: remarks ?? this.remarks,
        date: date ?? this.date,
        time: time ?? this.time,
      );

  factory CreatePurchaseBodyModel.fromJson(Map<String, dynamic> json) =>
      _$CreatePurchaseBodyModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreatePurchaseBodyModelToJson(this);
}

@JsonSerializable()
class CreatePurchaseItemsDetail {
  @JsonKey(name: "item_id")
  final int? itemId;
  @JsonKey(name: "quantity")
  final int? quantity;
  @JsonKey(name: "price")
  final double? price;
  @JsonKey(name: "date")
  final String? date;

  CreatePurchaseItemsDetail({
    this.itemId,
    this.quantity,
    this.price,
    this.date,
  });

  CreatePurchaseItemsDetail copyWith({
    int? itemId,
    int? quantity,
    double? price,
    String? date,
  }) =>
      CreatePurchaseItemsDetail(
        itemId: itemId ?? this.itemId,
        quantity: quantity ?? this.quantity,
        price: price ?? this.price,
        date: date ?? this.date,
      );

  factory CreatePurchaseItemsDetail.fromJson(Map<String, dynamic> json) =>
      _$CreatePurchaseItemsDetailFromJson(json);

  Map<String, dynamic> toJson() => _$CreatePurchaseItemsDetailToJson(this);
}
