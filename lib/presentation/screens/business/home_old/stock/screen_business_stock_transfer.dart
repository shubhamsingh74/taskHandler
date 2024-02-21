import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickprism/application/business/business_stock_transfer/business_stock_transfer_bloc.dart';
import 'package:quickprism/core/colors/app_colors.dart';
import 'package:quickprism/core/styles/app_styles.dart';
import 'package:quickprism/core/utils/utils.dart';
import 'package:quickprism/domain/core/di/injectable.dart';
import 'package:quickprism/domain/stocks/models/items/stock_items_model.dart';
import 'package:quickprism/domain/user/user_constants.dart';
import 'package:quickprism/presentation/widgets/appbar/main_appbar.dart';
import 'package:quickprism/presentation/widgets/button/primary_button.dart';
import 'package:quickprism/presentation/widgets/empty_widget/empty_widget.dart';
import 'package:quickprism/presentation/widgets/form_fields/autofill_textField.dart';
import 'package:quickprism/presentation/widgets/form_fields/stock_in_out_textfield.dart';

GlobalKey<FormState> stockTransferKey = GlobalKey();

@RoutePage()
class ScreenBusinessStockTransfer extends StatefulWidget {
  const ScreenBusinessStockTransfer({super.key, required this.stockItemsData});

  final StockItemsData stockItemsData;

  @override
  State<ScreenBusinessStockTransfer> createState() =>
      _ScreenBusinessStockTransferState();
}

