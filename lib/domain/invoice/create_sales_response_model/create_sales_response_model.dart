import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_sales_response_model.g.dart';

@JsonSerializable()
class CreateSalesResponseModel {
  @JsonKey(name: "success")
  final bool? success;
  @JsonKey(name: "data")
  final CreateSalesResponseData? data;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "time")
  final String? time;

  CreateSalesResponseModel({
    this.success,
    this.data,
    this.message,
    this.time,
  });

  CreateSalesResponseModel copyWith({
    bool? success,
    CreateSalesResponseData? data,
    String? message,
    String? time,
  }) =>
      CreateSalesResponseModel(
        success: success ?? this.success,
        data: data ?? this.data,
        message: message ?? this.message,
        time: time ?? this.time,
      );

  factory CreateSalesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CreateSalesResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreateSalesResponseModelToJson(this);
}

@JsonSerializable()
class CreateSalesResponseData {
  @JsonKey(name: "invoice_url")
  final String? invoiceUrl;
  @JsonKey(name: "invoice_id")
  final int? invoiceId;

  CreateSalesResponseData({
    this.invoiceUrl,
    this.invoiceId,
  });

  CreateSalesResponseData copyWith({
    String? invoiceUrl,
    int? invoiceId,
  }) =>
      CreateSalesResponseData(
        invoiceUrl: invoiceUrl ?? this.invoiceUrl,
        invoiceId: invoiceId ?? this.invoiceId,
      );

  factory CreateSalesResponseData.fromJson(Map<String, dynamic> json) =>
      _$CreateSalesResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$CreateSalesResponseDataToJson(this);
}
