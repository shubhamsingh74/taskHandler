// To parse this JSON data, do
//
//     final employeeSubCategoryModel = employeeSubCategoryModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'employee_sub_category_model.g.dart';

EmployeeSubCategoryModel employeeSubCategoryModelFromJson(String str) => EmployeeSubCategoryModel.fromJson(json.decode(str));

String employeeSubCategoryModelToJson(EmployeeSubCategoryModel data) => json.encode(data.toJson());

@JsonSerializable()
class EmployeeSubCategoryModel {
    @JsonKey(name: "success")
    bool? success;
    @JsonKey(name: "data")
    List<EmployeeSubCategoryData>? data;
    @JsonKey(name: "message")
    String? message;
    @JsonKey(name: "time")
    String? time;

    EmployeeSubCategoryModel({
        this.success,
        this.data,
        this.message,
        this.time,
    });

    factory EmployeeSubCategoryModel.fromJson(Map<String, dynamic> json) => _$EmployeeSubCategoryModelFromJson(json);

    Map<String, dynamic> toJson() => _$EmployeeSubCategoryModelToJson(this);
}

@JsonSerializable()
class EmployeeSubCategoryData {
    @JsonKey(name: "sub_cat_id")
    int? subCatId;
    @JsonKey(name: "sub_cat_name")
    String? subCatName;
    @JsonKey(name: "category_name")
    String? categoryName;

    EmployeeSubCategoryData({
        this.subCatId,
        this.subCatName,
        this.categoryName,
    });

    factory EmployeeSubCategoryData.fromJson(Map<String, dynamic> json) => _$EmployeeSubCategoryDataFromJson(json);

    Map<String, dynamic> toJson() => _$EmployeeSubCategoryDataToJson(this);
}
