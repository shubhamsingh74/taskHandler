import 'package:json_annotation/json_annotation.dart';

part 'customers_model.g.dart';

@JsonSerializable()
class CustomersModel {
  @JsonKey(name: "success")
  final bool? success;
  @JsonKey(name: "data")
  final List<CustomersDatum>? data;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "time")
  final String? time;

  CustomersModel({
    this.success,
    this.data,
    this.message,
    this.time,
  });

  CustomersModel copyWith({
    bool? success,
    List<CustomersDatum>? data,
    String? message,
    String? time,
  }) =>
      CustomersModel(
        success: success ?? this.success,
        data: data ?? this.data,
        message: message ?? this.message,
        time: time ?? this.time,
      );

  factory CustomersModel.fromJson(Map<String, dynamic> json) =>
      _$CustomersModelFromJson(json);

  Map<String, dynamic> toJson() => _$CustomersModelToJson(this);
}

@JsonSerializable()
class CustomersDatum {
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
  @JsonKey(name: "customer_type")
  final String? customerType;
  @JsonKey(name: "dob")
  final dynamic dob;
  @JsonKey(name: "company_name")
  final dynamic companyName;
  @JsonKey(name: "category_id")
  final int? categoryId;
  @JsonKey(name: "gst_no")
  final String? gstNo;
  @JsonKey(name: "pan")
  final String? pan;
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;

  CustomersDatum({
    this.businessCustomerId,
    this.createdBy,
    this.name,
    this.mobileNumber,
    this.email,
    this.addressId,
    this.customerType,
    this.dob,
    this.companyName,
    this.categoryId,
    this.gstNo,
    this.pan,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  CustomersDatum copyWith({
    int? businessCustomerId,
    int? createdBy,
    String? name,
    String? mobileNumber,
    String? email,
    int? addressId,
    String? customerType,
    dynamic dob,
    dynamic companyName,
    int? categoryId,
    String? gstNo,
    String? pan,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      CustomersDatum(
        businessCustomerId: businessCustomerId ?? this.businessCustomerId,
        createdBy: createdBy ?? this.createdBy,
        name: name ?? this.name,
        mobileNumber: mobileNumber ?? this.mobileNumber,
        email: email ?? this.email,
        addressId: addressId ?? this.addressId,
        customerType: customerType ?? this.customerType,
        dob: dob ?? this.dob,
        companyName: companyName ?? this.companyName,
        categoryId: categoryId ?? this.categoryId,
        gstNo: gstNo ?? this.gstNo,
        pan: pan ?? this.pan,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory CustomersDatum.fromJson(Map<String, dynamic> json) =>
      _$CustomersDatumFromJson(json);

  Map<String, dynamic> toJson() => _$CustomersDatumToJson(this);
}
