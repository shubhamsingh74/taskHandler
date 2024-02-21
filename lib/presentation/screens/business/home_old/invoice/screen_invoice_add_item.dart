import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickprism/application/business/business_invoice_add_item/business_invoice_add_item_bloc.dart';
import 'package:quickprism/core/colors/app_colors.dart';
import 'package:quickprism/core/styles/app_styles.dart';
import 'package:quickprism/domain/core/di/injectable.dart';
import 'package:quickprism/domain/invoice/models/invoice_all_item_model.dart';
import 'package:quickprism/domain/user/user_constants.dart';
import 'package:quickprism/infrastructure/routing/app_router.dart';
import 'package:quickprism/presentation/widgets/appbar/main_appbar.dart';
import 'package:quickprism/presentation/widgets/button/primary_button.dart';
import 'package:quickprism/presentation/widgets/button/secondary_button.dart';
import 'package:quickprism/presentation/widgets/empty_widget/empty_widget.dart';
import 'package:quickprism/presentation/widgets/form_fields/search_text_field.dart';
import 'package:quickprism/presentation/widgets/form_fields/filled_text_field.dart';

@RoutePage()
class ScreenInvoiceAddItem extends StatefulWidget {
  const ScreenInvoiceAddItem({super.key});

  @override
  State<ScreenInvoiceAddItem> createState() => _ScreenInvoiceAddItemState();
}

class _ScreenInvoiceAddItemState extends State<ScreenInvoiceAddItem> {
  final TextEditingController searchController = TextEditingController();

  final bloc = getIt<BusinessInvoiceAddItemBloc>();

  TextEditingController quantityController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  @override
  void initState() {
    quantityController.text = '10';
    priceController.text = '100';

    bloc.add(BusinessInvoiceAddItemInitialEvent(
      businessId: UserConstants
          .currentUser!.data!.businessDetails!.businessProfile!.businessId!,
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: MainAppBar(title: 'Add item', context: context),
      body:
          BlocConsumer<BusinessInvoiceAddItemBloc, BusinessInvoiceAddItemState>(
        bloc: bloc,
        listenWhen: (prev, current) =>
            (current is BusinessInvoiceAddItemActionState),
        buildWhen: (prev, current) =>
            (current is! BusinessInvoiceAddItemActionState),
        listener: (ctx, state) {
          if (state is BusinessInvoiceAddItemNavigateBackState) {
            ctx.router.pop(state.selectedFUllItems);
          }
        },
        builder: (context, state) {
          if (state is BusinessInvoiceAddItemLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is BusinessInvoiceAddItemErrorState) {
            return const Center(
              child: Text('Something went wrong'),
            );
          }

          return Column(
            children: <Widget>[
              16.verticalSpace,
              MainSearchTextField(
                hintText: 'search item name',
                controller: searchController,
                onSuffixTap: () {
                  searchController.text = '';
                  bloc.add(BusinessInvoiceAddItemSearchEvent(searchText: ''));
                },
                onChanged: (text) {
                  bloc.add(BusinessInvoiceAddItemSearchEvent(searchText: text));
                },
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    12.verticalSpace,
                    state.searchResults!.isNotEmpty
                        ? Expanded(
                            flex: state.searchResults!.length > 2 ? 3 : 1,
                            child: ListView.builder(
                                physics: BouncingScrollPhysics(),
                                itemCount: state.searchResults!.length,
                                shrinkWrap: true,
                                // separatorBuilder: (context, index) => const Divider(),
                                itemBuilder: (context, index) =>
                                    _searchItemTile(
                                      state.searchResults![index],
                                      state.selectedItems!.contains(
                                          state.searchResults![index]),
                                    )),
                          )
                        : 1.horizontalSpace,
                    12.verticalSpace,
                    Container(
                      padding: EdgeInsets.only(left: 16.w),
                      margin: EdgeInsets.symmetric(horizontal: 16.w),
                      decoration: BoxDecoration(
                          color: AppColors.supportSP2,
                          borderRadius: BorderRadius.circular(50.r)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: [
                          Text(
                            'Items : ${state.selectedItems!.length}',
                            style: AppStyles.subHeading14500
                                .copyWith(color: AppColors.oldPrimaryP1),
                          ),
                          // 5.horizontalSpace,
                          // const Icon(Icons.keyboard_arrow_down),
                          //   ],
                          // ),
                          const Spacer(),
                          AppSecondaryButton(
                              onPressed: () {
                                context.router
                                    .push(RouteBusinessAddAndEditStock());
                              },
                              icon: Icon(
                                Icons.add,
                                size: 20.r,
                              ),
                              label: 'Create item'),
                        ],
                      ),
                    ),
                    14.verticalSpace,
                    Expanded(
                      flex: 3,
                      child: state.selectedItems!.isNotEmpty
                          ? ListView.separated(
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: state.selectedFUllItems!.length,
                              separatorBuilder: (context, index) =>
                                  const Divider(),
                              itemBuilder: (context, index) =>
                                  _addItemTile(state.selectedFUllItems![index]))
                          : AppEmptyWidget(),
                    ),
                    20.verticalSpace,
                    AppPrimaryButton(
                      onTap: () {
                        bloc.add(BusinessInvoiceAddItemSaveButtonClickEvent());
                      },
                      label: 'Save',
                    ),
                    20.verticalSpace,
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _addItemTile(AddedItemModel data) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      height: 100.h,
      // color: Colors.amber,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                data.itemName!,
                style: AppStyles.subHeading14500,
              ),
              const Spacer(),
              Text(
                data.date,
                style: AppStyles.subHeading12Semi
                    .copyWith(color: AppColors.textColorT1),
              ),
            ],
          ),
          12.verticalSpace,
          Row(
            children: [
              Flexible(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FilledTextField(
                      heading: 'Quantity',
                      controller: TextEditingController(text: data.quantity),
                      onChanged: (e) {
                        data.quantity = e;
                      },
                    ),
                  ],
                ),
              ),
              16.horizontalSpace,
              Flexible(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FilledTextField(
                      heading: 'Purchase price',
                      controller:
                          TextEditingController(text: data.purchasePrice),
                      onChanged: (e) {
                        data.purchasePrice = e;
                      },
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  _searchItemTile(InvoiceAllItemData data, bool isAdded) {
    return ListTile(
      leading: Text(
        data.itemName!,
        style: AppStyles.subHeading12700,
      ),
      trailing: InkWell(
        onTap: () {
          bloc.add(BusinessInvoiceAddItemAddButtonClickEvent(itemData: data));
        },
        child: Icon(
          isAdded ? Icons.remove_circle_outline : Icons.add_circle_rounded,
          color: AppColors.oldPrimaryP1,
          size: 18.w,
        ),
      ),
    );
  }
}

class AddedItemModel {
  final int itemId;
  final String itemName;
  final String date;
  String quantity;
  String purchasePrice;

  AddedItemModel(
      {required this.itemId,
      required this.itemName,
      required this.date,
      required this.quantity,
      required this.purchasePrice});
}
