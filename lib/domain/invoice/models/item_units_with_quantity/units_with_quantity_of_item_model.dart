// To parse this JSON unitAndQuantityList, do
//
//     final unitsWithQuantityOfItemModel = unitsWithQuantityOfItemModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'units_with_quantity_of_item_model.g.dart';

UnitsWithQuantityOfItemModel unitsWithQuantityOfItemModelFromJson(String str) => UnitsWithQuantityOfItemModel.fromJson(json.decode(str));

String unitsWithQuantityOfItemModelToJson(UnitsWithQuantityOfItemModel unitAndQuantityList) => json.encode(unitAndQuantityList.toJson());

@JsonSerializable()
class UnitsWithQuantityOfItemModel {
    @JsonKey(name: "success")
    bool success;
    @JsonKey(name: "data")
    List<UnitAndQuantityList> unitAndQuantityList;
    @JsonKey(name: "message")
    String message;
    @JsonKey(name: "time")
    String time;

    UnitsWithQuantityOfItemModel({
        required this.success,
        required this.unitAndQuantityList,
        required this.message,
        required this.time,
    });

    UnitsWithQuantityOfItemModel copyWith({
        bool? success,
        List<UnitAndQuantityList>? unitAndQuantityList,
        String? message,
        String? time,
    }) => 
        UnitsWithQuantityOfItemModel(
            success: success ?? this.success,
            unitAndQuantityList: unitAndQuantityList ?? this.unitAndQuantityList,
            message: message ?? this.message,
            time: time ?? this.time,
        );

    factory UnitsWithQuantityOfItemModel.fromJson(Map<String, dynamic> json) => _$UnitsWithQuantityOfItemModelFromJson(json);

    Map<String, dynamic> toJson() => _$UnitsWithQuantityOfItemModelToJson(this);
}

@JsonSerializable()
class UnitAndQuantityList {
    @JsonKey(name: "unit")
    String unit;
    @JsonKey(name: "availableQuantity")
    int availableQuantity;

    UnitAndQuantityList({
        required this.unit,
        required this.availableQuantity,
    });

    UnitAndQuantityList copyWith({
        String? unit,
        int? availableQuantity,
    }) => 
        UnitAndQuantityList(
            unit: unit ?? this.unit,
            availableQuantity: availableQuantity ?? this.availableQuantity,
        );

    factory UnitAndQuantityList.fromJson(Map<String, dynamic> json) => _$UnitAndQuantityListFromJson(json);

    Map<String, dynamic> toJson() => _$UnitAndQuantityListToJson(this);
}
