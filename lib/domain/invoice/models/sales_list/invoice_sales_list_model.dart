import 'package:json_annotation/json_annotation.dart';

part 'invoice_sales_list_model.g.dart';

@JsonSerializable()
class InvoiceSalesListModel {
  @JsonKey(name: "success")
  final bool? success;
  @JsonKey(name: "data")
  final List<InvoiceSalesListData>? data;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "time")
  final String? time;

  InvoiceSalesListModel({
    this.success,
    this.data,
    this.message,
    this.time,
  });

  InvoiceSalesListModel copyWith({
    bool? success,
    List<InvoiceSalesListData>? data,
    String? message,
    String? time,
  }) =>
      InvoiceSalesListModel(
        success: success ?? this.success,
        data: data ?? this.data,
        message: message ?? this.message,
        time: time ?? this.time,
      );

  factory InvoiceSalesListModel.fromJson(Map<String, dynamic> json) =>
      _$InvoiceSalesListModelFromJson(json);

  Map<String, dynamic> toJson() => _$InvoiceSalesListModelToJson(this);
}

@JsonSerializable()
class InvoiceSalesListData {
  @JsonKey(name: "sale_record_id")
  final int? saleRecordId;
  @JsonKey(name: "customer_id")
  final int? customerId;
  @JsonKey(name: "total_amount")
  final int? totalAmount;
  @JsonKey(name: "date")
  final DateTime? date;
  @JsonKey(name: "time")
  final String? time;
  @JsonKey(name: "invoice_url")
  final String? invoiceUrl;
  @JsonKey(name: "customer_name")
  final String? customerName;
  @JsonKey(name: "item_data")
  final List<String>? itemData;

  InvoiceSalesListData({
    this.saleRecordId,
    this.customerId,
    this.totalAmount,
    this.date,
    this.time,
    this.invoiceUrl,
    this.customerName,
    this.itemData,
  });

  InvoiceSalesListData copyWith({
    int? saleRecordId,
    int? customerId,
    int? totalAmount,
    DateTime? date,
    String? time,
    String? invoiceUrl,
    String? customerName,
    List<String>? itemData,
  }) =>
      InvoiceSalesListData(
        saleRecordId: saleRecordId ?? this.saleRecordId,
        customerId: customerId ?? this.customerId,
        totalAmount: totalAmount ?? this.totalAmount,
        date: date ?? this.date,
        time: time ?? this.time,
        invoiceUrl: invoiceUrl ?? this.invoiceUrl,
        customerName: customerName ?? this.customerName,
        itemData: itemData ?? this.itemData,
      );

  factory InvoiceSalesListData.fromJson(Map<String, dynamic> json) =>
      _$InvoiceSalesListDataFromJson(json);

  Map<String, dynamic> toJson() => _$InvoiceSalesListDataToJson(this);
}
