import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:quickprism/domain/stocks/i_stock_repo.dart';
import 'package:quickprism/domain/stocks/models/category/category_model.dart';
import 'package:quickprism/domain/stocks/models/suppliers/suppliers_model.dart';
import 'package:quickprism/domain/user/i_user_repo.dart';

part 'business_create_supplier_event.dart';
part 'business_create_supplier_state.dart';

@injectable
class BusinessCreateSupplierBloc
    extends Bloc<BusinessCreateSupplierEvent, BusinessCreateSupplierState> {
  final IStockRepo _stockRepo;
  final IUserRepo _userRepo;

  BusinessCreateSupplierBloc(this._stockRepo, this._userRepo)
      : super(BusinessCreateSupplierInitial(categories: [])) {
    on<BusinessCreateSupplierInitialEvent>((event, emit) async {
      emit(BusinessCreateSupplierLoadingState(categories: []));

      var response = await _stockRepo.getCategories();

      emit(response.fold((l) {
        return BusinessCreateSupplierErrorState(categories: []);
      }, (r) {
        var categories = r.data;

        return BusinessCreateSupplierSuccessState(categories: categories);
      }));
    });
    on<BusinessCreateSupplierAddButtonEvent>((event, emit) async {
      emit(BusinessCreateSupplierLoadingState(categories: state.categories));

      var response = await _userRepo.createSupplier(
          createdBy: event.createdBy,
          categoryID: event.categoryID,
          name: event.name,
          number: event.number,
          email: event.email,
          pan: event.pan,
          gst: event.gst,
          street: event.street,
          pin: event.pin,
          city: event.city,
          state: event.state,
          remarks: event.remarks,
          status: event.status);

      emit(response.fold((l) {
        return BusinessCreateSupplierErrorState(categories: state.categories);
      }, (r) {
        var newSupplier = SuppliersDatum(
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          createdBy: r.data!.createdBy,
          businessSupplierId: r.data!.businessSupplierId,
          categoryId: r.data!.categoryId,
          name: r.data!.name,
          mobileNumber: r.data!.mobileNumber,
          email: r.data!.email,
          pan: r.data!.pan,
          gstNo: r.data!.gstNo,
          addressId: r.data!.addressId,
          remarks: r.data!.remarks,
          status: r.data!.status,
        );

        return BusinessCreateSupplierNavigateBackState(
          categories: state.categories,
          newSupplier: newSupplier,
        );
      }));
    });
  }
}
