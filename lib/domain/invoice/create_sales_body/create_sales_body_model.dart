// import 'package:json_annotation/json_annotation.dart';

// part 'create_sales_body_model.g.dart';

// @JsonSerializable()
// class CreateSalesBodyModel {
//   @JsonKey(name: "customer_id")
//   final int? customerId;
//   @JsonKey(name: "shop_id")
//   final int? shopId;
//   @JsonKey(name: "items_details")
//   final List<SalesItemsDetail>? itemsDetails;
//   @JsonKey(name: "gst_percentage")
//   final int? gstPercentage;
//   @JsonKey(name: "cash_amount_recieved")
//   final int? cashAmountRecieved;
//   @JsonKey(name: "online_amount_recieved")
//   final int? onlineAmountRecieved;
//   @JsonKey(name: "due_amount")
//   final int? dueAmount;
//   @JsonKey(name: "remarks")
//   final String? remarks;
//   @JsonKey(name: "date")
//   final String? date;
//   @JsonKey(name: "time")
//   final String? time;

//   CreateSalesBodyModel({
//     this.customerId,
//     this.shopId,
//     this.itemsDetails,
//     this.gstPercentage,
//     this.cashAmountRecieved,
//     this.onlineAmountRecieved,
//     this.dueAmount,
//     this.remarks,
//     this.date,
//     this.time,
//   });

//   CreateSalesBodyModel copyWith({
//     int? customerId,
//     int? shopId,
//     List<SalesItemsDetail>? itemsDetails,
//     int? gstPercentage,
//     int? cashAmountRecieved,
//     int? onlineAmountRecieved,
//     int? dueAmount,
//     String? remarks,
//     String? date,
//     String? time,
//   }) =>
//       CreateSalesBodyModel(
//         customerId: customerId ?? this.customerId,
//         shopId: shopId ?? this.shopId,
//         itemsDetails: itemsDetails ?? this.itemsDetails,
//         gstPercentage: gstPercentage ?? this.gstPercentage,
//         cashAmountRecieved: cashAmountRecieved ?? this.cashAmountRecieved,
//         onlineAmountRecieved: onlineAmountRecieved ?? this.onlineAmountRecieved,
//         dueAmount: dueAmount ?? this.dueAmount,
//         remarks: remarks ?? this.remarks,
//         date: date ?? this.date,
//         time: time ?? this.time,
//       );

//   factory CreateSalesBodyModel.fromJson(Map<String, dynamic> json) =>
//       _$CreateSalesBodyModelFromJson(json);

//   Map<String, dynamic> toJson() => _$CreateSalesBodyModelToJson(this);
// }

// @JsonSerializable()
// class SalesItemsDetail {
//   @JsonKey(name: "item_id")
//   final int? itemId;
//   @JsonKey(name: "quantity")
//   final int? quantity;
//   @JsonKey(name: "price")
//   final double? price;
//   @JsonKey(name: "date")
//   final String? date;

//   SalesItemsDetail({
//     this.itemId,
//     this.quantity,
//     this.price,
//     this.date,
//   });

//   SalesItemsDetail copyWith({
//     int? itemId,
//     int? quantity,
//     double? price,
//     String? date,
//   }) =>
//       SalesItemsDetail(
//         itemId: itemId ?? this.itemId,
//         quantity: quantity ?? this.quantity,
//         price: price ?? this.price,
//         date: date ?? this.date,
//       );

//   factory SalesItemsDetail.fromJson(Map<String, dynamic> json) =>
//       _$SalesItemsDetailFromJson(json);

//   Map<String, dynamic> toJson() => _$SalesItemsDetailToJson(this);
// }
