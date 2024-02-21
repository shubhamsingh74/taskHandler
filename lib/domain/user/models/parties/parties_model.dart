// To parse this JSON data, do
//
//     final partiesModel = partiesModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'parties_model.g.dart';

PartiesModel partiesModelFromJson(String str) => PartiesModel.fromJson(json.decode(str));

String partiesModelToJson(PartiesModel data) => json.encode(data.toJson());

@JsonSerializable()
class PartiesModel {
    @JsonKey(name: "success")
    final bool? success;
    @JsonKey(name: "data")
    final List<PartiesListDatum>? data;
    @JsonKey(name: "message")
    final String? message;
    @JsonKey(name: "time")
    final String? time;

    PartiesModel({
        this.success,
        this.data,
        this.message,
        this.time,
    });

    factory PartiesModel.fromJson(Map<String, dynamic> json) => _$PartiesModelFromJson(json);

    Map<String, dynamic> toJson() => _$PartiesModelToJson(this);
}

@JsonSerializable()
class PartiesListDatum {
    @JsonKey(name: "party_id")
    final int? partyId;
    @JsonKey(name: "created_by")
    final int? createdBy;
    @JsonKey(name: "name")
    final String? name;
    @JsonKey(name: "mobile_number")
    final String? mobileNumber;
    @JsonKey(name: "type")
    final String? type;
    @JsonKey(name: "gst_no")
    final dynamic gstNo;
    @JsonKey(name: "address_id")
    final int? addressId;
    @JsonKey(name: "status")
    final String? status;
    @JsonKey(name: "created_at")
    final DateTime? createdAt;
    @JsonKey(name: "updated_at")
    final DateTime? updatedAt;

    PartiesListDatum({
        this.partyId,
        this.createdBy,
        this.name,
        this.mobileNumber,
        this.type,
        this.gstNo,
        this.addressId,
        this.status,
        this.createdAt,
        this.updatedAt,
    });

    factory PartiesListDatum.fromJson(Map<String, dynamic> json) => _$PartiesListDatumFromJson(json);

    Map<String, dynamic> toJson() => _$PartiesListDatumToJson(this);
}
