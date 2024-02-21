// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_type_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StockTypeDetailsModel _$StockTypeDetailsModelFromJson(
        Map<String, dynamic> json) =>
    StockTypeDetailsModel(
      success: json['success'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => StockTypeData.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      time: json['time'] as String?,
    );

Map<String, dynamic> _$StockTypeDetailsModelToJson(
        StockTypeDetailsModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
      'time': instance.time,
    };

StockTypeData _$StockTypeDataFromJson(Map<String, dynamic> json) =>
    StockTypeData(
      subCategoryId: json['sub_category_id'] as int?,
      subCategoryName: json['sub_category_name'] as String?,
      count: json['count'] as int?,
    );

Map<String, dynamic> _$StockTypeDataToJson(StockTypeData instance) =>
    <String, dynamic>{
      'sub_category_id': instance.subCategoryId,
      'sub_category_name': instance.subCategoryName,
      'count': instance.count,
    };
