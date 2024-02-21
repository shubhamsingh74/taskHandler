// To parse this JSON data, do
//
//     final myListDetailsModel = myListDetailsModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'mylist_details_model.g.dart';

MyListDetailsModel myListDetailsModelFromJson(String str) =>
    MyListDetailsModel.fromJson(json.decode(str));

String myListDetailsModelToJson(MyListDetailsModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class MyListDetailsModel {
  @JsonKey(name: "success")
  final bool? success;
  @JsonKey(name: "data")
  final List<MyListDetailsData>? data;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "time")
  final String? time;

  MyListDetailsModel({
    this.success,
    this.data,
    this.message,
    this.time,
  });

  MyListDetailsModel copyWith({
    bool? success,
    List<MyListDetailsData>? data,
    String? message,
    String? time,
  }) =>
      MyListDetailsModel(
        success: success ?? this.success,
        data: data ?? this.data,
        message: message ?? this.message,
        time: time ?? this.time,
      );

  factory MyListDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$MyListDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$MyListDetailsModelToJson(this);
}

@JsonSerializable()
class MyListDetailsData {
  @JsonKey(name: "item_id")
  final int? itemId;
  @JsonKey(name: "item_name")
  final String? itemName;
  @JsonKey(name: "image_url") 
  final String? imageUrl;
  @JsonKey(name: "rating")
  final double? rating;
 

  MyListDetailsData({
    this.itemId,
    this.itemName,
    this.imageUrl,
    this.rating,
 
  });

  MyListDetailsData copyWith({
    int? itemId,
    String? itemName,
    String? imageUrl,
    double? rating,
    String? categoryName,
    int? totalQuantity,
  }) =>
      MyListDetailsData(
        itemId: itemId ?? this.itemId,
        itemName: itemName ?? this.itemName,
        imageUrl: imageUrl ?? this.imageUrl,
        rating: rating ?? this.rating, 
      );

  factory MyListDetailsData.fromJson(Map<String, dynamic> json) =>
      _$MyListDetailsDataFromJson(json);

  Map<String, dynamic> toJson() => _$MyListDetailsDataToJson(this);
}
