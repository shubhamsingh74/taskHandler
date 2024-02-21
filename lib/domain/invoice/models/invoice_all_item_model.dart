import 'package:json_annotation/json_annotation.dart';

part 'invoice_all_item_model.g.dart';

@JsonSerializable()
class InvoiceAllItemModel {
  @JsonKey(name: "success")
  final bool? success;
  @JsonKey(name: "data")
  final List<InvoiceAllItemData>? data;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "time")
  final String? time;

  InvoiceAllItemModel({
    this.success,
    this.data,
    this.message,
    this.time,
  });

  InvoiceAllItemModel copyWith({
    bool? success,
    List<InvoiceAllItemData>? data,
    String? message,
    String? time,
  }) =>
      InvoiceAllItemModel(
        success: success ?? this.success,
        data: data ?? this.data,
        message: message ?? this.message,
        time: time ?? this.time,
      );

  factory InvoiceAllItemModel.fromJson(Map<String, dynamic> json) =>
      _$InvoiceAllItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$InvoiceAllItemModelToJson(this);
}

@JsonSerializable()
class InvoiceAllItemData {
  @JsonKey(name: "item_id")
  final int? itemId;
  @JsonKey(name: "item_name")
  final String? itemName;
  @JsonKey(name: "brand")
  final String? brand;
  @JsonKey(name: "purchase_price")
  final double? purchasePrice;

  InvoiceAllItemData({
    this.itemId,
    this.itemName,
    this.brand,
    this.purchasePrice,
  });

  InvoiceAllItemData copyWith({
    int? itemId,
    String? itemName,
    String? brand,
    double? purchasePrice,
  }) =>
      InvoiceAllItemData(
        itemId: itemId ?? this.itemId,
        itemName: itemName ?? this.itemName,
        brand: brand ?? this.brand,
        purchasePrice: purchasePrice ?? this.purchasePrice,
      );

  factory InvoiceAllItemData.fromJson(Map<String, dynamic> json) =>
      _$InvoiceAllItemDataFromJson(json);

  Map<String, dynamic> toJson() => _$InvoiceAllItemDataToJson(this);
}
