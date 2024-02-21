import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:quickprism/core/utils/extensions.dart';
import 'package:quickprism/domain/dealings/i_dealing_repo.dart';
import 'package:quickprism/domain/dealings/models/create_requisition/create_requisition_model.dart';
import 'package:quickprism/domain/stocks/i_stock_repo.dart';
import 'package:quickprism/domain/stocks/models/all_items_store/all_items_store_model.dart';
import 'package:quickprism/domain/user/i_user_repo.dart';
import 'package:quickprism/domain/user/models/get_vendors/vendors_data_model.dart';

part 'transaction_requisition_event.dart';
part 'transaction_requisition_state.dart';

@injectable
class BusinessTransactionRequisitionBloc extends Bloc<
    BusinessTransactionRequisitionEvent, BusinessTransactionRequisitionState> {
  final IUserRepo _userRepo;
  final IStockRepo _stockRepo;
  final IDealingRepo _dealingRepo;

  BusinessTransactionRequisitionBloc(
      this._userRepo, this._stockRepo, this._dealingRepo)
      : super(RequisitionInitialState(
            itemName: '',
            itemBrand: '',
            itemCategory: '',
            itemDetails: [],
            itemQuantity: 0,
            itemUnit: '',
            allItemsOfStore: null,
            itemId: 0,
            state: '',
            billingAddress: '',
            buyersSignature: '',
            shippingAddress: '',
            vendorDetails: [],
            vendorsModel: null)) {
    on<RequisitionGetAllItemsEvent>(_getAllStoreItems);
    on<GetAllVendors>(_getAllVendors);
    on<CreateRequisitionEvent>(_createRequisition);
    on<RequisitionSelectItemSaveItemDetailsEvent>(_saveSelectItems);
  }

  Future<void> _getAllStoreItems(RequisitionGetAllItemsEvent event,
      Emitter<BusinessTransactionRequisitionState> emit) async {
    emit(RequisitionLoadingState(
        itemUnit: state.itemUnit,
        itemCategory: state.itemCategory,
        itemBrand: state.itemBrand,
        itemName: state.itemName,
        itemQuantity: state.itemQuantity,
        itemDetails: state.itemDetails,
        allItemsOfStore: state.allItemsOfStore,
        itemId: state.itemId,
        state: state.state,
        billingAddress: state.billingAddress,
        buyersSignature: state.buyersSignature,
        shippingAddress: state.shippingAddress,
        vendorDetails: state.vendorDetails,
        vendorsModel: state.vendorsModel));
    var response = await _stockRepo.getAllStoreItems(shopId: event.shopId);
    response.toString().log("Checkinggg");
    response.fold((l) {
      emit(RequisitionErrorState(
          itemUnit: state.itemUnit,
          itemCategory: state.itemCategory,
          itemBrand: state.itemBrand,
          itemName: state.itemName,
          itemQuantity: state.itemQuantity,
          itemDetails: state.itemDetails,
          itemId: state.itemId,
          state: state.state,
          billingAddress: state.billingAddress,
          buyersSignature: state.buyersSignature,
          shippingAddress: state.shippingAddress,
          vendorDetails: state.vendorDetails,
          allItemsOfStore: state.allItemsOfStore,
          vendorsModel: state.vendorsModel));
    }, (r) async {
      emit(RequisitionInitialState(
          allItemsOfStore: r,
          itemUnit: state.itemUnit,
          itemCategory: state.itemCategory,
          itemBrand: state.itemBrand,
          itemName: state.itemName,
          itemId: state.itemId,
          state: state.state,
          billingAddress: state.billingAddress,
          buyersSignature: state.buyersSignature,
          shippingAddress: state.shippingAddress,
          vendorDetails: state.vendorDetails,
          itemQuantity: state.itemQuantity,
          itemDetails: state.itemDetails,
          vendorsModel: state.vendorsModel));
    });
  }

  void _saveSelectItems(RequisitionSelectItemSaveItemDetailsEvent event,
      Emitter<BusinessTransactionRequisitionState> emit) async {
    emit(
      RequisitionInitialState(
        itemName: event.itemName,
        itemBrand: event.itemBrand,
        itemCategory: event.itemCategory,
        itemDetails: state.itemDetails,
        itemQuantity: event.itemQuantity,
        itemUnit: event.itemUnit,
        itemId: event.itemId,
        allItemsOfStore: state.allItemsOfStore,
        state: state.state,
        billingAddress: state.billingAddress,
        buyersSignature: state.buyersSignature,
        shippingAddress: state.shippingAddress,
        vendorDetails: state.vendorDetails,
        vendorsModel: state.vendorsModel,
      ),
    );

    List<Map<String, dynamic>> lst = [];
    lst.add({
      'itemUnit': state.itemUnit,
      'itemQuantity': state.itemQuantity,
      'itemName': state.itemName,
      'itemBrand': state.itemBrand,
      'itemCategory': state.itemCategory,
      'itemId': state.itemId,
    });

    // List<Map<String, dynamic>> lstVendors = [];
    // lst.add({
    //   'vendorsId': state.vendorId,
    //   'vendorsName': state.vendorName,
    // });

    emit(
      RequisitionInitialState(
        itemName: event.itemName,
        itemBrand: event.itemBrand,
        itemCategory: event.itemCategory,
        itemDetails: [...state.itemDetails, ...lst],
        itemQuantity: event.itemQuantity,
        itemUnit: event.itemUnit,
        allItemsOfStore: state.allItemsOfStore,
        itemId: event.itemId,
        state: event.state,
        billingAddress: event.billingAddress,
        buyersSignature: event.buyersSignature,
        shippingAddress: event.shippingAddress,
        vendorDetails: event.vendorsDetails,
        vendorsModel: state.vendorsModel,
      ),
    );
    lst.toString().log("new listtt");
  }

  Future<void> _getAllVendors(GetAllVendors event,
      Emitter<BusinessTransactionRequisitionState> emit) async {
    emit(RequisitionLoadingState(
        itemUnit: state.itemUnit,
        itemCategory: state.itemCategory,
        itemBrand: state.itemBrand,
        itemName: state.itemName,
        itemQuantity: state.itemQuantity,
        itemDetails: state.itemDetails,
        allItemsOfStore: state.allItemsOfStore,
        itemId: state.itemId,
        state: state.state,
        billingAddress: state.billingAddress,
        buyersSignature: state.buyersSignature,
        shippingAddress: state.shippingAddress,
        vendorDetails: state.vendorDetails,
        vendorsModel: state.vendorsModel));
    var response = await _userRepo.getVendorsData();
    response.toString().log("Checkinggg");
    response.fold((l) {
      emit(RequisitionErrorState(
          itemUnit: state.itemUnit,
          itemCategory: state.itemCategory,
          itemBrand: state.itemBrand,
          itemName: state.itemName,
          itemQuantity: state.itemQuantity,
          itemDetails: state.itemDetails,
          itemId: state.itemId,
          state: state.state,
          billingAddress: state.billingAddress,
          buyersSignature: state.buyersSignature,
          shippingAddress: state.shippingAddress,
          vendorDetails: state.vendorDetails,
          allItemsOfStore: state.allItemsOfStore,
          vendorsModel: state.vendorsModel));
    }, (r) async {
      emit(RequisitionInitialState(
          allItemsOfStore: state.allItemsOfStore,
          itemUnit: state.itemUnit,
          itemCategory: state.itemCategory,
          itemBrand: state.itemBrand,
          itemName: state.itemName,
          itemId: state.itemId,
          state: state.state,
          billingAddress: state.billingAddress,
          buyersSignature: state.buyersSignature,
          shippingAddress: state.shippingAddress,
          vendorDetails: state.vendorDetails,
          itemQuantity: state.itemQuantity,
          itemDetails: state.itemDetails,
          vendorsModel: r));
    });
  }

  Future<void> _createRequisition(CreateRequisitionEvent event,
      Emitter<BusinessTransactionRequisitionState> emit) async {
    emit(RequisitionLoadingState(
        itemUnit: state.itemUnit,
        itemCategory: state.itemCategory,
        itemBrand: state.itemBrand,
        itemName: state.itemName,
        itemQuantity: state.itemQuantity,
        itemDetails: state.itemDetails,
        allItemsOfStore: state.allItemsOfStore,
        itemId: state.itemId,
        state: state.state,
        billingAddress: state.billingAddress,
        buyersSignature: state.buyersSignature,
        shippingAddress: state.shippingAddress,
        vendorDetails: state.vendorDetails,
        vendorsModel: state.vendorsModel
    ));
    var response = await _dealingRepo.createRequisition(
        body: CreateRequisitionModel(
            businessId: event.businessId,
             vendors: event.vendorsDetails,
             requisitionItems: event.itemDetails
            ));
    response.toString().log("createee");
    response.fold((l) {
      emit(RequisitionErrorState(
          itemUnit: state.itemUnit,
          itemCategory: state.itemCategory,
          itemBrand: state.itemBrand,
          itemName: state.itemName,
          itemQuantity: state.itemQuantity,
          itemDetails: state.itemDetails,
          itemId: state.itemId,
          state: state.state,
          billingAddress: state.billingAddress,
          buyersSignature: state.buyersSignature,
          shippingAddress: state.shippingAddress,
          vendorDetails: state.vendorDetails,
          allItemsOfStore: state.allItemsOfStore,
          vendorsModel: state.vendorsModel));
    }, (r) async {
      emit(RequisitionInitialState(
          allItemsOfStore: state.allItemsOfStore,
          itemUnit: state.itemUnit,
          itemCategory: state.itemCategory,
          itemBrand: state.itemBrand,
          itemName: state.itemName,
          itemId: state.itemId,
          state: state.state,
          billingAddress: state.billingAddress,
          buyersSignature: state.buyersSignature,
          shippingAddress: state.shippingAddress,
          vendorDetails: state.vendorDetails,
          itemQuantity: state.itemQuantity,
          itemDetails: state.itemDetails,
          vendorsModel: state.vendorsModel));
    });
  }
}
