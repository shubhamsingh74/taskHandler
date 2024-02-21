import 'package:json_annotation/json_annotation.dart';

part 'stock_type_details_model.g.dart';

@JsonSerializable()
class StockTypeDetailsModel {
  @JsonKey(name: "success")
  final bool? success;
  @JsonKey(name: "data")
  final List<StockTypeData>? data;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "time")
  final String? time;

  StockTypeDetailsModel({
    this.success,
    this.data,
    this.message,
    this.time,
  });

  StockTypeDetailsModel copyWith({
    bool? success,
    List<StockTypeData>? data,
    String? message,
    String? time,
  }) =>
      StockTypeDetailsModel(
        success: success ?? this.success,
        data: data ?? this.data,
        message: message ?? this.message,
        time: time ?? this.time,
      );

  factory StockTypeDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$StockTypeDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$StockTypeDetailsModelToJson(this);
}

@JsonSerializable()
class StockTypeData {
  @JsonKey(name: "sub_category_id")
  final int? subCategoryId;
  @JsonKey(name: "sub_category_name")
  final String? subCategoryName;
  @JsonKey(name: "count")
  final int? count;

  StockTypeData({
    this.subCategoryId,
    this.subCategoryName,
    this.count,
  });

  StockTypeData copyWith({
    int? subCategoryId,
    String? subCategoryName,
    int? count,
  }) =>
      StockTypeData(
        subCategoryId: subCategoryId ?? this.subCategoryId,
        subCategoryName: subCategoryName ?? this.subCategoryName,
        count: count ?? this.count,
      );

  factory StockTypeData.fromJson(Map<String, dynamic> json) =>
      _$StockTypeDataFromJson(json);

  Map<String, dynamic> toJson() => _$StockTypeDataToJson(this);
}
