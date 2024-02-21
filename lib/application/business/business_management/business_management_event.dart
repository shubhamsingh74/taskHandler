part of 'business_management_bloc.dart';

@immutable
abstract class BusinessManagementEvent {
  final BusinessManagementReqModel reqModel;

  const BusinessManagementEvent({required this.reqModel});
}

class BusinessManagementSaveEvent extends BusinessManagementEvent {
  const BusinessManagementSaveEvent({required super.reqModel});
}

class BusinessManagementUpdateEvent extends BusinessManagementEvent {
  const BusinessManagementUpdateEvent({required super.reqModel});
}
