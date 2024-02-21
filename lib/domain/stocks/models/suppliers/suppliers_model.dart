import 'package:json_annotation/json_annotation.dart';

part 'suppliers_model.g.dart';

@JsonSerializable()
class SuppliersModel {
  @JsonKey(name: "success")
  final bool? success;
  @JsonKey(name: "data")
  final List<SuppliersDatum>? data;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "time")
  final String? time;

  SuppliersModel({
    this.success,
    this.data,
    this.message,
    this.time,
  });

  SuppliersModel copyWith({
    bool? success,
    List<SuppliersDatum>? data,
    String? message,
    String? time,
  }) =>
      SuppliersModel(
        success: success ?? this.success,
        data: data ?? this.data,
        message: message ?? this.message,
        time: time ?? this.time,
      );

  factory SuppliersModel.fromJson(Map<String, dynamic> json) =>
      _$SuppliersModelFromJson(json);

  Map<String, dynamic> toJson() => _$SuppliersModelToJson(this);
}

@JsonSerializable()
class SuppliersDatum {
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
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;

  SuppliersDatum({
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
    this.createdAt,
    this.updatedAt,
  });

  SuppliersDatum copyWith({
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
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      SuppliersDatum(
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
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory SuppliersDatum.fromJson(Map<String, dynamic> json) =>
      _$SuppliersDatumFromJson(json);

  Map<String, dynamic> toJson() => _$SuppliersDatumToJson(this);
}
