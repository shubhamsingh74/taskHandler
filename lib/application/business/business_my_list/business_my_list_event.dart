part of 'business_my_list_bloc.dart';

@immutable
abstract class BusinessMyListEvent {}

class BusinessMyListInitialEvent extends BusinessMyListEvent {
  final int shopId;

  BusinessMyListInitialEvent({required this.shopId});
}

class BusinessMyListNoShopEvent extends BusinessMyListEvent {}

class BusinessMyListAddButtonEvent extends BusinessMyListEvent {}

class BusinessMyListProfileClickEvent extends BusinessMyListEvent {}

class BusinessMyListSearchEvent extends BusinessMyListEvent {}
