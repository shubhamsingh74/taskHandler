// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubCategoryModel _$SubCategoryModelFromJson(Map<String, dynamic> json) =>
    SubCategoryModel(
      success: json['success'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => SubCategoryData.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      time: json['time'] as String?,
    );

Map<String, dynamic> _$SubCategoryModelToJson(SubCategoryModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
      'time': instance.time,
    };

SubCategoryData _$SubCategoryDataFromJson(Map<String, dynamic> json) =>
    SubCategoryData(
      subCategoryId: json['sub_category_id'] as int?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$SubCategoryDataToJson(SubCategoryData instance) =>
    <String, dynamic>{
      'sub_category_id': instance.subCategoryId,
      'name': instance.name,
    };
