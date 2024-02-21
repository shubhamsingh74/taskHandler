// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransferInfoModel _$TransferInfoModelFromJson(Map<String, dynamic> json) =>
    TransferInfoModel(
      success: json['success'] as bool?,
      data: json['data'] == null
          ? null
          : TransferInfoData.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      time: json['time'] as String?,
    );

Map<String, dynamic> _$TransferInfoModelToJson(TransferInfoModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
      'time': instance.time,
    };

TransferInfoData _$TransferInfoDataFromJson(Map<String, dynamic> json) =>
    TransferInfoData(
      availableItem: json['available_item'] as int?,
      itemInShop: (json['item_in_shop'] as List<dynamic>?)
          ?.map((e) => ItemInShop.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TransferInfoDataToJson(TransferInfoData instance) =>
    <String, dynamic>{
      'available_item': instance.availableItem,
      'item_in_shop': instance.itemInShop,
    };

ItemInShop _$ItemInShopFromJson(Map<String, dynamic> json) => ItemInShop(
      shopId: json['shop_id'] as int?,
      availableItem: json['available_item'] as int?,
    );

Map<String, dynamic> _$ItemInShopToJson(ItemInShop instance) =>
    <String, dynamic>{
      'shop_id': instance.shopId,
      'available_item': instance.availableItem,
    };
