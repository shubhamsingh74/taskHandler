import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel {
  @JsonKey(name: "success")
  final bool success;
  @JsonKey(name: "data")
  final List<CategoryData> data;
  @JsonKey(name: "message")
  final String message;
  @JsonKey(name: "time")
  final String time;

  CategoryModel({
    required this.success,
    required this.data,
    required this.message,
    required this.time,
  });

  CategoryModel copyWith({
    bool? success,
    List<CategoryData>? data,
    String? message,
    String? time,
  }) =>
      CategoryModel(
        success: success ?? this.success,
        data: data ?? this.data,
        message: message ?? this.message,
        time: time ?? this.time,
      );

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}

@JsonSerializable()
class CategoryData {
  @JsonKey(name: "category_id")
  final int categoryId;
  @JsonKey(name: "name")
  final String name;

  CategoryData({
    required this.categoryId,
    required this.name,
  });

  CategoryData copyWith({
    int? categoryId,
    String? name,
  }) =>
      CategoryData(
        categoryId: categoryId ?? this.categoryId,
        name: name ?? this.name,
      );

  factory CategoryData.fromJson(Map<String, dynamic> json) =>
      _$CategoryDataFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryDataToJson(this);
}
