import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:quickprism/domain/stocks/i_stock_repo.dart';
import 'package:quickprism/domain/stocks/models/item_info/stock_item_info_model.dart';
import 'package:quickprism/domain/stocks/models/items/stock_items_model.dart';

part 'business_stock_items_event.dart';
part 'business_stock_items_state.dart';

@injectable
class BusinessStockItemsBloc
    extends Bloc<BusinessStockItemsEvent, BusinessStockItemsState> {
  final IStockRepo _stockRepo;

  BusinessStockItemsBloc(this._stockRepo)
      : super(BusinessStockItemsInitialState()) {
    List<StockItemsData> defaultList = [];

    on<BusinessStockItemsInitialEvent>((event, emit) async {
      emit(BusinessStockItemsLoadingState());

      var response = await _stockRepo.getStockShopItems(
          subCategoryId: event.subCategoryId,
          shopId: event.shopId,
          businessId: event.businessId);

      emit(response.fold((l) {
        return BusinessStockItemsErrorState();
      }, (r) {
        if (r.data == null) {
          return BusinessStockItemsErrorState();
        } else {
          defaultList = r.data!;
          return BusinessStockItemsSuccessState(stockItems: r.data!);
        }
      }));
    });

    on<BusinessStockItemsTileClick>((event, emit) {
      emit(BusinessStockItemsNavigateToItemState(
        event.itemsData,
      ));
    });

    on<BusinessStockItemsSearch>((event, emit) {
      if (event.searchText.isEmpty) {
        emit(BusinessStockItemsSuccessState(stockItems: defaultList));
      } else {
        var resultList = defaultList
            .where((element) =>
                element.brand!
                    .toLowerCase()
                    .contains(event.searchText.toLowerCase()) ||
                element.itemName!
                    .toLowerCase()
                    .contains(event.searchText.toLowerCase()))
            .toList();
        emit(BusinessStockItemsSuccessState(stockItems: resultList));
      }
    });

    on<BusinessStockItemsAddItemClickEvent>((event, emit) {
      emit(BusinessStockItemsNavigateToAddItemState());
    });

    on<BusinessStockItemMiniTileClick>((event, emit) {
      switch (event.tileType) {
        case MiniTileType.stockIn:
          emit(BusinessStockItemsNavigateToStockInState(
            stockItemsData: event.stockItemsData,
          ));

        case MiniTileType.stockOut:
          emit(BusinessStockItemsNavigateToStockOutState(
            stockItemsData: event.stockItemsData,
          ));

        case MiniTileType.stockTransfer:
          emit(BusinessStockItemsNavigateToStockTransferState(
            stockItemsData: event.stockItemsData,
          ));
      }
    });
  }
}

enum MiniTileType {
  stockIn,
  stockOut,
  stockTransfer,
}
