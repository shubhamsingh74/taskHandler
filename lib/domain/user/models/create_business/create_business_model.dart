// To parse this JSON data, do
//
//     final createBusinessModel = createBusinessModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'create_business_model.g.dart';

CreateBusinessModel createBusinessModelFromJson(String str) =>
    CreateBusinessModel.fromJson(json.decode(str));

String createBusinessModelToJson(CreateBusinessModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class CreateBusinessModel {
  @JsonKey(name: "success")
  final bool? success;
  @JsonKey(name: "data")
  final CreateBusinessData? data;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "time")
  final String? time;

  CreateBusinessModel({
    this.success,
    this.data,
    this.message,
    this.time,
  });

  CreateBusinessModel copyWith({
    bool? success,
    CreateBusinessData? data,
    String? message,
    String? time,
  }) =>
      CreateBusinessModel(
        success: success ?? this.success,
        data: data ?? this.data,
        message: message ?? this.message,
        time: time ?? this.time,
      );

  factory CreateBusinessModel.fromJson(Map<String, dynamic> json) =>
      _$CreateBusinessModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreateBusinessModelToJson(this);
}

@JsonSerializable()
class CreateBusinessData {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "created_at")
  final AtedAt? createdAt;
  @JsonKey(name: "updated_at")
  final AtedAt? updatedAt;
  @JsonKey(name: "business_id")
  final int? businessId;
  @JsonKey(name: "user_id")
  final int? userId;
  @JsonKey(name: "business_name")
  final String? businessName;
  @JsonKey(name: "business_type")
  final String? businessType;
  @JsonKey(name: "pan")
  final String? pan;
  @JsonKey(name: "gst_in")
  final String? gstIn;

  CreateBusinessData({
    this.status,
    this.createdAt,
    this.updatedAt,
    this.businessId,
    this.userId,
    this.businessName,
    this.businessType,
    this.pan,
    this.gstIn,
  });

  CreateBusinessData copyWith({
    String? status,
    AtedAt? createdAt,
    AtedAt? updatedAt,
    int? businessId,
    int? userId,
    String? businessName,
    String? businessType,
    String? pan,
    String? gstIn,
  }) =>
      CreateBusinessData(
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        businessId: businessId ?? this.businessId,
        userId: userId ?? this.userId,
        businessName: businessName ?? this.businessName,
        businessType: businessType ?? this.businessType,
        pan: pan ?? this.pan,
        gstIn: gstIn ?? this.gstIn,
      );

  factory CreateBusinessData.fromJson(Map<String, dynamic> json) =>
      _$CreateBusinessDataFromJson(json);

  Map<String, dynamic> toJson() => _$CreateBusinessDataToJson(this);
}

@JsonSerializable()
class AtedAt {
  @JsonKey(name: "val")
  final String? val;

  AtedAt({
    this.val,
  });

  AtedAt copyWith({
    String? val,
  }) =>
      AtedAt(
        val: val ?? this.val,
      );

  factory AtedAt.fromJson(Map<String, dynamic> json) => _$AtedAtFromJson(json);

  Map<String, dynamic> toJson() => _$AtedAtToJson(this);
}
