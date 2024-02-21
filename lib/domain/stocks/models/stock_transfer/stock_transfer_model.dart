import 'package:json_annotation/json_annotation.dart';

part 'stock_transfer_model.g.dart';

@JsonSerializable()
class StockTransferModel {
  @JsonKey(name: "success")
  final bool? success;
  @JsonKey(name: "data")
  final StockTransferData? data;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "time")
  final String? time;

  StockTransferModel({
    this.success,
    this.data,
    this.message,
    this.time,
  });

  StockTransferModel copyWith({
    bool? success,
    StockTransferData? data,
    String? message,
    String? time,
  }) =>
      StockTransferModel(
        success: success ?? this.success,
        data: data ?? this.data,
        message: message ?? this.message,
        time: time ?? this.time,
      );

  factory StockTransferModel.fromJson(Map<String, dynamic> json) =>
      _$StockTransferModelFromJson(json);

  Map<String, dynamic> toJson() => _$StockTransferModelToJson(this);
}

@JsonSerializable()
class StockTransferData {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "created_at")
  final AtedAt? createdAt;
  @JsonKey(name: "updated_at")
  final AtedAt? updatedAt;
  @JsonKey(name: "stock_transfer_id")
  final int? stockTransferId;
  @JsonKey(name: "source_shop_id")
  final int? sourceShopId;
  @JsonKey(name: "destination_shop_id")
  final int? destinationShopId;
  @JsonKey(name: "item_id")
  final int? itemId;
  @JsonKey(name: "quantity")
  final int? quantity;
  @JsonKey(name: "date")
  final DateTime? date;

  StockTransferData({
    this.status,
    this.createdAt,
    this.updatedAt,
    this.stockTransferId,
    this.sourceShopId,
    this.destinationShopId,
    this.itemId,
    this.quantity,
    this.date,
  });

  StockTransferData copyWith({
    String? status,
    AtedAt? createdAt,
    AtedAt? updatedAt,
    int? stockTransferId,
    int? sourceShopId,
    int? destinationShopId,
    int? itemId,
    int? quantity,
    DateTime? date,
  }) =>
      StockTransferData(
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        stockTransferId: stockTransferId ?? this.stockTransferId,
        sourceShopId: sourceShopId ?? this.sourceShopId,
        destinationShopId: destinationShopId ?? this.destinationShopId,
        itemId: itemId ?? this.itemId,
        quantity: quantity ?? this.quantity,
        date: date ?? this.date,
      );

  factory StockTransferData.fromJson(Map<String, dynamic> json) =>
      _$StockTransferDataFromJson(json);

  Map<String, dynamic> toJson() => _$StockTransferDataToJson(this);
}

@JsonSerializable()
class AtedAt {
  @JsonKey(name: "val")
  final String? val;

  AtedAt({
    this.val,
  });

  AtedAt copyWith({
    String? val,
  }) =>
      AtedAt(
        val: val ?? this.val,
      );

  factory AtedAt.fromJson(Map<String, dynamic> json) => _$AtedAtFromJson(json);

  Map<String, dynamic> toJson() => _$AtedAtToJson(this);
}
