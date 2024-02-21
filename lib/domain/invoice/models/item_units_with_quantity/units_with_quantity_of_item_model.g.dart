// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'units_with_quantity_of_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnitsWithQuantityOfItemModel _$UnitsWithQuantityOfItemModelFromJson(
        Map<String, dynamic> json) =>
    UnitsWithQuantityOfItemModel(
      success: json['success'] as bool,
      unitAndQuantityList: (json['data'] as List<dynamic>)
          .map((e) => UnitAndQuantityList.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String,
      time: json['time'] as String,
    );

Map<String, dynamic> _$UnitsWithQuantityOfItemModelToJson(
        UnitsWithQuantityOfItemModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.unitAndQuantityList,
      'message': instance.message,
      'time': instance.time,
    };

UnitAndQuantityList _$UnitAndQuantityListFromJson(Map<String, dynamic> json) =>
    UnitAndQuantityList(
      unit: json['unit'] as String,
      availableQuantity: json['availableQuantity'] as int,
    );

Map<String, dynamic> _$UnitAndQuantityListToJson(
        UnitAndQuantityList instance) =>
    <String, dynamic>{
      'unit': instance.unit,
      'availableQuantity': instance.availableQuantity,
    };
