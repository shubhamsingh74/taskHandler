part of 'business_create_supplier_bloc.dart';

@immutable
abstract class BusinessCreateSupplierEvent {}

class BusinessCreateSupplierInitialEvent extends BusinessCreateSupplierEvent {}

class BusinessCreateSupplierAddButtonEvent extends BusinessCreateSupplierEvent {
  final int createdBy;
  final int categoryID;
  final String name;
  final String number;
  final String email;
  final String pan;
  final String gst;
  final String street;
  final String pin;
  final String city;
  final String state;
  final String remarks;
  final String status;

  BusinessCreateSupplierAddButtonEvent(
      {required this.createdBy,
      required this.categoryID,
      required this.name,
      required this.number,
      required this.email,
      required this.pan,
      required this.gst,
      required this.street,
      required this.pin,
      required this.city,
      required this.state,
      required this.remarks,
      required this.status});
}
