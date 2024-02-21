import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:quickprism/domain/stocks/i_stock_repo.dart';
import 'package:quickprism/domain/stocks/models/category/category_model.dart';
import 'package:quickprism/domain/stocks/models/customers/customers_model.dart';
import 'package:quickprism/domain/user/i_user_repo.dart';

part 'business_create_customer_event.dart';
part 'business_create_customer_state.dart';

@injectable
class BusinessCreateCustomerBloc
    extends Bloc<BusinessCreateCustomerEvent, BusinessCreateCustomerState> {
  final IUserRepo _userRepo;
  final IStockRepo _stockRepo;

  BusinessCreateCustomerBloc(this._stockRepo, this._userRepo)
      : super(BusinessCreateCustomerInitial(categories: [])) {
    on<BusinessCreateCustomerInitialEvent>((event, emit) async {
      emit(BusinessCreateCustomerLoadingState(categories: []));

      var response = await _stockRepo.getCategories();

      emit(response.fold((l) {
        return BusinessCreateCustomerErrorState(categories: []);
      }, (r) {
        var categories = r.data;

        return BusinessCreateCustomerSuccessState(categories: categories);
      }));
    });
    on<BusinessCreateCustomerAddButtonEvent>((event, emit) async {
      emit(BusinessCreateCustomerLoadingState(categories: state.categories));

      var response = await _userRepo.createCustomer(
          createdBy: event.createdBy,
          categoryID: event.cagetoryID,
          name: event.name,
          number: event.number,
          email: event.email,
          street: event.street,
          pin: event.pin,
          city: event.city,
          state: event.state,
          type: event.type,
          dob: event.dob,
          companyName: event.companyName,
          pan: event.pan,
          gst: event.gst);

      emit(response.fold((l) {
        return BusinessCreateCustomerErrorState(categories: state.categories);
      }, (r) {
        var newCustomer = CustomersDatum(
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          createdBy: r.data!.createdBy,
          businessCustomerId: r.data!.businessCustomerId!,
          name: r.data!.name,
          mobileNumber: r.data!.mobileNumber,
          email: r.data!.email,
          pan: r.data!.pan,
          gstNo: r.data!.gstNo,
          addressId: r.data!.addressId,
          customerType: r.data!.customerType,
          status: r.data!.status,
        );

        return BusinessCreateCustomerNavigateBackState(
            categories: state.categories, newCustomer: newCustomer);
      }));
    });
  }
}
