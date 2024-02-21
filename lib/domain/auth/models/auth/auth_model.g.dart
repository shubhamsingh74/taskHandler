// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthModel _$AuthModelFromJson(Map<String, dynamic> json) => AuthModel(
      success: json['success'] as bool,
      data: AuthData.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String,
      time: json['time'] as String,
    );

Map<String, dynamic> _$AuthModelToJson(AuthModel instance) => <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
      'time': instance.time,
    };

AuthData _$AuthDataFromJson(Map<String, dynamic> json) => AuthData(
      userId: json['user_id'] as int,
    );

Map<String, dynamic> _$AuthDataToJson(AuthData instance) => <String, dynamic>{
      'user_id': instance.userId,
    };
