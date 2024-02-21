// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'user_model.g.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

@JsonSerializable()
class UserModel {
    @JsonKey(name: "success")
    bool? success;
    @JsonKey(name: "data")
    UserData? data;
    @JsonKey(name: "message")
    String? message;
    @JsonKey(name: "time")
    String? time;

    UserModel({
        this.success,
        this.data,
        this.message,
        this.time,
    });

    factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

    Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

@JsonSerializable()
class UserData {
    @JsonKey(name: "user_id")
    String? userId;
    @JsonKey(name: "mobile_number")
    String? mobileNumber;
    @JsonKey(name: "employee_details")
    EmployeeDetails? employeeDetails;
    @JsonKey(name: "business_details")
    BusinessDetails? businessDetails;

    UserData({
        this.userId,
        this.mobileNumber,
        this.employeeDetails,
        this.businessDetails,
    });

    factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);

    Map<String, dynamic> toJson() => _$UserDataToJson(this);
}

@JsonSerializable()
class BusinessDetails {
    @JsonKey(name: "business_profile")
    BusinessProfile? businessProfile;
    @JsonKey(name: "business_management")
    List<BusinessManagement>? businessManagement;
    @JsonKey(name: "staff_management")
    List<StaffManagement>? staffManagement;

    BusinessDetails({
        this.businessProfile,
        this.businessManagement,
        this.staffManagement,
    });

    factory BusinessDetails.fromJson(Map<String, dynamic> json) => _$BusinessDetailsFromJson(json);

    Map<String, dynamic> toJson() => _$BusinessDetailsToJson(this);
}

@JsonSerializable()
class BusinessManagement {
    @JsonKey(name: "shop_id")
    int? shopId;
    @JsonKey(name: "shop_name")
    String? shopName;
    @JsonKey(name: "shop_colour")
    String? shopColour;
    @JsonKey(name: "address")
    Address? address;
    @JsonKey(name: "is_warehouse")
    bool? isWarehouse;
    @JsonKey(name: "gst_in")
    String? gstIn;

    BusinessManagement({
        this.shopId,
        this.shopName,
        this.shopColour,
        this.address,
        this.isWarehouse,
        this.gstIn,
    });

    factory BusinessManagement.fromJson(Map<String, dynamic> json) => _$BusinessManagementFromJson(json);

    Map<String, dynamic> toJson() => _$BusinessManagementToJson(this);
}

@JsonSerializable()
class Address {
    @JsonKey(name: "street")
    String? street;
    @JsonKey(name: "pincode")
    int? pincode;
    @JsonKey(name: "city")
    String? city;
    @JsonKey(name: "state")
    String? state;

    Address({
        this.street,
        this.pincode,
        this.city,
        this.state,
    });

    factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);

    Map<String, dynamic> toJson() => _$AddressToJson(this);
}

@JsonSerializable()
class BusinessProfile {
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

    BusinessProfile({
        this.businessId,
        this.businessName,
        this.businessType,
        this.cin,
        this.pan,
        this.gstIn,
    });

    factory BusinessProfile.fromJson(Map<String, dynamic> json) => _$BusinessProfileFromJson(json);

    Map<String, dynamic> toJson() => _$BusinessProfileToJson(this);
}

@JsonSerializable()
class StaffManagement {
    @JsonKey(name: "qpid")
    int? qpid;
    @JsonKey(name: "name")
    String? name;
    @JsonKey(name: "role")
    String? role;
    @JsonKey(name: "salary_interval")
    String? salaryInterval;
    @JsonKey(name: "salary_amount")
    int? salaryAmount;
    @JsonKey(name: "todays_attendance")
    String? todaysAttendance;

    StaffManagement({
        this.qpid,
        this.name,
        this.role,
        this.salaryInterval,
        this.salaryAmount,
        this.todaysAttendance,
    });

    factory StaffManagement.fromJson(Map<String, dynamic> json) => _$StaffManagementFromJson(json);

    Map<String, dynamic> toJson() => _$StaffManagementToJson(this);
}

@JsonSerializable()
class EmployeeDetails {
    @JsonKey(name: "employee_profile")
    EmployeeProfile? employeeProfile;
    @JsonKey(name: "employee_shops")
    List<List<EmployeeShop>>? employeeShops;

    EmployeeDetails({
        this.employeeProfile,
        this.employeeShops,
    });

    factory EmployeeDetails.fromJson(Map<String, dynamic> json) => _$EmployeeDetailsFromJson(json);

    Map<String, dynamic> toJson() => _$EmployeeDetailsToJson(this);
}

@JsonSerializable()
class EmployeeProfile {
    @JsonKey(name: "qpid")
    int? qpid;
    @JsonKey(name: "emp_name")
    String? empName;
    @JsonKey(name: "emp_address")
    String? empAddress;
    @JsonKey(name: "emp_email")
    String? empEmail;
    @JsonKey(name: "emp_verification")
    String? empVerification;
    @JsonKey(name: "status")
    String? status;
    @JsonKey(name: "created_at")
    DateTime? createdAt;
    @JsonKey(name: "updated_at")
    DateTime? updatedAt;

