// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_time_line_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemTimeLineModel _$ItemTimeLineModelFromJson(Map<String, dynamic> json) =>
    ItemTimeLineModel(
      success: json['success'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ItemTimeLineData.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      time: json['time'] as String?,
    );

Map<String, dynamic> _$ItemTimeLineModelToJson(ItemTimeLineModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
      'time': instance.time,
    };

ItemTimeLineData _$ItemTimeLineDataFromJson(Map<String, dynamic> json) =>
    ItemTimeLineData(
      date: json['date'] as String?,
      type: json['type'] as String?,
      quantity: json['quantity'] as int?,
      unit: json['unit'] as String?,
      invoiceId: json['invoice_id'] as int?,
      differenceInQuantity: json['difference_in_quantity'] as int?,
      shopData: json['shop_data'] == null
          ? null
          : ItemTimeLineShopData.fromJson(
              json['shop_data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ItemTimeLineDataToJson(ItemTimeLineData instance) =>
    <String, dynamic>{
      'date': instance.date,
      'type': instance.type,
      'quantity': instance.quantity,
      'unit': instance.unit,
      'shop_data': instance.shopData,
      'invoice_id': instance.invoiceId,
      'difference_in_quantity': instance.differenceInQuantity,
    };

ItemTimeLineShopData _$ItemTimeLineShopDataFromJson(
        Map<String, dynamic> json) =>
    ItemTimeLineShopData(
      shopId: json['shop_id'] as int?,
      shopName: json['shop_name'] as String?,
      shopColour: json['shop_colour'] as String?,
    );

Map<String, dynamic> _$ItemTimeLineShopDataToJson(
        ItemTimeLineShopData instance) =>
    <String, dynamic>{
      'shop_id': instance.shopId,
      'shop_name': instance.shopName,
      'shop_colour': instance.shopColour,
    };
