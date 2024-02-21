// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_selection_bloc.dart';

@immutable
abstract class UserSelectionEvent {}
class UserSelectionTypeInitialEvent extends UserSelectionEvent{}
class UserSelectionTypeSelectedEvent extends UserSelectionEvent {
  final String userType;
  UserSelectionTypeSelectedEvent({
    required this.userType,
  });
}
