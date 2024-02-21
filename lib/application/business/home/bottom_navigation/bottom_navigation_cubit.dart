import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bottom_navigation_state.dart';

class BusinessBottomNavigationCubit
    extends Cubit<BusinessBottomNavigationState> {
  BusinessBottomNavigationCubit()
      : super(const BusinessBottomNavigationInitialState(index: 0));

  void updateIndex({required int newIndex}) {
    emit(BottomNavigationMainState(index: newIndex));
  }
}
