part of 'my_business_profile_bloc.dart';

@immutable
abstract class MyBusinessProfileEvent {}

class MyBusinessProfileInitialEvent extends MyBusinessProfileEvent {}

class MyBusinessProfileChangeBusinessTypeEvent extends MyBusinessProfileEvent {
  final String type;

  MyBusinessProfileChangeBusinessTypeEvent({required this.type});
}

class MyBusinessProfileSaveEvent extends MyBusinessProfileEvent {
  final int userId;
  final String type;
  final String cin;
  final String pan;
  final String gst;
  final String bName;

  MyBusinessProfileSaveEvent({
    required this.userId,
    required this.type,
    required this.cin,
    required this.pan,
    required this.gst,
    required this.bName,
  });
}
