class SignUpReqModel {
  SignUpReqModel({
    required this.name,
    required this.businessName,
    required this.phone,
    required this.userType,
    required this.email,
    required this.panNo,
    required this.gstNo,
    required this.pin,
    required this.city,
    required this.state,
    required this.street,
  });

  final String name;
  final String businessName;
  final String phone;
  final String userType;
  final String email;
  final String panNo;
  final String gstNo;
  final int pin;
  final String city;
  final String state;
  final String street;
}
