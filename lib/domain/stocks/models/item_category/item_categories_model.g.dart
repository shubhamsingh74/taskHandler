// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_categories_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemCategoriesModel _$ItemCategoriesModelFromJson(Map<String, dynamic> json) =>
    ItemCategoriesModel(
      success: json['success'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => CategoriesInfoDatum.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      time: json['time'] as String?,
    );

Map<String, dynamic> _$ItemCategoriesModelToJson(
        ItemCategoriesModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
      'time': instance.time,
    };

CategoriesInfoDatum _$CategoriesInfoDatumFromJson(Map<String, dynamic> json) =>
    CategoriesInfoDatum(
      categoryId: json['category_id'] as int?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$CategoriesInfoDatumToJson(
        CategoriesInfoDatum instance) =>
    <String, dynamic>{
      'category_id': instance.categoryId,
      'name': instance.name,
    };
