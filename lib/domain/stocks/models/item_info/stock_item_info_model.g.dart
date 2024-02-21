// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_item_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyListItemInfoModel _$MyListItemInfoModelFromJson(Map<String, dynamic> json) =>
    MyListItemInfoModel(
      success: json['success'] as bool?,
      data: json['data'] == null
          ? null
          : MyListItemInfoData.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      time: json['time'] as String?,
    );

Map<String, dynamic> _$MyListItemInfoModelToJson(
        MyListItemInfoModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
      'time': instance.time,
    };

MyListItemInfoData _$MyListItemInfoDataFromJson(Map<String, dynamic> json) =>
    MyListItemInfoData(
      itemId: json['item_id'] as int?,
      itemName: json['item_name'] as String?,
      itemCode: json['item_code'] as int?,
      categoryId: json['category_id'] as int?,
      hsnSacCode: json['hsn_sac_code'] as int?,
      imageUrl: json['image_url'] as String?,
      shopId: json['shop_id'] as int?,
      totalQuantity: json['total_quantity'] as int?,
      lowStockQuantity: json['low_stock_quantity'] as int?,
      status: json['status'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      categoryName: json['category_name'] as String?,
    );

Map<String, dynamic> _$MyListItemInfoDataToJson(MyListItemInfoData instance) =>
    <String, dynamic>{
      'item_id': instance.itemId,
      'item_name': instance.itemName,
      'item_code': instance.itemCode,
      'category_id': instance.categoryId,
      'hsn_sac_code': instance.hsnSacCode,
      'image_url': instance.imageUrl,
      'shop_id': instance.shopId,
      'total_quantity': instance.totalQuantity,
      'low_stock_quantity': instance.lowStockQuantity,
      'status': instance.status,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'category_name': instance.categoryName,
    };
