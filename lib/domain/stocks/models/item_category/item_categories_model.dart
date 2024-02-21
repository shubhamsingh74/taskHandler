// To parse this JSON data, do
//
//     final itemCategoriesModel = itemCategoriesModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'item_categories_model.g.dart';

ItemCategoriesModel itemCategoriesModelFromJson(String str) =>
    ItemCategoriesModel.fromJson(json.decode(str));

String itemCategoriesModelToJson(ItemCategoriesModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class ItemCategoriesModel {
  @JsonKey(name: "success")
  final bool? success;
  @JsonKey(name: "data")
  final List<CategoriesInfoDatum>? data;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "time")
  final String? time;
  ItemCategoriesModel({
    this.success,
    this.data,
    this.message,
    this.time,
  });

  factory ItemCategoriesModel.fromJson(Map<String, dynamic> json) =>
      _$ItemCategoriesModelFromJson(json);

  Map<String, dynamic> toJson() => _$ItemCategoriesModelToJson(this);
}

@JsonSerializable()
class CategoriesInfoDatum {
  @JsonKey(name: "category_id")
  final int? categoryId;
  @JsonKey(name: "name")
  final String? name;

  CategoriesInfoDatum({
    this.categoryId,
    this.name,
  });

  factory CategoriesInfoDatum.fromJson(Map<String, dynamic> json) =>
      _$CategoriesInfoDatumFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriesInfoDatumToJson(this);
}
