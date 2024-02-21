part of 'business_my_list_info_bloc.dart';

@immutable
abstract class BusinessMyListInfoEvent {}

class BusinessMyListInfoInitialEvent extends BusinessMyListInfoEvent {
  final int itemId;

  BusinessMyListInfoInitialEvent({required this.itemId});
}

class BusinessMyListInfoItemTimeLineEvent extends BusinessMyListInfoEvent {}

class BusinessMyListInfoStoresEvent extends BusinessMyListInfoEvent {}

class BusinessMyListInfoAddEvent extends BusinessMyListInfoEvent {}

class BusinessMyListInfoReduceEvent extends BusinessMyListInfoEvent {}

class BusinessMyListInfoActionToggleEvent extends BusinessMyListInfoEvent {
  BusinessMyListInfoActionToggleEvent();
}

class BusinessMyListInfoTransferEvent extends BusinessMyListInfoEvent {
  final int itemId;
  final int frmShopId;
  final int toShopId;
  final double quantity;
  final String date;

  BusinessMyListInfoTransferEvent(
      {required this.itemId,
      required this.frmShopId,
      required this.toShopId,
      required this.quantity,
      required this.date});
}
