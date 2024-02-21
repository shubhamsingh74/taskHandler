import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:quickprism/domain/stocks/i_stock_repo.dart';
import 'package:quickprism/domain/stocks/models/item_info/stock_item_info_model.dart';

part 'business_stock_item_info_event.dart';
part 'business_stock_item_info_state.dart';

@injectable
class BusinessStockItemInfoBloc
    extends Bloc<BusinessStockItemInfoEvent, BusinessStockItemInfoState> {
  final IStockRepo _stockRepo;

  BusinessStockItemInfoBloc(this._stockRepo)
      : super(BusinessStockItemInfoInitialState()) {
    on<BusinessStockItemInfoInitialEvent>((event, emit) async {
      emit(BusinessStockItemInfoLoadingState());

      var response = await _stockRepo.getItemInfo(itemId: event.itemId);

      emit(response.fold((l) {
        return BusinessStockItemInfoErrorState();
      }, (r) {
        if (r.data == null) {
          return BusinessStockItemInfoErrorState();
        } else {
          return BusinessStockItemInfoSuccessState(itemInfoModel: r.data);
        }
      }));
    });

    on<BusinessStockItemInfoEditItemClickEvent>((event, emit) {
      emit(BusinessStockItemInfoNavigateToEditItem(
          itemInfoModel: state.itemInfoModel));
    });
  }
}
