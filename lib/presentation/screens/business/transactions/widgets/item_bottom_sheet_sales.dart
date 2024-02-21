import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickprism/core/utils/extensions.dart';
import 'package:quickprism/presentation/screens/business/transactions/widgets/unit_dropdown.dart';
import 'package:quickprism/presentation/widgets/normal_dropdown/normal_dropdown.dart';

import '../../../../../application/business/transactions_sales_invoice/transaction_sales_invoice_bloc.dart';
import '../../../../../core/colors/app_colors.dart';
import '../../../../../core/styles/app_styles.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../domain/invoice/create_purchase_response_model/purchaseBodyModel/invoice_body_model.dart';
import '../../../../../domain/stocks/models/mylist_details/mylist_details_model.dart';
import '../../../../widgets/form_fields/normal_text_field.dart';
import '../../../../widgets/network_image_widget/network_image_widget.dart';

class ItemBottomSheetSales extends StatefulWidget {
  const ItemBottomSheetSales(
      {super.key,
      required this.items,
      required this.transactionSalesInvoiceBloc});
  final List<MyListDetailsData> items;
  final TransactionSalesInvoiceBloc transactionSalesInvoiceBloc;

  @override
  State<ItemBottomSheetSales> createState() => _ItemBottomSheetSalesState();
}

class _ItemBottomSheetSalesState extends State<ItemBottomSheetSales> {
  MyListDetailsData? selectedItem;

