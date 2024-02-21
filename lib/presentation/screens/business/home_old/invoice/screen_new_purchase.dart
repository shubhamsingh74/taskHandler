import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickprism/application/business/business_invoice_create_invoice/business_invoice_create_bloc.dart';
import 'package:quickprism/core/colors/app_colors.dart';
import 'package:quickprism/core/styles/app_styles.dart';
import 'package:quickprism/domain/invoice/models/create_purchase_body_model.dart';
import 'package:quickprism/domain/stocks/models/suppliers/suppliers_model.dart';
import 'package:quickprism/domain/user/user_constants.dart';
import 'package:quickprism/infrastructure/routing/app_router.dart';
import 'package:quickprism/presentation/screens/business/home_old/invoice/screen_invoice_add_item.dart';
import 'package:quickprism/presentation/widgets/appbar/main_appbar.dart';
import 'package:quickprism/presentation/widgets/button/primary_button.dart';
import 'package:quickprism/presentation/widgets/form_fields/filled_text_field.dart';

import '../../../../../domain/core/di/injectable.dart';

@RoutePage()
class ScreenInvoiceNewPurchase extends StatefulWidget {
  const ScreenInvoiceNewPurchase({super.key});

  @override
  State<ScreenInvoiceNewPurchase> createState() =>
      _ScreenInvoiceNewPurchaseState();
}

class _ScreenInvoiceNewPurchaseState extends State<ScreenInvoiceNewPurchase> {
  final bloc = getIt<BusinessInvoiceCreatePurchaseBloc>();
  SuppliersDatum? currentSelectedSupplier;
  List<SuppliersDatum> suppliers = [];

  // List<CreatePurchaseItemsDetail> selectedItems = [];
  List<AddedItemModel> selectedItems = [];
  TextEditingController quantityController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  // TextEditingController remarksController = TextEditingController();

  @override
  void initState() {
    quantityController.text = '10';
    priceController.text = '100';
    bloc.add(BusinessInvoiceCreateInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: "New purchase entry",
        context: context,
      ),
      body: BlocConsumer<BusinessInvoiceCreatePurchaseBloc,
          BusinessInvoiceCreatePurchaseState>(
        bloc: bloc,
        listenWhen: (prev, current) =>
            (current is BusinessInvoiceCreateActionState),
        buildWhen: (prev, current) =>
            (current is! BusinessInvoiceCreateActionState),
        listener: (ctx, state) async {
          if (state is BusinessInvoiceCreateNavigateToInvoiceState) {
            ctx.router.replace(RouteStockInvoice());
          }
          if (state is BusinessInvoiceCreateNavigateToSupplierState) {
            await ctx.router
                .push(RouteInvoiceSelectSupplier(
                    suppliers: suppliers,
                    currentSupplier: currentSelectedSupplier))
                .then((value) {
              if (value != null) {
                var newVal = value as List<SuppliersDatum?>;

                setState(() {
                  currentSelectedSupplier = newVal[0];
                });
              }
            });
          }
          if (state is BusinessInvoiceCreateNavigateToAddItemState) {
            await ctx.router.push(const RouteInvoiceAddItem()).then((value) {
              if (value != null) {
                var newVal = value as List<AddedItemModel>;

                setState(() {
                  selectedItems = newVal;
                });
              }
            });
          }
        },
        builder: (context, state) {
          if (state.suppliers != null) {
            suppliers = state.suppliers!;
          }

          return Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 32.h,
                color: AppColors.supportSP4,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '10 sep 2023',
                      style: AppStyles.subHeading14
                          .copyWith(color: AppColors.textColorT1),
                    ),
                  ],
                ),
              ),
              24.verticalSpace,
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    // mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Supplier',
                        style: AppStyles.detailsTextFieldHead
                            .copyWith(fontSize: 14.sp),
                        textAlign: TextAlign.start,
                      ),
                      12.verticalSpace,
                      InkWell(
                        onTap: () {
                          bloc.add(BusinessInvoiceCreateSelectSupplierEvent());
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: <Widget>[
                                Text(
                                  currentSelectedSupplier != null
                                      ? currentSelectedSupplier!.name!
                                      : "Select supplier",
                                  style: AppStyles.subHeading14.copyWith(
                                    color: AppColors.oldPrimaryP2,
                                  ),
                                ),
                                const Spacer(),
                                const Icon(
                                  Icons.chevron_right,
                                  color: AppColors.oldPrimaryP2,
                                )
                              ],
                            ),
                            const Divider(),
                          ],
                        ),
                      ),
                      18.verticalSpace,
                      Text(
                        'Items',
                        style: AppStyles.detailsTextFieldHead
                            .copyWith(fontSize: 14.sp),
                        textAlign: TextAlign.start,
                      ),
                      12.verticalSpace,
                      InkWell(
                        onTap: () {
                          bloc.add(BusinessInvoiceCreateAddItemsEvent());
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: <Widget>[
                                Text(
                                  "Add items here",
                                  style: AppStyles.subHeading14,
                                ),
                                const Spacer(),
                                CircleAvatar(
                                  radius: 10.r,
                                  backgroundColor: AppColors.supportUI3,
                                  child: Icon(
                                    Icons.add,
                                    color: AppColors.oldPrimaryP1,
                                    size: 15.r,
                                  ),
                                )
                              ],
                            ),
                            const Divider(),
                          ],
                        ),
                      ),
                      12.verticalSpace,
                      Expanded(
                        child: ListView.separated(
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: selectedItems.length,
                            separatorBuilder: (context, index) =>
                                const Divider(),
                            itemBuilder: (context, index) =>
                                _addItemTile(selectedItems[index])),
                      ),
                    ],
                  ),
                ),
              ),
              12.verticalSpace,
              AppPrimaryButton(
                label: 'Record',
                onTap: currentSelectedSupplier != null
                    ? () {
                        // if (selectedItems.isNotEmpty) {
                        //   bloc.add(
                        //     BusinessInvoiceCreatePurchaseCreateEvent(
                        //       request: CreatePurchaseBodyModel(
                        //           supplierId: currentSelectedSupplier!
                        //               .businessSupplierId,
                        //           shopId: UserConstants.currentShop!.shopId,
                        //           itemsDetails: selectedItems
                        //               .map((e) => CreatePurchaseItemsDetail(
                        //                     itemId: e.itemId,
                        //                     quantity: int.parse(e.quantity),
                        //                     price:
                        //                         double.parse(e.purchasePrice),
                        //                     date: DateTime.now().toString(),
                        //                   ))
                        //               .toList(),
                        //           gstPercentage: 18,
                        //           cashAmountRecieved: 100,
                        //           onlineAmountRecieved: 100,
                        //           dueAmount: 100,
                        //           remarks: '',
                        //           date: DateTime.now().toString(),
                        //           time:
                        //               DateTime.now().toString().split(' ')[1]),
                        //     ),
                        //   );
                        // }
                      }
                    : null,
              ),
              24.verticalSpace,
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
}
