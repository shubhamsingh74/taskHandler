import 'package:json_annotation/json_annotation.dart';

part 'create_supplier_model.g.dart';

@JsonSerializable()
class CreateSupplierModel {
  @JsonKey(name: "success")
  final bool? success;
  @JsonKey(name: "data")
  final CreateSupplierData? data;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "time")
  final String? time;

  CreateSupplierModel({
    this.success,
    this.data,
    this.message,
    this.time,
  });

  CreateSupplierModel copyWith({
    bool? success,
    CreateSupplierData? data,
    String? message,
    String? time,
  }) =>
      CreateSupplierModel(
        success: success ?? this.success,
        data: data ?? this.data,
        message: message ?? this.message,
        time: time ?? this.time,
      );

  factory CreateSupplierModel.fromJson(Map<String, dynamic> json) =>
      _$CreateSupplierModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreateSupplierModelToJson(this);
}

@JsonSerializable()
class CreateSupplierData {
  @JsonKey(name: "created_at")
  final AtedAt? createdAt;
  @JsonKey(name: "updated_at")
  final AtedAt? updatedAt;
  @JsonKey(name: "business_supplier_id")
  final int? businessSupplierId;
  @JsonKey(name: "created_by")
  final int? createdBy;
  @JsonKey(name: "category_id")
  final int? categoryId;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "mobile_number")
  final String? mobileNumber;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "pan")
  final String? pan;
  @JsonKey(name: "gst_no")
  final String? gstNo;
  @JsonKey(name: "address_id")
  final int? addressId;
  @JsonKey(name: "remarks")
  final String? remarks;
  @JsonKey(name: "status")
  final String? status;

  CreateSupplierData({
    this.createdAt,
    this.updatedAt,
    this.businessSupplierId,
    this.createdBy,
    this.categoryId,
    this.name,
    this.mobileNumber,
    this.email,
    this.pan,
    this.gstNo,
    this.addressId,
    this.remarks,
    this.status,
  });

  CreateSupplierData copyWith({
    AtedAt? createdAt,
    AtedAt? updatedAt,
    int? businessSupplierId,
    int? createdBy,
    int? categoryId,
    String? name,
    String? mobileNumber,
    String? email,
    String? pan,
    String? gstNo,
    int? addressId,
    String? remarks,
    String? status,
  }) =>
      CreateSupplierData(
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        businessSupplierId: businessSupplierId ?? this.businessSupplierId,
        createdBy: createdBy ?? this.createdBy,
        categoryId: categoryId ?? this.categoryId,
        name: name ?? this.name,
        mobileNumber: mobileNumber ?? this.mobileNumber,
        email: email ?? this.email,
        pan: pan ?? this.pan,
        gstNo: gstNo ?? this.gstNo,
        addressId: addressId ?? this.addressId,
        remarks: remarks ?? this.remarks,
        status: status ?? this.status,
      );

  factory CreateSupplierData.fromJson(Map<String, dynamic> json) =>
      _$CreateSupplierDataFromJson(json);

  Map<String, dynamic> toJson() => _$CreateSupplierDataToJson(this);
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
