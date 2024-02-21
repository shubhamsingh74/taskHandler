import 'package:json_annotation/json_annotation.dart';

part 'sub_category_model.g.dart';

@JsonSerializable()
class SubCategoryModel {
  @JsonKey(name: "success")
  final bool? success;
  @JsonKey(name: "data")
  final List<SubCategoryData>? data;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "time")
  final String? time;

  SubCategoryModel({
    this.success,
    this.data,
    this.message,
    this.time,
  });

  SubCategoryModel copyWith({
    bool? success,
    List<SubCategoryData>? data,
    String? message,
    String? time,
  }) =>
      SubCategoryModel(
        success: success ?? this.success,
        data: data ?? this.data,
        message: message ?? this.message,
        time: time ?? this.time,
      );

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$SubCategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$SubCategoryModelToJson(this);
}

@JsonSerializable()
class SubCategoryData {
  @JsonKey(name: "sub_category_id")
  final int? subCategoryId;
  @JsonKey(name: "name")
  final String? name;

  SubCategoryData({
    this.subCategoryId,
    this.name,
  });

  SubCategoryData copyWith({
    int? subCategoryId,
    String? name,
  }) =>
      SubCategoryData(
        subCategoryId: subCategoryId ?? this.subCategoryId,
        name: name ?? this.name,
      );

  factory SubCategoryData.fromJson(Map<String, dynamic> json) =>
      _$SubCategoryDataFromJson(json);

  Map<String, dynamic> toJson() => _$SubCategoryDataToJson(this);
}
