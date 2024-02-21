part of 'bottom_navigation_cubit.dart';

@immutable
abstract class BusinessBottomNavigationState {
  final int index;

  const BusinessBottomNavigationState({required this.index});
}

class BusinessBottomNavigationInitialState
    extends BusinessBottomNavigationState {
  const BusinessBottomNavigationInitialState({required super.index});
}

class BottomNavigationMainState extends BusinessBottomNavigationState {
  const BottomNavigationMainState({required super.index});
}
