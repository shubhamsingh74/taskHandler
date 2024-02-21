// To parse this JSON data, do
//
//     final getAllShopsModel = getAllShopsModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'get_all_shops_model.g.dart';

GetAllShopsModel getAllShopsModelFromJson(String str) =>
    GetAllShopsModel.fromJson(json.decode(str));

String getAllShopsModelToJson(GetAllShopsModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class GetAllShopsModel {
  @JsonKey(name: "success")
  final bool? success;
  @JsonKey(name: "data")
  final List<GetAllShopsData>? data;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "time")
  final String? time;

  GetAllShopsModel({
    this.success,
    this.data,
    this.message,
    this.time,
  });

  GetAllShopsModel copyWith({
    bool? success,
    List<GetAllShopsData>? data,
    String? message,
    String? time,
  }) =>
      GetAllShopsModel(
        success: success ?? this.success,
        data: data ?? this.data,
        message: message ?? this.message,
        time: time ?? this.time,
      );

  factory GetAllShopsModel.fromJson(Map<String, dynamic> json) =>
      _$GetAllShopsModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllShopsModelToJson(this);
}

@JsonSerializable()
class GetAllShopsData {
  @JsonKey(name: "shop_id")
  final int? shopId;
  @JsonKey(name: "business_id")
  final int? businessId;
  @JsonKey(name: "shop_name")
  final String? shopName;
  @JsonKey(name: "shop_colour")
  final String? shopColour;
  @JsonKey(name: "address_id")
  final int? addressId;
  @JsonKey(name: "is_warehouse")
  final bool? isWarehouse;
  @JsonKey(name: "gst_in")
  final String? gstIn;
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;
  @JsonKey(name: "address")
  final Address? address;

  GetAllShopsData({
    this.shopId,
    this.businessId,
    this.shopName,
    this.shopColour,
    this.addressId,
    this.isWarehouse,
    this.gstIn,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.address,
  });

  GetAllShopsData copyWith({
    int? shopId,
    int? businessId,
    String? shopName,
    String? shopColour,
    int? addressId,
    bool? isWarehouse,
    String? gstIn,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    Address? address,
  }) =>
      GetAllShopsData(
        shopId: shopId ?? this.shopId,
        businessId: businessId ?? this.businessId,
        shopName: shopName ?? this.shopName,
        shopColour: shopColour ?? this.shopColour,
        addressId: addressId ?? this.addressId,
        isWarehouse: isWarehouse ?? this.isWarehouse,
        gstIn: gstIn ?? this.gstIn,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        address: address ?? this.address,
      );

  factory GetAllShopsData.fromJson(Map<String, dynamic> json) =>
      _$GetAllShopsDataFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllShopsDataToJson(this);
}

@JsonSerializable()
class Address {
  @JsonKey(name: "address_id")
  final int? addressId;
  @JsonKey(name: "street_address")
  final String? streetAddress;
  @JsonKey(name: "pincode")
  final int? pincode;
  @JsonKey(name: "city")
  final String? city;
  @JsonKey(name: "state")
  final String? state;
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;

  Address({
    this.addressId,
    this.streetAddress,
    this.pincode,
    this.city,
    this.state,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  Address copyWith({
    int? addressId,
    String? streetAddress,
    int? pincode,
    String? city,
    String? state,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Address(
        addressId: addressId ?? this.addressId,
        streetAddress: streetAddress ?? this.streetAddress,
        pincode: pincode ?? this.pincode,
        city: city ?? this.city,
        state: state ?? this.state,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
