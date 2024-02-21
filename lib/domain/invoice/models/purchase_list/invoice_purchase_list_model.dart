import 'package:json_annotation/json_annotation.dart';

part 'invoice_purchase_list_model.g.dart';

@JsonSerializable()
class InvoicePurchaseListModel {
  @JsonKey(name: "success")
  final bool? success;
  @JsonKey(name: "data")
  final List<InvoicePurchaseListData>? data;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "time")
  final String? time;

  InvoicePurchaseListModel({
    this.success,
    this.data,
    this.message,
    this.time,
  });

  InvoicePurchaseListModel copyWith({
    bool? success,
    List<InvoicePurchaseListData>? data,
    String? message,
    String? time,
  }) =>
      InvoicePurchaseListModel(
        success: success ?? this.success,
        data: data ?? this.data,
        message: message ?? this.message,
        time: time ?? this.time,
      );

  factory InvoicePurchaseListModel.fromJson(Map<String, dynamic> json) =>
      _$InvoicePurchaseListModelFromJson(json);

  Map<String, dynamic> toJson() => _$InvoicePurchaseListModelToJson(this);
}

@JsonSerializable()
class InvoicePurchaseListData {
  @JsonKey(name: "purchase_record_id")
  final int? purchaseRecordId;
  @JsonKey(name: "supplier_id")
  final int? supplierId;
  @JsonKey(name: "total_amount")
  final int? totalAmount;
  @JsonKey(name: "date")
  final DateTime? date;
  @JsonKey(name: "time")
  final String? time;
  @JsonKey(name: "invoice_url")
  final String? invoiceUrl;
  @JsonKey(name: "supplier_name")
  final String? supplierName;
  @JsonKey(name: "item_data")
  final List<String>? itemData;

  InvoicePurchaseListData({
    this.purchaseRecordId,
    this.supplierId,
    this.totalAmount,
    this.date,
    this.time,
    this.invoiceUrl,
    this.supplierName,
    this.itemData,
  });

  InvoicePurchaseListData copyWith({
    int? purchaseRecordId,
    int? supplierId,
    int? totalAmount,
    DateTime? date,
    String? time,
    String? invoiceUrl,
    String? supplierName,
    List<String>? itemData,
  }) =>
      InvoicePurchaseListData(
        purchaseRecordId: purchaseRecordId ?? this.purchaseRecordId,
        supplierId: supplierId ?? this.supplierId,
        totalAmount: totalAmount ?? this.totalAmount,
        date: date ?? this.date,
        time: time ?? this.time,
        invoiceUrl: invoiceUrl ?? this.invoiceUrl,
        supplierName: supplierName ?? this.supplierName,
        itemData: itemData ?? this.itemData,
      );

  factory InvoicePurchaseListData.fromJson(Map<String, dynamic> json) =>
      _$InvoicePurchaseListDataFromJson(json);

  Map<String, dynamic> toJson() => _$InvoicePurchaseListDataToJson(this);
}
