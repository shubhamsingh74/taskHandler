// To parse this JSON data, do
//
//     final getBusinessTypeModel = getBusinessTypeModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'get_business_type_model.g.dart';

GetBusinessTypeModel getBusinessTypeModelFromJson(String str) =>
    GetBusinessTypeModel.fromJson(json.decode(str));

String getBusinessTypeModelToJson(GetBusinessTypeModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class GetBusinessTypeModel {
  @JsonKey(name: "success")
  final bool? success;
  @JsonKey(name: "data")
  final List<BusinessTypeData>? data;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "time")
  final String? time;

  GetBusinessTypeModel({
    this.success,
    this.data,
    this.message,
    this.time,
  });

  GetBusinessTypeModel copyWith({
    bool? success,
    List<BusinessTypeData>? data,
    String? message,
    String? time,
  }) =>
      GetBusinessTypeModel(
        success: success ?? this.success,
        data: data ?? this.data,
        message: message ?? this.message,
        time: time ?? this.time,
      );

  factory GetBusinessTypeModel.fromJson(Map<String, dynamic> json) =>
      _$GetBusinessTypeModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetBusinessTypeModelToJson(this);
}

@JsonSerializable()
class BusinessTypeData {
  @JsonKey(name: "business_type")
  final String? businessType;
  @JsonKey(name: "is_cin_required")
  final bool? isCinRequired;

  BusinessTypeData({
    this.businessType,
    this.isCinRequired,
  });

  BusinessTypeData copyWith({
    String? businessType,
    bool? isCinRequired,
  }) =>
      BusinessTypeData(
        businessType: businessType ?? this.businessType,
        isCinRequired: isCinRequired ?? this.isCinRequired,
      );

  factory BusinessTypeData.fromJson(Map<String, dynamic> json) =>
      _$BusinessTypeDataFromJson(json);

  Map<String, dynamic> toJson() => _$BusinessTypeDataToJson(this);
}
