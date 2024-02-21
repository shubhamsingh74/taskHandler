import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickprism/application/business/business_stock_in/business_stock_in_bloc.dart';
import 'package:quickprism/core/colors/app_colors.dart';
import 'package:quickprism/core/styles/app_styles.dart';
import 'package:quickprism/domain/core/di/injectable.dart';
import 'package:quickprism/domain/stocks/models/items/stock_items_model.dart';
import 'package:quickprism/domain/stocks/models/suppliers/suppliers_model.dart';
import 'package:quickprism/domain/user/user_constants.dart';
import 'package:quickprism/infrastructure/routing/app_router.dart';
import 'package:quickprism/presentation/widgets/appbar/main_appbar.dart';
import 'package:quickprism/presentation/widgets/button/primary_button.dart';
import 'package:quickprism/presentation/widgets/form_fields/normal_text_field.dart';
import 'package:quickprism/presentation/widgets/form_fields/remarks_field.dart';
import 'package:quickprism/presentation/widgets/form_fields/stock_in_out_textfield.dart';

GlobalKey<FormState> stockInKey = GlobalKey();

@RoutePage()
class ScreenBusinessStockIn extends StatefulWidget {
  const ScreenBusinessStockIn({super.key, required this.stockItemsData});

  final StockItemsData stockItemsData;

  @override
  State<ScreenBusinessStockIn> createState() => _ScreenBusinessStockInState();
}

class _ScreenBusinessStockInState extends State<ScreenBusinessStockIn> {
  bool isAmountOpen = false;

  final bloc = getIt<BusinessStockInBloc>();

  SuppliersDatum? currentSupplier;

  TextEditingController quantityController = TextEditingController();
  TextEditingController purchaseController = TextEditingController();
  TextEditingController remarksController = TextEditingController();
  TextEditingController gstController = TextEditingController();

  double totalAmount = 0;
  double gstAmount = 0;

  @override
  void initState() {
    bloc.add(BusinessStockInInitialEvent());
    super.initState();
  }

