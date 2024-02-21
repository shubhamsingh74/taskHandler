import 'package:json_annotation/json_annotation.dart';

part 'stock_items_model.g.dart';

@JsonSerializable()
class StockItemsModel {
  @JsonKey(name: "success")
  final bool? success;
  @JsonKey(name: "data")
  final List<StockItemsData>? data;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "time")
  final String? time;

  StockItemsModel({
    this.success,
    this.data,
    this.message,
    this.time,
  });

  StockItemsModel copyWith({
    bool? success,
    List<StockItemsData>? data,
    String? message,
    String? time,
  }) =>
      StockItemsModel(
        success: success ?? this.success,
        data: data ?? this.data,
        message: message ?? this.message,
        time: time ?? this.time,
      );

  factory StockItemsModel.fromJson(Map<String, dynamic> json) =>
      _$StockItemsModelFromJson(json);

  Map<String, dynamic> toJson() => _$StockItemsModelToJson(this);
}

@JsonSerializable()
class StockItemsData {
  @JsonKey(name: "item_id")
  final int? itemId;
  @JsonKey(name: "item_name")
  final String? itemName;
  @JsonKey(name: "brand")
  final String? brand;
  @JsonKey(name: "available_stock")
  final int? availableStock;

  StockItemsData({
    this.itemId,
    this.brand,
    this.itemName,
    this.availableStock,
  });

  StockItemsData copyWith({
    int? itemId,
    String? brand,
    String? itemName,
    int? availableStock,
  }) =>
      StockItemsData(
        itemId: itemId ?? this.itemId,
        brand: brand ?? this.brand,
        itemName: itemName ?? this.itemName,
        availableStock: availableStock ?? this.availableStock,
      );

  factory StockItemsData.fromJson(Map<String, dynamic> json) =>
      _$StockItemsDataFromJson(json);

  Map<String, dynamic> toJson() => _$StockItemsDataToJson(this);
}
