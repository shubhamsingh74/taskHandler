// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parties_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PartiesModel _$PartiesModelFromJson(Map<String, dynamic> json) => PartiesModel(
      success: json['success'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => PartiesListDatum.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      time: json['time'] as String?,
    );

Map<String, dynamic> _$PartiesModelToJson(PartiesModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
      'time': instance.time,
    };

PartiesListDatum _$PartiesListDatumFromJson(Map<String, dynamic> json) =>
    PartiesListDatum(
      partyId: json['party_id'] as int?,
      createdBy: json['created_by'] as int?,
      name: json['name'] as String?,
      mobileNumber: json['mobile_number'] as String?,
      type: json['type'] as String?,
      gstNo: json['gst_no'],
      addressId: json['address_id'] as int?,
      status: json['status'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$PartiesListDatumToJson(PartiesListDatum instance) =>
    <String, dynamic>{
      'party_id': instance.partyId,
      'created_by': instance.createdBy,
      'name': instance.name,
      'mobile_number': instance.mobileNumber,
      'type': instance.type,
      'gst_no': instance.gstNo,
      'address_id': instance.addressId,
      'status': instance.status,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
