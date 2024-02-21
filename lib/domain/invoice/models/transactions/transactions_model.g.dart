// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transactions_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionsModel _$TransactionsModelFromJson(Map<String, dynamic> json) =>
    TransactionsModel(
      success: json['success'] as bool?,
      data: json['data'] == null
          ? null
          : TransactionsData.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      time: json['time'] as String?,
    );

Map<String, dynamic> _$TransactionsModelToJson(TransactionsModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
      'time': instance.time,
    };

TransactionsData _$TransactionsDataFromJson(Map<String, dynamic> json) =>
    TransactionsData(
      monthlySales: (json['monthly_sales'] as num?)?.toDouble(),
      monthlyPurchases: (json['monthly_purchases'] as num?)?.toDouble(),
      todaysOut: (json['todays_out'] as num?)?.toDouble(),
      todaysIn: (json['todays_in'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$TransactionsDataToJson(TransactionsData instance) =>
    <String, dynamic>{
      'monthly_sales': instance.monthlySales,
      'monthly_purchases': instance.monthlyPurchases,
      'todays_out': instance.todaysOut,
      'todays_in': instance.todaysIn,
    };
