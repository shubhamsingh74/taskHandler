import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickprism/application/business/business_stock_out/business_stock_out_bloc.dart';
import 'package:quickprism/core/colors/app_colors.dart';
import 'package:quickprism/core/styles/app_styles.dart';
import 'package:quickprism/domain/core/di/injectable.dart';
import 'package:quickprism/domain/stocks/models/customers/customers_model.dart';
import 'package:quickprism/domain/stocks/models/items/stock_items_model.dart';
import 'package:quickprism/domain/user/user_constants.dart';
import 'package:quickprism/infrastructure/routing/app_router.dart';
import 'package:quickprism/presentation/widgets/appbar/main_appbar.dart';
import 'package:quickprism/presentation/widgets/button/primary_button.dart';
import 'package:quickprism/presentation/widgets/form_fields/normal_text_field.dart';
import 'package:quickprism/presentation/widgets/form_fields/remarks_field.dart';
import 'package:quickprism/presentation/widgets/form_fields/stock_in_out_textfield.dart';

GlobalKey<FormState> stockOutKey = GlobalKey();

@RoutePage()
class ScreenBusinessStockOut extends StatefulWidget {
  const ScreenBusinessStockOut({super.key, required this.stockItemsData});

  final StockItemsData stockItemsData;

  @override
  State<ScreenBusinessStockOut> createState() => _ScreenBusinessStockOutState();
}

class _ScreenBusinessStockOutState extends State<ScreenBusinessStockOut> {
  bool isAmountOpen = false;

  final bloc = getIt<BusinessStockOutBloc>();

  CustomersDatum? currentCustomer;

  TextEditingController quantityController = TextEditingController();
  TextEditingController salesController = TextEditingController();
  TextEditingController remarksController = TextEditingController();
  TextEditingController gstController = TextEditingController();

  double totalAmount = 0;
  double gstAmount = 0;

  @override
  void initState() {
    bloc.add(BusinessStockOutInitialEvent());
    super.initState();
  }

  @override
  void dispose() {
    quantityController.dispose();
    salesController.dispose();
    remarksController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: "Stock out - ${widget.stockItemsData.brand}",
        context: context,
      ),
      body: BlocConsumer<BusinessStockOutBloc, BusinessStockOutState>(
        bloc: bloc,
        listener: (ctx, state) async {
          if (state is BusinessStockOutNavigateToInvoiceState) {
            ctx.router.replace(  RouteStockInvoice());
          }

          if (state is BusinessStockOutNavigateToCustomersState) {
            log('navigate to supplier');
            if (state.customers != null) {
              await ctx.router
                  .push(RouteStockSelectCustomers(
                currentCustomer: currentCustomer,
                customers: state.customers!,
              ))
                  .then((value) {
                log(value.toString());

                if (value != null) {
                  List<CustomersDatum?> newVal = value as List<CustomersDatum?>;

                  setState(() {
                    currentCustomer = newVal[0];
                  });
                  // bloc.add(BusinessStockOutAfterCustomerSelectionEvent(
                  //   customers: state.customers,
                  //   customer: newVal[0],
                  // ));
                }
                return;
              });

              // currentSupplier = returnedSupplier;
            } else {
              log('${state.customers}');
            }
          }
        },
        builder: (context, state) {
          if (state is BusinessStockOutLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is BusinessStockOutErrorState) {
            return const Center(
              child: Text('Something went wrong'),
            );
          }

          // if (state.suppliers != null && state.suppliers!.isNotEmpty) {
          //   currentSupplier = state.suppliers!.first;
          // }

          return Form(
            key: stockOutKey,
            child: ListView(
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
                Padding(
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
                        'Customer (optional)',
                        style: AppStyles.detailsTextFieldHead
                            .copyWith(fontSize: 14.sp),
                        textAlign: TextAlign.start,
                      ),
                      12.verticalSpace,
                      InkWell(
                        onTap: () {
                          bloc.add(BusinessStockOutCustomerClickEvent(
                              customers: state.customers));
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: <Widget>[
                                currentCustomer == null
                                    ? Text(
                                        "Select customer",
                                        style: AppStyles.subHeading14.copyWith(
                                          color: AppColors.oldPrimaryP2,
                                        ),
                                      )
                                    : Text(
                                        currentCustomer!.name!,
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
                        validator: _nameValidator,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        onChanged: (e) {
                          _calculateAmount();
                        },
                      ),
                      32.verticalSpace,
                      StockInOutField(
                        heading: 'Sales price',
                        keyboardType: TextInputType.number,
                        suffixText: '/Piece',
                        controller: salesController,
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
                      // AnimatedContainer(
                      //   duration: const Duration(milliseconds: 200),
                      //   height: isAmountOpen ? 100.h : 0,
                      //   child: AnimatedSwitcher(
                      //
                      //     duration: const Duration(milliseconds: 400),
                      //     child:
                      //   ),
                      // ),
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
                        onTap: () {
                          if (_formValidate()) {
                            bloc.add(BusinessStockOutMainButtonClickEvent(
                                itemId: widget.stockItemsData.itemId!,
                                shopId: UserConstants.currentShop!.shopId!,
                                quantity: int.parse(quantityController.text),
                                customerId:
                                    currentCustomer!.businessCustomerId ?? 1,
                                date: '12/23/2323',
                                remarks: remarksController.text,
                                invoiceNumber: 124,
                                gstPercentage: 10.0,
                                salesPrice: double.parse(salesController.text),
                                totalAmount: 100.0,
                                cashAmount: 100.0,
                                onlineAmount: 100.0,
                                dueAmount: 100));
                          }
                        },
                      ),
                      20.verticalSpace,
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  _calculateAmount() {
    setState(() {
      try {
        var quantity = int.parse(quantityController.text);
        var salePrice = double.parse(salesController.text);
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
    final FormState? form = stockOutKey.currentState;
    if (form != null && form.validate()) {
      log('form validate true');

      return true;
    }
    log('form validate false');

    return false;
  }

  String? _nameValidator(String? text) {
    if (text != null && text.isEmpty) {
      return 'This field is required';
    }

    return null;
  }
}
