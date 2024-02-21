// To parse this JSON data, do
//
//     final transactionsModel = transactionsModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'transactions_model.g.dart';

TransactionsModel transactionsModelFromJson(String str) =>
    TransactionsModel.fromJson(json.decode(str));

String transactionsModelToJson(TransactionsModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class TransactionsModel {
  @JsonKey(name: "success")
  final bool? success;
  @JsonKey(name: "data")
  final TransactionsData? data;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "time")
  final String? time;

  TransactionsModel({
    this.success,
    this.data,
    this.message,
    this.time,
  });

  TransactionsModel copyWith({
    bool? success,
    TransactionsData? data,
    String? message,
    String? time,
  }) =>
      TransactionsModel(
        success: success ?? this.success,
        data: data ?? this.data,
        message: message ?? this.message,
        time: time ?? this.time,
      );

  factory TransactionsModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionsModelFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionsModelToJson(this);
}

@JsonSerializable()
class TransactionsData {
  @JsonKey(name: "monthly_sales")
  final double? monthlySales;
  @JsonKey(name: "monthly_purchases")
  final double? monthlyPurchases;
  @JsonKey(name: "todays_out")
  final double? todaysOut;
  @JsonKey(name: "todays_in")
  final double? todaysIn;

  TransactionsData({
    this.monthlySales,
    this.monthlyPurchases,
    this.todaysOut,
    this.todaysIn,
  });

  TransactionsData copyWith({
    double? monthlySales,
    double? monthlyPurchases,
    double? todaysOut,
    double? todaysIn,
  }) =>
      TransactionsData(
        monthlySales: monthlySales ?? this.monthlySales,
        monthlyPurchases: monthlyPurchases ?? this.monthlyPurchases,
        todaysOut: todaysOut ?? this.todaysOut,
        todaysIn: todaysIn ?? this.todaysIn,
      );

  factory TransactionsData.fromJson(Map<String, dynamic> json) =>
      _$TransactionsDataFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionsDataToJson(this);
}
