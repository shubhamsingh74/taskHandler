// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'business_parties_home_bloc.dart';

@immutable
abstract class BusinessPartiesHomeEvent {}

class BusinessPartiesHomeInitialEvent extends BusinessPartiesHomeEvent {}

class BusinessPartiesHomeSearchPartyEvent extends BusinessPartiesHomeEvent {
  final String searchText;

  BusinessPartiesHomeSearchPartyEvent({required this.searchText});
}

class BusinessPartiesCreateNewPartyEvent extends BusinessPartiesHomeEvent {
  String name;
  String gstNo;
  String businessType;
  String mobileNo;
  String streetAddress;
  String pinCode;
  String city;
  String state;
  BusinessPartiesCreateNewPartyEvent({
    required this.name,
    required this.businessType,
    required this.gstNo,
    required this.mobileNo,
    required this.streetAddress,
    required this.pinCode,
    required this.city,
    required this.state,
  });
}
