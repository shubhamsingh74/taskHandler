part of 'business_home_bloc.dart';

@immutable
abstract class BusinessHomeEvent {}

class BusinessHomeInitialEvent extends BusinessHomeEvent {}

class BusinessHomeChangeShopEvent extends BusinessHomeEvent {
  final BusinessManagement shop;
  BusinessHomeChangeShopEvent({required this.shop});
}

class BusinessHomeChangeBusinessEvent extends BusinessHomeEvent {}
