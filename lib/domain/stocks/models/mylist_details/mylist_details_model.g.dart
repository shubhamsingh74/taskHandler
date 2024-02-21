// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mylist_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyListDetailsModel _$MyListDetailsModelFromJson(Map<String, dynamic> json) =>
    MyListDetailsModel(
      success: json['success'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => MyListDetailsData.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      time: json['time'] as String?,
    );

Map<String, dynamic> _$MyListDetailsModelToJson(MyListDetailsModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
      'time': instance.time,
    };

MyListDetailsData _$MyListDetailsDataFromJson(Map<String, dynamic> json) =>
    MyListDetailsData(
      itemId: json['item_id'] as int?,
      itemName: json['item_name'] as String?,
      imageUrl: json['image_url'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$MyListDetailsDataToJson(MyListDetailsData instance) =>
    <String, dynamic>{
      'item_id': instance.itemId,
      'item_name': instance.itemName,
      'image_url': instance.imageUrl,
      'rating': instance.rating,
    };