  final TextEditingController quantityController = TextEditingController();
  final TextEditingController salePriceController = TextEditingController();
  final TextEditingController discountController = TextEditingController();
  String? unit;
  int? unitQuantity;
  int noOfLotsCoveredByQuantity = 0;
  Random random = Random();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TransactionSalesInvoiceBloc,
        TransactionSalesInvoiceState>(
      bloc: widget.transactionSalesInvoiceBloc,
      listener: (context, state) {
        if (state
            is TransactionSalesInvoiceGettingQuantityAndLotsSuccessState) {
          if (state.unitAndQuantityList.isEmpty) {
            Utils.errorToast(context, "No stock available");
            selectedItem = null;
          }
        }
      },
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.r),
              topRight: Radius.circular(12.r),
            ),
          ),
          child: SizedBox(
            height: 1.sh / 1.1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                10.h.verticalSpace,
                const Row(
                  children: [Spacer(), CloseButton()],
                ),
                Text(
                  'Add items to your invoice',
                  style: AppStyles.inter16600T1.copyWith(
                    fontSize: 18.sp,
                  ),
                ),
                16.h.verticalSpace,
                SizedBox(
                  height: 45.h,
                  child: const NormalTextField(
                    prefix: Icon(Icons.search),
                  ),
                ),
                // item
                selectedItem != null
                    ? Container(
                        margin: EdgeInsets.only(bottom: 24.h),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                AppNetWorkImageWidget(
                                  rawSize: 32,
                                  imageUrl: selectedItem!.imageUrl!,
                                ),
                                8.horizontalSpace,
                                Flexible(
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 12.h),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              selectedItem!.itemName!,
                                              style: AppStyles.tileStyleTitle,
                                            ),
                                            const Spacer(),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Flexible(
                                    child: SizedBox(
                                  height: 50.h,
                                  child: NormalTextField(
                                    controller: quantityController,
                                    label: 'Quantity',
                                    enabled: unit != null,
                                    onTap: () {
                                      unit == null
                                          ? Utils.errorToast(
                                              context, "unit not selected")
                                          : null;
                                    },
                                    maxLength: 10,
                                    cursorHeight: 20.h,
                                    inputType: TextInputType.number,
                                    style: AppStyles.tileLeading,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    onChanged: (value) {
                                      setState(() {
                                        noOfLotsCoveredByQuantity = 0;
                                        int enteredQuantity = int.parse(
                                            value != "" ? value : "0");
                                        if (unitQuantity! < enteredQuantity) {
                                          Utils.errorToast(context,
                                              "Quantity exceeded available quantity");
                                        } else {
                                          widget.transactionSalesInvoiceBloc.add(
                                              TransactionSalesInvoiceQuantityEnterEvent(
                                                  quantityEnteredByUser:
                                                      int.parse(value.isNotEmpty
                                                          ? value
                                                          : "0")));
                                        }
                                      });
                                    },
                                  ),
                                )),
                              ],
                            ),
                            16.verticalSpace,
                            Row(
                              children: <Widget>[
                                Flexible(
                                  flex: 2,
                                  child: SizedBox(
                                    // height: 50.h,
                                    child: NormalDropDown(
                                      width: 200.w,
                                      hintText:
                                          state is TransactionSalesInvoiceGettingQuantityAndLotsSuccessState &&
                                                  state.lotsData.isNotEmpty
                                              ? state.lotsData.first.lotName
                                              : "Lot name",
                                      enabled: true,
                                      onSelected: null,
                                      entries:
                                          state is TransactionSalesInvoiceGettingQuantityAndLotsSuccessState &&
                                                  state.lotsData.isNotEmpty
                                              ? state.lotsData.map((e) {
                                                  noOfLotsCoveredByQuantity++;
                                                
                                                
                                                  return DropdownMenuEntry(
                                                    value: e.lotName,
                                                    label: e.lotName,
                                                    style: ButtonStyle(
                                                      backgroundColor:
                                                          // noOfLotsCoveredByQuantity <=
                                                          //         state
                                                          //             .noOfLotsAsPerQuantityEnteredByUser
                                                          noOfLotsCoveredByQuantity <=
                                                                  state
                                                                      .noOfLotsAsPerQuantityEnteredByUser
                                                              ? MaterialStatePropertyAll(
                                                                  Colors.blue[
                                                                      300])
                                                              : null,
                                                    ),
                                                  );
                                                }).toList()
                                              : [],

                                      // height: 50.h,
                                    ),
                                  ),
                                ),
                                26.horizontalSpace,
                                Flexible(
                                  flex: 1,
                                  child: SizedBox(
                                      height: 50.h,
                                      child: UnitSelectionDropdown(
                                        unitsList: state
                                                is TransactionSalesInvoiceGettingQuantityAndLotsSuccessState
                                            ? state.unitAndQuantityList
                                            : [],
                                        onChange: (p0) {
                                          unit = p0;
                                          quantityController.text = "0";
                                          salePriceController.text = "0";
                                          discountController.text = "0";
                                          if (state
                                              is TransactionSalesInvoiceGettingQuantityAndLotsSuccessState) {
                                            state.unitAndQuantityList
                                                .forEach((element) {
                                              if (element.unit.contains(p0)) {
                                                unitQuantity =
                                                    element.availableQuantity;
                                              }
                                            });
                                          }
                                          widget.transactionSalesInvoiceBloc.add(
                                              TransactionSalesInvoiceGetQuantityAndLotsOfItemEvent(
                                                  itemId:
                                                      selectedItem?.itemId ?? 0,
                                                  unit: unit ?? ""));
                                        },
                                      )),
                                ),
                              ],
                            ),
                            16.h.verticalSpace,
                            Row(
                              children: <Widget>[
                                Flexible(
                                    child: SizedBox(
                                  height: 50.h,
                                  child: NormalTextField(
                                    controller: salePriceController,
                                    enabled: unit != null,
                                    onTap: () {
                                      unit == null
                                          ? Utils.errorToast(
                                              context, "unit not selected")
                                          : null;
                                    },
                                    label: 'Sale price',
                                    cursorHeight: 20.h,
                                    maxLength: 10,
                                    inputType: TextInputType.number,
                                    style: AppStyles.tileLeading,
                                    onChanged: (_) {
                                      setState(() {});
                                    },
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                  ),
                                )),
                                26.horizontalSpace,
                                Flexible(
                                    child: SizedBox(
                                  height: 50.h,
                                  child: NormalTextField(
                                      controller: discountController,
                                      enabled: unit != null,
                                      onTap: () {
                                        unit == null
                                            ? Utils.errorToast(
                                                context, "unit not selected")
                                            : null;
                                      },
                                      label: 'Discount %',
                                      cursorHeight: 20.h,
                                      maxLength: 2,
                                      inputType: TextInputType.number,
                                      style: AppStyles.tileLeading,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      onChanged: (_) {
                                        setState(() {});
                                      }),
                                )),
                              ],
                            ),
                          ],
                        ),
                      )
                    : 1.horizontalSpace,
                Expanded(
                  child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: widget.items.length,
                      separatorBuilder: (context, index) => 10.verticalSpace,
                      itemBuilder: (context, index) {
                        var currentItem = widget.items[index];
                        return Container(
                          width: 1.sw,
                          color: AppColors.white,
                          // decoration: const BoxDecoration(color: AppColors.supportSP3),
                          child: Row(
                            children: [
                              AppNetWorkImageWidget(
                                rawSize: 32,
                                imageUrl: "https://plus.unsplash.com/premium_photo-1672912260181-95b481639974?q=80&w=2832&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                                // imageUrl: currentItem.imageUrl!,
                              ),
                              8.horizontalSpace,
                              Flexible(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 12.h),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            currentItem.itemName!,
                                            style: AppStyles.tileStyleTitle,
                                          ),
                                          const Spacer(),
                                        ],
                                      ),
                                      4.verticalSpace,
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedItem == currentItem
                                        ? selectedItem = null
                                        : selectedItem = currentItem;
                                    widget.transactionSalesInvoiceBloc.add(
                                        TransactionSalesInvoiceGetQuantityAndLotsOfItemEvent(
                                            itemId: selectedItem?.itemId ?? 0,
                                            unit: ""));
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16.h, vertical: 4.w),
                                  decoration: ShapeDecoration(
                                    color: selectedItem != currentItem
                                        ? AppColors.primaryP2
                                        : AppColors.borderColorListTile,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(4.r)),
                                  ),
                                  child: Center(
                                    child: Text(
                                        selectedItem == currentItem
                                            ? 'Remove'
                                            : 'Sale',
                                        style: AppStyles.tabStyle.copyWith(
                                          color: selectedItem == currentItem
                                              ? AppColors.textColorT1
                                              : AppColors.white,
                                        )),
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                ),

                SizedBox(
                  height: 80.h,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            // '1 ITEMs',
                            "",
                            style: AppStyles.inter14600T7,
                          ),
                          4.verticalSpace,
                          Text(
                              '₹ ${((double.parse(quantityController.text == '' ? '0' : quantityController.text) * double.parse(salePriceController.text == '' ? '0' : salePriceController.text)) - ((double.parse(quantityController.text == '' ? '0' : quantityController.text) * double.parse(salePriceController.text == '' ? '0' : salePriceController.text)) * double.parse(discountController.text == '' ? '0' : discountController.text) / 100)).toStringAsFixed(2)}',
                              // '₹ ${(double.parse(quantityController.text == '' ? '0' : quantityController.text) * double.parse(salePriceController.text == '' ? '0' : salePriceController.text)) - double.parse(discountController.text == '' ? '0' : discountController.text)}',
                              // "${double.parse(quantityController.text ?? "0").toInt() * double.parse(salePriceController.text ?? "0.0") * (double.parse(discountController.text ?? "0").toInt())}",
                              style: AppStyles.inter14600T6),
                        ],
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          if (selectedItem != null) {
                            var total = (double.parse(
                                        quantityController.text == ''
                                            ? '0'
                                            : quantityController.text) *
                                    double.parse(salePriceController.text == ''
                                        ? '0'
                                        : salePriceController.text)) -
                                double.parse(discountController.text == ''
                                    ? '0'
                                    : discountController.text);
                            if (total != 0 && unit != null) {
                              widget.transactionSalesInvoiceBloc
                                  .add(TransactionSalesInvoiceAddItemEvent(
                                      item: InvoiceBodyModelSaleItem(
                                itemId: selectedItem!.itemId!,
                                quantity: double.parse(quantityController.text)
                                    .toInt(),
                                salePrice:
                                    double.parse(salePriceController.text)
                                        .toInt(),
                                // mrp: 0,
                                discount: double.parse(discountController.text)
                                    .toInt(),
                                unit: unit!,
                              )));
                              Navigator.of(context).pop();
                            } else {
                              Utils.errorToast(context, "select unit");
                            }
                          } else {
                            Utils.errorToast(context, "item not selected");
                            Navigator.of(context).pop();
                          }
                        },
                        child: Container(
                          width: 160.w,
                          height: 48.h,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          decoration: ShapeDecoration(
                            color: const Color(0xFF0689FF),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              state
                                      is TransactionSalesInvoiceGettingQuantityAndLotsLoadingState
                                  ? CircularProgressIndicator(
                                      color: AppColors.white,
                                    )
                                  : Text('Continue',
                                      style: AppStyles.inter18500T4
                                          .copyWith(color: AppColors.white)),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                //
              ],
            ),
          ),
        );
      },
    );
  }
}