class _ScreenBusinessStockTransferState
    extends State<ScreenBusinessStockTransfer> {
  bool enabled = true;
  TextEditingController quantityController = TextEditingController();
  TextEditingController toShopController = TextEditingController();
  TextEditingController fromShopController = TextEditingController();
  TextEditingController fromCurrentStockController = TextEditingController();
  TextEditingController toCurrentStockController = TextEditingController();

  final bloc = getIt<BusinessStockTransferBloc>();

  final List<String> _list = const [
    "Brand 1",
    "Brand 2",
    "Brand 3",
    "Brand 4",
    "Brand 5",
    "Brand 6",
    "Brand 7",
    "Brand 8",
    "Brand 9",
    "Brand 10",
    "Brand 11",
    "Brand 12",
    "Brand 13",
    "Brand 14",
    "Brand 15",
    "Brand 16",
  ];
  final List<String> _listNumber = const [
    "10",
    "20",
    "30",
    "40",
    "50",
    "60",
    "70",
    "80",
    "90",
    "100",
    "101",
    "102",
    "103",
    "104",
    "105",
    "106",
  ];

  @override
  void initState() {
    bloc.add(BusinessStockTransferInitialEvent(
      businessId: 1,
      // businessId: UserConstants.currentBusiness!.businessId!,
      itemId: widget.stockItemsData.itemId!,
    ));
    super.initState();
  }

  @override
  void dispose() {
    quantityController.dispose();
    toShopController.dispose();
    fromShopController.dispose();
    fromCurrentStockController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MainAppBar(
          title: "Stock Transfer - ${widget.stockItemsData.brand}",
          context: context,
        ),
        body:
            BlocConsumer<BusinessStockTransferBloc, BusinessStockTransferState>(
          bloc: bloc,
          listenWhen: (prev, current) =>
              (current is BusinessStockTransferActionState),
          buildWhen: (prev, current) =>
              (current is! BusinessStockTransferActionState),
          listener: (ctx, state) {
            if (state is BusinessStockTransferNavigateBackState) {
              ctx.router.pop();
            }
          },
          builder: (context, state) {
            if (state is BusinessStockTransferLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is BusinessStockTransferLoadingState) {
              return const Center(
                child: AppEmptyWidget(
                  message: 'Server error',
                ),
              );
            }

            if ((state is BusinessStockTransferSuccessState) &&
                state.transferData == null) {
              return const Center(
                child: AppEmptyWidget(
                  message: 'NO transfer data found',
                ),
              );
            }

            return Form(
              key: stockTransferKey,
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
                          DateTime.now().toString().split(' ')[0],
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
                          24.verticalSpace,
                          StockInOutField(
                            heading: 'Enter quantity to transfer*',
                            keyboardType: TextInputType.number,
                            suffixText: 'Piece',
                            controller: quantityController,
                            validator: _nameValidator,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                          32.verticalSpace,
                          Row(
                            children: [
                              Text(
                                'Available stock',
                                style: AppStyles.subHeading12
                                    .copyWith(color: AppColors.textColorT2),
                              ),
                              const Spacer(),
                              Text("${state.transferData?.availableItem} piece",
                                  style: AppStyles.subHeading12500
                                      .copyWith(color: AppColors.textColorT1)),
                            ],
                          ),
                          24.verticalSpace,
                          Text(
                            'Select store to shift from*',
                            style: AppStyles.detailsTextFieldHead
                                .copyWith(fontSize: 14.sp),
                            textAlign: TextAlign.start,
                          ),
                          8.verticalSpace,
                          AutoFillTextField(
                            clearOnSubmit: true,
                            enabled: enabled,
                            controller: fromShopController,
                            label: 'select shop',
                            suggestions: UserConstants.shops
                                .map((e) => e.shopName!)
                                .toList(),
                            textSubmitted: (e) {
                              fromShopController.text = e;

                              var selectedShopId = UserConstants.shops
                                  .firstWhere(
                                      (element) => element.shopName == e)
                                  .shopId;

                              var shopStockCount = state
                                  .transferData!.itemInShop!
                                  .firstWhere((element) =>
                                      element.shopId == selectedShopId)
                                  .availableItem;

                              setState(() {
                                fromCurrentStockController.text =
                                    shopStockCount.toString();
                              });
                              log(fromCurrentStockController.text);
                            },
                            inputType: TextInputType.name,
                            validator: _nameValidator,
                          ),
                          24.verticalSpace,

                          Row(
                            children: <Widget>[
                              Text(
                                "Current stock available :",
                                style: AppStyles.subHeading12.copyWith(
                                  color: AppColors.textColorT1,
                                ),
                              ),
                              16.horizontalSpace,
                              Text(
                                fromCurrentStockController.text == ""
                                    ? '-'
                                    : fromCurrentStockController.text,
                                style: AppStyles.subHeading14500.copyWith(
                                  color: AppColors.textColorT1,
                                ),
                              ),
                            ],
                          ),
                          // NormalTextField(
                          //   controller: currentStockController,
                          //   enabled: false,
                          //   label: 'Current stock available',
                          // ),
                          // AutoFillTextField(
                          //   enabled: enabled,
                          //   controller: currentStockController,
                          //   label: 'Current stock available',
                          //   suggestions: _listNumber,
                          //   suffix: const Icon(
                          //     Icons.keyboard_arrow_down,
                          //   ),
                          //   textSubmitted: (e) {
                          //     currentStockController.text = e;
                          //   },
                          //   inputType: TextInputType.number,
                          //   inputFormatters: [
                          //     FilteringTextInputFormatter.digitsOnly,
                          //   ],
                          //   validator: _nameValidator,
                          // ),
                          32.verticalSpace,
                          Text(
                            'Select store to shift to*',
                            style: AppStyles.detailsTextFieldHead
                                .copyWith(fontSize: 14.sp),
                            textAlign: TextAlign.start,
                          ),
                          8.verticalSpace,
                          AutoFillTextField(
                            clearOnSubmit: true,
                            enabled: enabled,
                            controller: toShopController,
                            label: 'select shop',
                            suggestions: UserConstants.shops
                                .map((e) => e.shopName!)
                                .toList(),
                            textSubmitted: (e) {
                              toShopController.text = e;

                              var selectedShopId = UserConstants.shops
                                  .firstWhere(
                                      (element) => element.shopName == e)
                                  .shopId;

                              var shopStockCount = state
                                  .transferData!.itemInShop!
                                  .firstWhere((element) =>
                                      element.shopId == selectedShopId)
                                  .availableItem;

                              setState(() {
                                toCurrentStockController.text =
                                    shopStockCount.toString();
                              });
                              log(toCurrentStockController.text);
                            },
                            inputType: TextInputType.name,
                            validator: _nameValidator,
                          ),
                          24.verticalSpace,

                          Row(
                            children: <Widget>[
                              Text(
                                "Current stock available :",
                                style: AppStyles.subHeading12.copyWith(
                                  color: AppColors.textColorT1,
                                ),
                              ),
                              16.horizontalSpace,
                              Text(
                                toCurrentStockController.text == ""
                                    ? '-'
                                    : toCurrentStockController.text,
                                style: AppStyles.subHeading14500.copyWith(
                                  color: AppColors.textColorT1,
                                ),
                              ),
                            ],
                          ),
                          48.verticalSpace,
                          AppPrimaryButton(
                            label: 'Transfer stock',
                            onTap: () {
                              if (fromShopController.text.trim() ==
                                  toShopController.text.trim()) {
                                Utils.errorToast(
                                    context, 'Cant transfer to same shop');
                              } else if (fromShopController.text == '' ||
                                  toShopController.text == '') {
                                Utils.errorToast(context, 'Select shops');
                              } else if (int.parse(quantityController.text) >
                                  int.parse(fromCurrentStockController.text)) {
                                Utils.errorToast(context,
                                    'Quantity greater than available stock');
                              } else if (_formValidate()) {
                                bloc.add(
                                  BusinessStockTransferMainButtonClickEvent(
                                    itemId: widget.stockItemsData.itemId!,
                                    toShopId: UserConstants.shops
                                        .firstWhere((element) =>
                                            element.shopName!.trim() ==
                                            toShopController.text.trim())
                                        .shopId!,
                                    fromShopId: UserConstants.shops
                                        .firstWhere((element) =>
                                            element.shopName!.trim() ==
                                            fromShopController.text.trim())
                                        .shopId!,
                                    date:
                                        DateTime.now().toString().split(' ')[0],
                                    quantity: int.parse(
                                      quantityController.text,
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                          24.verticalSpace,
                        ]),
                  )
                ],
              ),
            );
          },
        ));
  }

  bool _formValidate() {
    final FormState? form = stockTransferKey.currentState;
    if (form != null && form.validate()) {
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
