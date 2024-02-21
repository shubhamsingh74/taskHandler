part of 'business_create_supplier_bloc.dart';

@immutable
abstract class BusinessCreateSupplierState {
  final List<CategoryData> categories;

  BusinessCreateSupplierState({required this.categories});
}

@immutable
abstract class BusinessCreateSupplierActionState
    extends BusinessCreateSupplierState {
  BusinessCreateSupplierActionState({required super.categories});
}

class BusinessCreateSupplierInitial extends BusinessCreateSupplierState {
  BusinessCreateSupplierInitial({required super.categories});
}

class BusinessCreateSupplierLoadingState extends BusinessCreateSupplierState {
  BusinessCreateSupplierLoadingState({required super.categories});
}

class BusinessCreateSupplierErrorState extends BusinessCreateSupplierState {
  BusinessCreateSupplierErrorState({required super.categories});
}

class BusinessCreateSupplierSuccessState extends BusinessCreateSupplierState {
  BusinessCreateSupplierSuccessState({required super.categories});
}

class BusinessCreateSupplierNavigateBackState
    extends BusinessCreateSupplierActionState {
  BusinessCreateSupplierNavigateBackState(
      {required this.newSupplier, required super.categories});

  final SuppliersDatum newSupplier;
}
