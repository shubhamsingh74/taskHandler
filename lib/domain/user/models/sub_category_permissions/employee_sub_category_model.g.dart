// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_sub_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeeSubCategoryModel _$EmployeeSubCategoryModelFromJson(
        Map<String, dynamic> json) =>
    EmployeeSubCategoryModel(
      success: json['success'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => EmployeeSubCategoryData.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      time: json['time'] as String?,
    );

Map<String, dynamic> _$EmployeeSubCategoryModelToJson(
        EmployeeSubCategoryModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
      'time': instance.time,
    };

EmployeeSubCategoryData _$EmployeeSubCategoryDataFromJson(Map<String, dynamic> json) => EmployeeSubCategoryData(
      subCatId: json['sub_cat_id'] as int?,
      subCatName: json['sub_cat_name'] as String?,
      categoryName: json['category_name'] as String?,
    );

Map<String, dynamic> _$EmployeeSubCategoryDataToJson(EmployeeSubCategoryData instance) => <String, dynamic>{
      'sub_cat_id': instance.subCatId,
      'sub_cat_name': instance.subCatName,
      'category_name': instance.categoryName,
    };
