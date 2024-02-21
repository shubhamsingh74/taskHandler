part of 'business_create_customer_bloc.dart';

@immutable
abstract class BusinessCreateCustomerEvent {}

class BusinessCreateCustomerInitialEvent extends BusinessCreateCustomerEvent {}

class BusinessCreateCustomerAddButtonEvent extends BusinessCreateCustomerEvent {
  final int createdBy;
  final int cagetoryID;
  final String name;
  final String number;
  final String email;
  final String street;
  final String pin;
  final String city;
  final String state;
  final String type;
  final String dob;
  final String companyName;
  final String category;
  final String pan;
  final String gst;

  BusinessCreateCustomerAddButtonEvent({
    required this.createdBy,
    required this.cagetoryID,
    required this.name,
    required this.number,
    required this.email,
    required this.street,
    required this.pin,
    required this.city,
    required this.state,
    required this.type,
    required this.dob,
    required this.companyName,
    required this.category,
    required this.pan,
    required this.gst,
  });
}
