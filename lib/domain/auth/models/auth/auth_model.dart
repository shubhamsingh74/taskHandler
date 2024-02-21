import 'package:json_annotation/json_annotation.dart';

part 'auth_model.g.dart';

@JsonSerializable()
class AuthModel {
  @JsonKey(name: "success")
  final bool success;
  @JsonKey(name: "data")
  final AuthData data;
  @JsonKey(name: "message")
  final String message;
  @JsonKey(name: "time")
  final String time;

  AuthModel({
    required this.success,
    required this.data,
    required this.message,
    required this.time,
  });

  AuthModel copyWith({
    bool? success,
    AuthData? data,
    String? message,
    String? time,
  }) =>
      AuthModel(
        success: success ?? this.success,
        data: data ?? this.data,
        message: message ?? this.message,
        time: time ?? this.time,
      );

  factory AuthModel.fromJson(Map<String, dynamic> json) =>
      _$AuthModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthModelToJson(this);
}

@JsonSerializable()
class AuthData {
  @JsonKey(name: "user_id")
  final int userId;

  AuthData({
    required this.userId,
  });

  AuthData copyWith({
    int? userId,
  }) =>
      AuthData(
        userId: userId ?? this.userId,
      );

  factory AuthData.fromJson(Map<String, dynamic> json) =>
      _$AuthDataFromJson(json);

  Map<String, dynamic> toJson() => _$AuthDataToJson(this);
}
