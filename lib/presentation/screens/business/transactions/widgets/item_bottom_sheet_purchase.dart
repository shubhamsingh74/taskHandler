import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../application/business/transactions_purchase_invoice/transaction_purchase_invoice_bloc.dart';
import '../../../../../core/colors/app_colors.dart';
import '../../../../../core/styles/app_styles.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../domain/invoice/create_purchase_response_model/purchaseBodyModel/invoice_body_model.dart';
import '../../../../../domain/stocks/models/mylist_details/mylist_details_model.dart';
 import '../../../../widgets/form_fields/normal_text_field.dart';
import '../../../../widgets/network_image_widget/network_image_widget.dart';
import 'unit_dropdown.dart';

class ItemBottomSheetPurchase extends StatefulWidget {
  const ItemBottomSheetPurchase(
      {super.key,
      required this.items,
      required this.transactionPurchaseInvoiceBloc});
  final List<MyListDetailsData> items;
  final TransactionPurchaseInvoiceBloc transactionPurchaseInvoiceBloc;

  @override
  State<ItemBottomSheetPurchase> createState() => _ItemBottomSheetPurchaseState();
}

class _ItemBottomSheetPurchaseState extends State<ItemBottomSheetPurchase> {
  MyListDetailsData? selectedItem;

  final TextEditingController quantityController = TextEditingController();
  final TextEditingController mrpController = TextEditingController();
  final TextEditingController purchasePriceController = TextEditingController();
  String? unit;

  @override
  void initState() {
    quantityController.text = '0';
    mrpController.text = '0.0';
    purchasePriceController.text = '0';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                    // color: AppColors.secondary,
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
                                padding: EdgeInsets.symmetric(vertical: 12.h),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                    4.verticalSpace,
                                    // Text(
                                    //   selectedItem!.categoryName!,
                                    //   style: AppStyles.tileStyleSubTitle,
                                    // ), //availability

                                    //availability
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
                                maxLength: 10,
                                cursorHeight: 20.h,
                                inputType: TextInputType.number,
                                style: AppStyles.tileLeading,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                onChanged: (_) {
                                  setState(() {});
                                },
                              ),
                            )),
                          ],
                        ),
                        16.verticalSpace,
                        Row(
                          children: <Widget>[
                            Flexible(
                              child: UnitSelectionDropdown(
                                onChange: (p0) {
                                  unit = p0;
                                },
                              ),
                            ),
                            26.horizontalSpace,
                            Flexible(
                                child: SizedBox(
                              height: 50.h,
                              child: NormalTextField(
                                controller: mrpController,
                                label: 'MRP',
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
                                  controller: purchasePriceController,
                                  label: 'Purchase price',
                                  cursorHeight: 20.h,
                                  inputType: TextInputType.number,
                                  style: AppStyles.tileLeading,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  onChanged: (value) {
                                    setState(() {
                                      int mrp = double.parse(
                                              mrpController.text.isNotEmpty
                                                  ? mrpController.text
                                                  : "0")
                                          .toInt();
                                      int pp = double.parse(
                                              purchasePriceController
                                                      .text.isNotEmpty
                                                  ? purchasePriceController.text
                                                  : "0")
                                          .toInt();
                                      if (mrp < pp) {
                                        Utils.errorToast(context,
                                            "Mrp should be less than Purchase price",
                                            durationMilliSeconds: 500);
                                      }
                                    });
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
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                    borderRadius: BorderRadius.circular(4.r)),
                              ),
                              child: Center(
                                child: Text(
                                    selectedItem == currentItem
                                        ? 'Remove'
                                        : 'Order',
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
                        // '1 ITEM',
                        "", 
                        style: AppStyles.inter14600T7,
                      ),
                      4.verticalSpace,
                      Text(
                          // '₹ ${((double.parse(quantityController.text == '' ? '0' : quantityController.text) * double.parse(mrpController.text == '' ? '0' : mrpController.text)) - ((double.parse(quantityController.text == '' ? '0' : quantityController.text) * double.parse(mrpController.text == '' ? '0' : mrpController.text)) * double.parse(purchasePriceController.text == '' ? '0' : purchasePriceController.text) / 100)).toStringAsFixed(2)}',
                          "₹ ${(double.parse(quantityController.text == '' ? '0' : quantityController.text)) * double.parse(
                                purchasePriceController.text == ''
                                    ? '0'
                                    : purchasePriceController.text,
                              )}",
                          style: AppStyles.inter14600T6),
                    ],
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      if (selectedItem != null) {
                        var total = (double.parse(quantityController.text == ''
                                    ? '0'
                                    : quantityController.text) *
                                double.parse(mrpController.text == ''
                                    ? '0'
                                    : mrpController.text)) -
                            double.parse(purchasePriceController.text == ''
                                ? '0'
                                : purchasePriceController.text);
                        if (total != 0 && unit != null) {
                          widget.transactionPurchaseInvoiceBloc
                              .add(TransactionPurchaseInvoiceAddItemEvent(
                            item: InvoiceBodyModelPurchaseItem(
                              itemId: selectedItem!.itemId!,
                              quantity:
                                  double.parse(quantityController.text).toInt(),
                              purchasePrice:
                                  double.parse(purchasePriceController.text)
                                      .toInt(),
                              mrp: double.parse(mrpController.text).toInt(),
                              unit: unit ?? "",
                            ),
                          ));
                        } else {
                          if (unit == null) {
                            Utils.errorToast(context, "Unit not selected",
                                durationMilliSeconds: 1000);
                          }
                          if (total.toInt() == 0) {
                            Utils.errorToast(
                                context, "Item details not selected",
                                durationMilliSeconds: 1000);
                          }
                        }
                        if (selectedItem == null) {
                          Utils.errorToast(context, "Item not selected",
                              durationMilliSeconds: 1000);
                        }
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
                          Text('Continue',
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
  }
}