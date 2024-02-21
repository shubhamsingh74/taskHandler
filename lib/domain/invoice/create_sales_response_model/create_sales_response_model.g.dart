// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_sales_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateSalesResponseModel _$CreateSalesResponseModelFromJson(
        Map<String, dynamic> json) =>
    CreateSalesResponseModel(
      success: json['success'] as bool?,
      data: json['data'] == null
          ? null
          : CreateSalesResponseData.fromJson(
              json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      time: json['time'] as String?,
    );

Map<String, dynamic> _$CreateSalesResponseModelToJson(
        CreateSalesResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
      'time': instance.time,
    };

CreateSalesResponseData _$CreateSalesResponseDataFromJson(
        Map<String, dynamic> json) =>
    CreateSalesResponseData(
      invoiceUrl: json['invoice_url'] as String?,
      invoiceId: json['invoice_id'] as int?,
    );

Map<String, dynamic> _$CreateSalesResponseDataToJson(
        CreateSalesResponseData instance) =>
    <String, dynamic>{
      'invoice_url': instance.invoiceUrl,
      'invoice_id': instance.invoiceId,
    };
