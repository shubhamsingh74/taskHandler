import 'package:json_annotation/json_annotation.dart';

part 'stock_out_model.g.dart';

@JsonSerializable()
class StockOutModel {
  @JsonKey(name: "success")
  final bool? success;
  @JsonKey(name: "data")
  final StockOutData? data;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "time")
  final String? time;

  StockOutModel({
    this.success,
    this.data,
    this.message,
    this.time,
  });

  StockOutModel copyWith({
    bool? success,
    StockOutData? data,
    String? message,
    String? time,
  }) =>
      StockOutModel(
        success: success ?? this.success,
        data: data ?? this.data,
        message: message ?? this.message,
        time: time ?? this.time,
      );

  factory StockOutModel.fromJson(Map<String, dynamic> json) =>
      _$StockOutModelFromJson(json);

  Map<String, dynamic> toJson() => _$StockOutModelToJson(this);
}

@JsonSerializable()
class StockOutData {
  @JsonKey(name: "cash_amount_received")
  final int? cashAmountReceived;
  @JsonKey(name: "online_amount_received")
  final int? onlineAmountReceived;
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "created_at")
  final AtedAt? createdAt;
  @JsonKey(name: "updated_at")
  final AtedAt? updatedAt;
  @JsonKey(name: "stock_out_record_id")
  final int? stockOutRecordId;
  @JsonKey(name: "item_id")
  final int? itemId;
  @JsonKey(name: "shop_id")
  final int? shopId;
  @JsonKey(name: "customer_id")
  final int? customerId;
  @JsonKey(name: "quantity")
  final int? quantity;
  @JsonKey(name: "sales_price")
  final double? salesPrice;
  @JsonKey(name: "gst_percentage")
  final int? gstPercentage;
  @JsonKey(name: "total_amount")
  final double? totalAmount;
  @JsonKey(name: "due_amount")
  final int? dueAmount;
  @JsonKey(name: "date")
  final DateTime? date;
  @JsonKey(name: "invoice_number")
  final int? invoiceNumber;
  @JsonKey(name: "remarks")
  final String? remarks;

  StockOutData({
    this.cashAmountReceived,
    this.onlineAmountReceived,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.stockOutRecordId,
    this.itemId,
    this.shopId,
    this.customerId,
    this.quantity,
    this.salesPrice,
    this.gstPercentage,
    this.totalAmount,
    this.dueAmount,
    this.date,
    this.invoiceNumber,
    this.remarks,
  });

  StockOutData copyWith({
    int? cashAmountReceived,
    int? onlineAmountReceived,
    String? status,
    AtedAt? createdAt,
    AtedAt? updatedAt,
    int? stockOutRecordId,
    int? itemId,
    int? shopId,
    int? customerId,
    int? quantity,
    double? salesPrice,
    int? gstPercentage,
    double? totalAmount,
    int? dueAmount,
    DateTime? date,
    int? invoiceNumber,
    String? remarks,
  }) =>
      StockOutData(
        cashAmountReceived: cashAmountReceived ?? this.cashAmountReceived,
        onlineAmountReceived: onlineAmountReceived ?? this.onlineAmountReceived,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        stockOutRecordId: stockOutRecordId ?? this.stockOutRecordId,
        itemId: itemId ?? this.itemId,
        shopId: shopId ?? this.shopId,
        customerId: customerId ?? this.customerId,
        quantity: quantity ?? this.quantity,
        salesPrice: salesPrice ?? this.salesPrice,
        gstPercentage: gstPercentage ?? this.gstPercentage,
        totalAmount: totalAmount ?? this.totalAmount,
        dueAmount: dueAmount ?? this.dueAmount,
        date: date ?? this.date,
        invoiceNumber: invoiceNumber ?? this.invoiceNumber,
        remarks: remarks ?? this.remarks,
      );

  factory StockOutData.fromJson(Map<String, dynamic> json) =>
      _$StockOutDataFromJson(json);

  Map<String, dynamic> toJson() => _$StockOutDataToJson(this);
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