  @override
  void dispose() {
    quantityController.dispose();
    purchaseController.dispose();
    remarksController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: "Stock in - ${widget.stockItemsData.brand}",
        context: context,
      ),
      body: BlocConsumer<BusinessStockInBloc, BusinessStockInState>(
        listenWhen: (prev, current) => (current is BusinessStockInActionState),
        buildWhen: (prev, current) => (current is! BusinessStockInActionState),
        bloc: bloc,
        listener: (ctx, state) async {
          if (state is BusinessStockInNavigateToInvoiceState) {
            ctx.router.replace(RouteStockInvoice());
          }

          if (state is BusinessStockInNavigateToSuppliersState) {
            log('navigate to supplier');
            if (state.suppliers != null) {
              await ctx.router
                  .push(RouteStockInSelectSupplier(
                currentSupplier: currentSupplier,
                suppliers: state.suppliers!,
              ))
                  .then((value) {
                log(value.toString());

                if (value != null) {
                  List<SuppliersDatum?> newVal = value as List<SuppliersDatum?>;

                  bloc.add(BusinessStockInAfterSupplierSelectionEvent(
                    suppliers: state.suppliers,
                    supplier: newVal[0],
                  ));
                }
                return;
              });

              // currentSupplier = returnedSupplier;
            } else {
              log('${state.suppliers}');
            }
          }
        },
        builder: (context, state) {
          if (state is BusinessStockInLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is BusinessStockInErrorState) {
            return const Center(
              child: Text('Something went wrong'),
            );
          }

          // if (state.suppliers != null && state.suppliers!.isNotEmpty) {
          //   currentSupplier = state.suppliers!.first;
          // }
          currentSupplier = state.currentSupplier;

          return ListView(
            children: [
              Container(
                width: 1.sp,
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
              Form(
                key: stockInKey,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      16.verticalSpace,
                      Row(
                        children: [
                          Text(
                            'Available stock',
                            style: AppStyles.subHeading12
                                .copyWith(color: AppColors.textColorT2),
                          ),
                          const Spacer(),
                          Text("${widget.stockItemsData.availableStock} piece",
                              style: AppStyles.subHeading12500
                                  .copyWith(color: AppColors.textColorT1)),
                        ],
                      ),
                      8.verticalSpace,
                      Row(
                        children: [
                          Text(
                            'Last purchased date',
                            style: AppStyles.subHeading12
                                .copyWith(color: AppColors.textColorT2),
                          ),
                          const Spacer(),
                          Text('20 dec 2023',
                              style: AppStyles.subHeading12500
                                  .copyWith(color: AppColors.textColorT1)),
                        ],
                      ),
                      42.verticalSpace,
                      Text(
                        'Supplier',
                        style: AppStyles.detailsTextFieldHead
                            .copyWith(fontSize: 14.sp),
                        textAlign: TextAlign.start,
                      ),
                      12.verticalSpace,
                      InkWell(
                        onTap: () {
                          bloc.add(BusinessStockInSupplierClickEvent(
                              suppliers: state.suppliers));
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: <Widget>[
                                currentSupplier == null
                                    ? Text(
                                        "Select supplier",
                                        style: AppStyles.subHeading14.copyWith(
                                          color: AppColors.oldPrimaryP2,
                                        ),
                                      )
                                    : Text(
                                        currentSupplier!.name!,
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
                      32.verticalSpace,
                      StockInOutField(
                        heading: 'Enter quantity*',
                        keyboardType: TextInputType.number,
                        suffixText: 'Piece',
                        controller: quantityController,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        validator: _nameValidator,
                        onChanged: (e) {
                          _calculateAmount();
                        },
                      ),
                      32.verticalSpace,
                      StockInOutField(
                        heading: 'Purchase price',
                        keyboardType: TextInputType.number,
                        suffixText: '/Piece',
                        controller: purchaseController,
                        validator: _nameValidator,
                        onChanged: (e) {
                          _calculateAmount();
                        },
                      ),
                      32.verticalSpace,
                      Row(
                        children: <Widget>[
                          Text(
                            'Total amount',
                            style: AppStyles.subHeading16,
                          ),
                          const Spacer(),
                          Text(
                            '₹ $totalAmount',
                            style: AppStyles.subHeading14
                                .copyWith(color: AppColors.textColorT1),
                          ),
                        ],
                      ),
                      8.verticalSpace,
                      Row(
                        children: <Widget>[
                          // Text(
                          //   '0% GST',
                          //   style: AppStyles.subHeading12
                          //       .copyWith(color: AppColors.textColorT1),
                          // ),
                          SizedBox(
                              width: 50.w,
                              child: NormalTextField(
                                // maxLength: 2,
                                style: AppStyles.subHeading12700,
                                inputType: TextInputType.number,
                                hintText: 'gst',
                                controller: gstController,
                                textSubmitted: (e) {},
                                onChanged: (_) {
                                  _calculateAmount();
                                },
                                // inputFormatters: [
                                // FilteringTextInputFormatter.digitsOnly,
                                // ],
                              )),
                          Text(
                            '% GST',
                            style: AppStyles.subHeading12700,
                          ),
                          const Spacer(),
                          Text(
                            '₹ $gstAmount',
                            style: AppStyles.subHeading12
                                .copyWith(color: AppColors.textColorT1),
                          ),
                        ],
                      ),
                      8.verticalSpace,
                      InkWell(
                        onTap: () {
                          setState(() {
                            isAmountOpen = !isAmountOpen;
                          });
                        },
                        child: Row(
                          children: <Widget>[
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Amount received',
                                  style: AppStyles.subHeading14
                                      .copyWith(color: AppColors.textColorT1),
                                ),
                                4.horizontalSpace,
                                Icon(
                                  isAmountOpen
                                      ? Icons.keyboard_arrow_up
                                      : Icons.keyboard_arrow_down,
                                  // color: AppColors.primaryP2,
                                )
                              ],
                            ),
                            const Spacer(),
                            Text(
                              '₹ $totalAmount',
                              style: AppStyles.subHeading14
                                  .copyWith(color: AppColors.textColorT1),
                            ),
                          ],
                        ),
                      ),
                      8.verticalSpace,
                      isAmountOpen
                          ? Column(
                              children: [
                                Row(
                                  children: <Widget>[
                                    Text(
                                      'Cash',
                                      style: AppStyles.subHeading12.copyWith(
                                          color: AppColors.textColorT1),
                                    ),
                                    const Spacer(),
                                    Text(
                                      '₹ 0',
                                      style: AppStyles.subHeading12.copyWith(
                                          color: AppColors.textColorT1),
                                    ),
                                  ],
                                ),
                                8.verticalSpace,
                                Row(
                                  children: <Widget>[
                                    Text(
                                      'Online',
                                      style: AppStyles.subHeading12.copyWith(
                                          color: AppColors.textColorT1),
                                    ),
                                    const Spacer(),
                                    Text(
                                      '₹ $totalAmount',
                                      style: AppStyles.subHeading12.copyWith(
                                          color: AppColors.textColorT1),
                                    ),
                                  ],
                                ),
                                8.verticalSpace,
                                Row(
                                  children: <Widget>[
                                    Text(
                                      'Due amount',
                                      style: AppStyles.subHeading12
                                          .copyWith(color: AppColors.oldPrimaryP1),
                                    ),
                                    const Spacer(),
                                    Text(
                                      '₹ 0',
                                      style: AppStyles.subHeading12
                                          .copyWith(color: AppColors.oldPrimaryP1),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          : 1.verticalSpace,
                      20.verticalSpace,
                      Text(
                        'Remarks',
                        style: AppStyles.subHeading12
                            .copyWith(color: AppColors.textColorT2),
                      ),
                      5.verticalSpace,
                      RemarksTextField(
                        controller: remarksController,
                        validator: _nameValidator,
                      ),
                      20.verticalSpace,
                      AppPrimaryButton(
                        label: 'Record',
                        onTap: state.currentSupplier == null
                            ? null
                            : () {
                                if (_formValidate()) {
                                  bloc.add(BusinessStockInMainButtonClickEvent(
                                      itemId: widget.stockItemsData.itemId!,
                                      shopId:
                                          UserConstants.currentShop!.shopId!,
                                      quantity:
                                          int.parse(quantityController.text),
                                      supplierId: state.currentSupplier!
                                              .businessSupplierId ??
                                          1,
                                      date: '12/23/2323',
                                      remarks: remarksController.text,
                                      invoiceNumber: 124,
                                      gstPercentage:
                                          double.parse(gstController.text),
                                      purchasePrice:
                                          double.parse(purchaseController.text),
                                      totalAmount: totalAmount,
                                      cashAmount: 0,
                                      onlineAmount: totalAmount,
                                      dueAmount: 0));
                                }
                              },
                      ),
                      20.verticalSpace,
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  _calculateAmount() {
    setState(() {
      try {
        var quantity = int.parse(quantityController.text);
        var salePrice = double.parse(purchaseController.text);
        var total = quantity * salePrice;

        gstAmount = (total *
                double.parse(
                    gstController.text == '' ? '0' : gstController.text)) /
            100;

        totalAmount = gstAmount + total;
      } catch (e) {
        totalAmount = 0;
        gstAmount = 0;
      }
    });
  }

  bool _formValidate() {
    final FormState? form = stockInKey.currentState;
    if (form != null && form.validate()) {
      // log('form validate true');

      return true;
    }

    return false;
  }

  String? _nameValidator(String? text) {
    if (text != null && text.isEmpty) {
      return 'This field is required';
    }

    return null;
  }
}