    EmployeeProfile({
        this.qpid,
        this.empName,
        this.empAddress,
        this.empEmail,
        this.empVerification,
        this.status,
        this.createdAt,
        this.updatedAt,
    });

    factory EmployeeProfile.fromJson(Map<String, dynamic> json) => _$EmployeeProfileFromJson(json);

    Map<String, dynamic> toJson() => _$EmployeeProfileToJson(this);
}

@JsonSerializable()
class EmployeeShop {
    @JsonKey(name: "shop_id")
    int? shopId;
    @JsonKey(name: "shop_name")
    ShopName? shopName;
    @JsonKey(name: "shop_colour")
    ShopColour? shopColour;
    @JsonKey(name: "address_id")
    int? addressId;
    @JsonKey(name: "is_warehouse")
    bool? isWarehouse;
    @JsonKey(name: "gst_in")
    String? gstIn;
    @JsonKey(name: "business_id")
    int? businessId;
    @JsonKey(name: "business_name")
    BusinessName? businessName;
    @JsonKey(name: "business_type")
    BusinessType? businessType;
    @JsonKey(name: "cin")
    dynamic cin;
    @JsonKey(name: "pan")
    Pan? pan;
    @JsonKey(name: "permission")
    List<Permission>? permission;

    EmployeeShop({
        this.shopId,
        this.shopName,
        this.shopColour,
        this.addressId,
        this.isWarehouse,
        this.gstIn,
        this.businessId,
        this.businessName,
        this.businessType,
        this.cin,
        this.pan,
        this.permission,
    });

    factory EmployeeShop.fromJson(Map<String, dynamic> json) => _$EmployeeShopFromJson(json);

    Map<String, dynamic> toJson() => _$EmployeeShopToJson(this);
}

enum BusinessName {
    @JsonValue("shiv ebterprise")
    SHIV_EBTERPRISE
}

final businessNameValues = EnumValues({
    "shiv ebterprise": BusinessName.SHIV_EBTERPRISE
});

enum BusinessType {
    @JsonValue("Private Limited Company (Pvt Ltd)")
    PRIVATE_LIMITED_COMPANY_PVT_LTD
}

final businessTypeValues = EnumValues({
    "Private Limited Company (Pvt Ltd)": BusinessType.PRIVATE_LIMITED_COMPANY_PVT_LTD
});

enum Pan {
    @JsonValue("D0ZPG8441D")
    D0_ZPG8441_D
}

final panValues = EnumValues({
    "D0ZPG8441D": Pan.D0_ZPG8441_D
});

@JsonSerializable()
class Permission {
    @JsonKey(name: "shop_id")
    int? shopId;
    @JsonKey(name: "qpid")
    int? qpid;
    @JsonKey(name: "sub_cat_id")
    int? subCatId;
    @JsonKey(name: "sub_cat_name")
    SubCatName? subCatName;
    @JsonKey(name: "category_name")
    CategoryName? categoryName;

    Permission({
        this.shopId,
        this.qpid,
        this.subCatId,
        this.subCatName,
        this.categoryName,
    });

    factory Permission.fromJson(Map<String, dynamic> json) => _$PermissionFromJson(json);

    Map<String, dynamic> toJson() => _$PermissionToJson(this);
}

enum CategoryName {
    @JsonValue("inventory")
    INVENTORY,
    @JsonValue("sales")
    SALES
}

final categoryNameValues = EnumValues({
    "inventory": CategoryName.INVENTORY,
    "sales": CategoryName.SALES
});

enum SubCatName {
    @JsonValue("access inventory")
    ACCESS_INVENTORY,
    @JsonValue("view sales")
    VIEW_SALES
}

final subCatNameValues = EnumValues({
    "access inventory": SubCatName.ACCESS_INVENTORY,
    "view sales": SubCatName.VIEW_SALES
});

enum ShopColour {
    @JsonValue("21cea0")
    THE_21_CEA0,
    @JsonValue("31ed34")
    THE_31_ED34,
    @JsonValue("8d6498")
    THE_8_D6498
}

final shopColourValues = EnumValues({
    "21cea0": ShopColour.THE_21_CEA0,
    "31ed34": ShopColour.THE_31_ED34,
    "8d6498": ShopColour.THE_8_D6498
});

enum ShopName {
    @JsonValue("shop 3")
    SHOP_3,
    @JsonValue("store1")
    STORE1,
    @JsonValue("testyy")
    TESTYY
}

final shopNameValues = EnumValues({
    "shop 3": ShopName.SHOP_3,
    "store1": ShopName.STORE1,
    "testyy": ShopName.TESTYY
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
