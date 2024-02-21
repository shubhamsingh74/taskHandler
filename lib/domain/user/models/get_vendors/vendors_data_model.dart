import 'package:json_annotation/json_annotation.dart';

part 'vendors_data_model.g.dart';

@JsonSerializable()
class VendorsModel {
  @JsonKey(name: "success")
  bool? success;
  @JsonKey(name: "data")
  List<VendorsData>? data;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "time")
  String? time;

  VendorsModel({
    this.success,
    this.data,
    this.message,
    this.time,
  });

  factory VendorsModel.fromJson(Map<String, dynamic> json) => _$VendorsModelFromJson(json);

  Map<String, dynamic> toJson() => _$VendorsModelToJson(this);
}

@JsonSerializable()
class VendorsData {
  @JsonKey(name: "business_id")
  int? businessId;
  @JsonKey(name: "business_name")
  String? businessName;
  @JsonKey(name: "business_type")
  String? businessType;
  @JsonKey(name: "cin")
  dynamic cin;
  @JsonKey(name: "pan")
  String? pan;
  @JsonKey(name: "gst_in")
  String? gstIn;

  VendorsData({
    this.businessId,
    this.businessName,
    this.businessType,
    this.cin,
    this.pan,
    this.gstIn,
  });

  factory VendorsData.fromJson(Map<String, dynamic> json) => _$VendorsDataFromJson(json);

  Map<String, dynamic> toJson() => _$VendorsDataToJson(this);
}
