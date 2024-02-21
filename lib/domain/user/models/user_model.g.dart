// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      success: json['success'] as bool?,
      data: json['data'] == null
          ? null
          : UserData.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      time: json['time'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
      'time': instance.time,
    };

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      userId: json['user_id'] as String?,
      mobileNumber: json['mobile_number'] as String?,
      employeeDetails: json['employee_details'] == null
          ? null
          : EmployeeDetails.fromJson(
              json['employee_details'] as Map<String, dynamic>),
      businessDetails: json['business_details'] == null
          ? null
          : BusinessDetails.fromJson(
              json['business_details'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'user_id': instance.userId,
      'mobile_number': instance.mobileNumber,
      'employee_details': instance.employeeDetails,
      'business_details': instance.businessDetails,
    };

BusinessDetails _$BusinessDetailsFromJson(Map<String, dynamic> json) =>
    BusinessDetails(
      businessProfile: json['business_profile'] == null
          ? null
          : BusinessProfile.fromJson(
              json['business_profile'] as Map<String, dynamic>),
      businessManagement: (json['business_management'] as List<dynamic>?)
          ?.map((e) => BusinessManagement.fromJson(e as Map<String, dynamic>))
          .toList(),
      staffManagement: (json['staff_management'] as List<dynamic>?)
          ?.map((e) => StaffManagement.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BusinessDetailsToJson(BusinessDetails instance) =>
    <String, dynamic>{
      'business_profile': instance.businessProfile,
      'business_management': instance.businessManagement,
      'staff_management': instance.staffManagement,
    };

BusinessManagement _$BusinessManagementFromJson(Map<String, dynamic> json) =>
    BusinessManagement(
      shopId: json['shop_id'] as int?,
      shopName: json['shop_name'] as String?,
      shopColour: json['shop_colour'] as String?,
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      isWarehouse: json['is_warehouse'] as bool?,
      gstIn: json['gst_in'] as String?,
    );

Map<String, dynamic> _$BusinessManagementToJson(BusinessManagement instance) =>
    <String, dynamic>{
      'shop_id': instance.shopId,
      'shop_name': instance.shopName,
      'shop_colour': instance.shopColour,
      'address': instance.address,
      'is_warehouse': instance.isWarehouse,
      'gst_in': instance.gstIn,
    };

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      street: json['street'] as String?,
      pincode: json['pincode'] as int?,
      city: json['city'] as String?,
      state: json['state'] as String?,
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'street': instance.street,
      'pincode': instance.pincode,
      'city': instance.city,
      'state': instance.state,
    };

BusinessProfile _$BusinessProfileFromJson(Map<String, dynamic> json) =>
    BusinessProfile(
      businessId: json['business_id'] as int?,
      businessName: json['business_name'] as String?,
      businessType: json['business_type'] as String?,
      cin: json['cin'],
      pan: json['pan'] as String?,
      gstIn: json['gst_in'] as String?,
    );

Map<String, dynamic> _$BusinessProfileToJson(BusinessProfile instance) =>
    <String, dynamic>{
      'business_id': instance.businessId,
      'business_name': instance.businessName,
      'business_type': instance.businessType,
      'cin': instance.cin,
      'pan': instance.pan,
      'gst_in': instance.gstIn,
    };

StaffManagement _$StaffManagementFromJson(Map<String, dynamic> json) =>
    StaffManagement(
      qpid: json['qpid'] as int?,
      name: json['name'] as String?,
      role: json['role'] as String?,
      salaryInterval: json['salary_interval'] as String?,
      salaryAmount: json['salary_amount'] as int?,
      todaysAttendance: json['todays_attendance'] as String?,
    );

Map<String, dynamic> _$StaffManagementToJson(StaffManagement instance) =>
    <String, dynamic>{
      'qpid': instance.qpid,
      'name': instance.name,
      'role': instance.role,
      'salary_interval': instance.salaryInterval,
      'salary_amount': instance.salaryAmount,
      'todays_attendance': instance.todaysAttendance,
    };

EmployeeDetails _$EmployeeDetailsFromJson(Map<String, dynamic> json) =>
    EmployeeDetails(
      employeeProfile: json['employee_profile'] == null
          ? null
          : EmployeeProfile.fromJson(
              json['employee_profile'] as Map<String, dynamic>),
      employeeShops: (json['employee_shops'] as List<dynamic>?)
          ?.map((e) => (e as List<dynamic>)
              .map((e) => EmployeeShop.fromJson(e as Map<String, dynamic>))
              .toList())
          .toList(),
    );

Map<String, dynamic> _$EmployeeDetailsToJson(EmployeeDetails instance) =>
    <String, dynamic>{
      'employee_profile': instance.employeeProfile,
      'employee_shops': instance.employeeShops,
    };

EmployeeProfile _$EmployeeProfileFromJson(Map<String, dynamic> json) =>
    EmployeeProfile(
      qpid: json['qpid'] as int?,
      empName: json['emp_name'] as String?,
      empAddress: json['emp_address'] as String?,
      empEmail: json['emp_email'] as String?,
      empVerification: json['emp_verification'] as String?,
      status: json['status'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$EmployeeProfileToJson(EmployeeProfile instance) =>
    <String, dynamic>{
      'qpid': instance.qpid,
      'emp_name': instance.empName,
      'emp_address': instance.empAddress,
      'emp_email': instance.empEmail,
      'emp_verification': instance.empVerification,
      'status': instance.status,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

EmployeeShop _$EmployeeShopFromJson(Map<String, dynamic> json) => EmployeeShop(
      shopId: json['shop_id'] as int?,
      shopName: $enumDecodeNullable(_$ShopNameEnumMap, json['shop_name']),
      shopColour: $enumDecodeNullable(_$ShopColourEnumMap, json['shop_colour']),
      addressId: json['address_id'] as int?,
      isWarehouse: json['is_warehouse'] as bool?,
      gstIn: json['gst_in'] as String?,
      businessId: json['business_id'] as int?,
      businessName:
          $enumDecodeNullable(_$BusinessNameEnumMap, json['business_name']),
      businessType:
          $enumDecodeNullable(_$BusinessTypeEnumMap, json['business_type']),
      cin: json['cin'],
      pan: $enumDecodeNullable(_$PanEnumMap, json['pan']),
      permission: (json['permission'] as List<dynamic>?)
          ?.map((e) => Permission.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EmployeeShopToJson(EmployeeShop instance) =>
    <String, dynamic>{
      'shop_id': instance.shopId,
      'shop_name': _$ShopNameEnumMap[instance.shopName],
      'shop_colour': _$ShopColourEnumMap[instance.shopColour],
      'address_id': instance.addressId,
      'is_warehouse': instance.isWarehouse,
      'gst_in': instance.gstIn,
      'business_id': instance.businessId,
      'business_name': _$BusinessNameEnumMap[instance.businessName],
      'business_type': _$BusinessTypeEnumMap[instance.businessType],
      'cin': instance.cin,
      'pan': _$PanEnumMap[instance.pan],
      'permission': instance.permission,
    };

const _$ShopNameEnumMap = {
  ShopName.SHOP_3: 'shop 3',
  ShopName.STORE1: 'store1',
  ShopName.TESTYY: 'testyy',
};

const _$ShopColourEnumMap = {
  ShopColour.THE_21_CEA0: '21cea0',
  ShopColour.THE_31_ED34: '31ed34',
  ShopColour.THE_8_D6498: '8d6498',
};

const _$BusinessNameEnumMap = {
  BusinessName.SHIV_EBTERPRISE: 'shiv ebterprise',
};

const _$BusinessTypeEnumMap = {
  BusinessType.PRIVATE_LIMITED_COMPANY_PVT_LTD:
      'Private Limited Company (Pvt Ltd)',
};

const _$PanEnumMap = {
  Pan.D0_ZPG8441_D: 'D0ZPG8441D',
};

Permission _$PermissionFromJson(Map<String, dynamic> json) => Permission(
      shopId: json['shop_id'] as int?,
      qpid: json['qpid'] as int?,
      subCatId: json['sub_cat_id'] as int?,
      subCatName:
          $enumDecodeNullable(_$SubCatNameEnumMap, json['sub_cat_name']),
      categoryName:
          $enumDecodeNullable(_$CategoryNameEnumMap, json['category_name']),
    );

Map<String, dynamic> _$PermissionToJson(Permission instance) =>
    <String, dynamic>{
      'shop_id': instance.shopId,
      'qpid': instance.qpid,
      'sub_cat_id': instance.subCatId,
      'sub_cat_name': _$SubCatNameEnumMap[instance.subCatName],
      'category_name': _$CategoryNameEnumMap[instance.categoryName],
    };

const _$SubCatNameEnumMap = {
  SubCatName.ACCESS_INVENTORY: 'access inventory',
  SubCatName.VIEW_SALES: 'view sales',
};

const _$CategoryNameEnumMap = {
  CategoryName.INVENTORY: 'inventory',
  CategoryName.SALES: 'sales',
};
