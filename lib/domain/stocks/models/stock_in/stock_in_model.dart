import 'package:json_annotation/json_annotation.dart';

part 'stock_in_model.g.dart';

@JsonSerializable()
class StockInModel {
  @JsonKey(name: "success")
  final bool? success;
  @JsonKey(name: "data")
  final Data? data;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "time")
  final String? time;

  StockInModel({
    this.success,
    this.data,
    this.message,
    this.time,
  });

  StockInModel copyWith({
    bool? success,
    Data? data,
    String? message,
    String? time,
  }) =>
      StockInModel(
        success: success ?? this.success,
        data: data ?? this.data,
        message: message ?? this.message,
        time: time ?? this.time,
      );

  factory StockInModel.fromJson(Map<String, dynamic> json) =>
      _$StockInModelFromJson(json);

  Map<String, dynamic> toJson() => _$StockInModelToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "cash_amount_paid")
  final int? cashAmountPaid;
  @JsonKey(name: "online_amount_paid")
  final int? onlineAmountPaid;
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "created_at")
  final AtedAt? createdAt;
  @JsonKey(name: "updated_at")
  final AtedAt? updatedAt;
  @JsonKey(name: "stock_in_record_id")
  final int? stockInRecordId;
  @JsonKey(name: "item_id")
  final int? itemId;
  @JsonKey(name: "shop_id")
  final int? shopId;
  @JsonKey(name: "supplier_id")
  final int? supplierId;
  @JsonKey(name: "quantity")
  final int? quantity;
  @JsonKey(name: "purchase_price")
  final double? purchasePrice;
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

  Data({
    this.cashAmountPaid,
    this.onlineAmountPaid,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.stockInRecordId,
    this.itemId,
    this.shopId,
    this.supplierId,
    this.quantity,
    this.purchasePrice,
    this.gstPercentage,
    this.totalAmount,
    this.dueAmount,
    this.date,
    this.invoiceNumber,
    this.remarks,
  });

  Data copyWith({
    int? cashAmountPaid,
    int? onlineAmountPaid,
    String? status,
    AtedAt? createdAt,
    AtedAt? updatedAt,
    int? stockInRecordId,
    int? itemId,
    int? shopId,
    int? supplierId,
    int? quantity,
    double? purchasePrice,
    int? gstPercentage,
    double? totalAmount,
    int? dueAmount,
    DateTime? date,
    int? invoiceNumber,
    String? remarks,
  }) =>
      Data(
        cashAmountPaid: cashAmountPaid ?? this.cashAmountPaid,
        onlineAmountPaid: onlineAmountPaid ?? this.onlineAmountPaid,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        stockInRecordId: stockInRecordId ?? this.stockInRecordId,
        itemId: itemId ?? this.itemId,
        shopId: shopId ?? this.shopId,
        supplierId: supplierId ?? this.supplierId,
        quantity: quantity ?? this.quantity,
        purchasePrice: purchasePrice ?? this.purchasePrice,
        gstPercentage: gstPercentage ?? this.gstPercentage,
        totalAmount: totalAmount ?? this.totalAmount,
        dueAmount: dueAmount ?? this.dueAmount,
        date: date ?? this.date,
        invoiceNumber: invoiceNumber ?? this.invoiceNumber,
        remarks: remarks ?? this.remarks,
      );

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
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
