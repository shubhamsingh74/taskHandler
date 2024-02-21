part of 'user_selection_bloc.dart';

@immutable
abstract class UserSelectionState {}

class UserSelectionInitialState extends UserSelectionState {}

class UserSelectionBusinessSelectedState extends UserSelectionState {}

class UserSelectionEmployeeSelectedNotRegisteredState extends UserSelectionState {}
class UserSelectionEmployeeSelectedRegisteredState extends UserSelectionState {}

class UserSelectionCustomerSelectedState extends UserSelectionState {}

class UserSelectionLoadingState extends UserSelectionState {}
