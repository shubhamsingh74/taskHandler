import 'package:json_annotation/json_annotation.dart';

part 'add_customer_model.g.dart';

@JsonSerializable()
class AddCustomerModel {
  @JsonKey(name: "success")
  final bool? success;
  @JsonKey(name: "data")
  final AddCustomerData? data;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "time")
  final String? time;

  AddCustomerModel({
    this.success,
    this.data,
    this.message,
    this.time,
  });

  AddCustomerModel copyWith({
    bool? success,
    AddCustomerData? data,
    String? message,
    String? time,
  }) =>
      AddCustomerModel(
        success: success ?? this.success,
        data: data ?? this.data,
        message: message ?? this.message,
        time: time ?? this.time,
      );

  factory AddCustomerModel.fromJson(Map<String, dynamic> json) =>
      _$AddCustomerModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddCustomerModelToJson(this);
}

@JsonSerializable()
class AddCustomerData {
  @JsonKey(name: "customer_type")
  final String? customerType;
  @JsonKey(name: "created_at")
  final AtedAt? createdAt;
  @JsonKey(name: "updated_at")
  final AtedAt? updatedAt;
  @JsonKey(name: "business_customer_id")
  final int? businessCustomerId;
  @JsonKey(name: "created_by")
  final int? createdBy;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "mobile_number")
  final String? mobileNumber;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "address_id")
  final int? addressId;
  @JsonKey(name: "category_id")
  final String? categoryId;
  @JsonKey(name: "pan")
  final String? pan;
  @JsonKey(name: "gst_no")
  final String? gstNo;
  @JsonKey(name: "status")
  final String? status;

  AddCustomerData({
    this.customerType,
    this.createdAt,
    this.updatedAt,
    this.businessCustomerId,
    this.createdBy,
    this.name,
    this.mobileNumber,
    this.email,
    this.addressId,
    this.categoryId,
    this.pan,
    this.gstNo,
    this.status,
  });

  AddCustomerData copyWith({
    String? customerType,
    AtedAt? createdAt,
    AtedAt? updatedAt,
    int? businessCustomerId,
    int? createdBy,
    String? name,
    String? mobileNumber,
    String? email,
    int? addressId,
    String? categoryId,
    String? pan,
    String? gstNo,
    String? status,
  }) =>
      AddCustomerData(
        customerType: customerType ?? this.customerType,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        businessCustomerId: businessCustomerId ?? this.businessCustomerId,
        createdBy: createdBy ?? this.createdBy,
        name: name ?? this.name,
        mobileNumber: mobileNumber ?? this.mobileNumber,
        email: email ?? this.email,
        addressId: addressId ?? this.addressId,
        categoryId: categoryId ?? this.categoryId,
        pan: pan ?? this.pan,
        gstNo: gstNo ?? this.gstNo,
        status: status ?? this.status,
      );

  factory AddCustomerData.fromJson(Map<String, dynamic> json) =>
      _$AddCustomerDataFromJson(json);

  Map<String, dynamic> toJson() => _$AddCustomerDataToJson(this);
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
