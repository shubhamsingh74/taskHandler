class BusinessManagementReqModel {
  final int businessId;
  final String shopName;
  final String shopColor;
  final bool isWareHouse;
  final String gstIN;
  final String state;
  final String city;
  final String street;
  final int pin;
  final int? storeId;

  BusinessManagementReqModel({
    required this.businessId,
    required this.shopName,
    required this.shopColor,
    required this.isWareHouse,
    required this.gstIN,
    required this.state,
    required this.city,
    required this.street,
    required this.pin,
    this.storeId,
  });
}
