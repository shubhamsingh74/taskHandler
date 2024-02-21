import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickprism/application/business/business_stock_create_edit/business_stock_item_create_edit_bloc.dart';
import 'package:quickprism/core/colors/app_colors.dart';
import 'package:quickprism/core/styles/app_styles.dart';
import 'package:quickprism/domain/core/di/injectable.dart';
import 'package:quickprism/domain/stocks/models/item_info/stock_item_info_model.dart';
import 'package:quickprism/domain/user/user_constants.dart';
import 'package:quickprism/presentation/widgets/appbar/main_appbar.dart';
import 'package:quickprism/presentation/widgets/button/primary_button.dart';
import 'package:quickprism/presentation/widgets/form_fields/autofill_textField.dart';
import 'package:quickprism/presentation/widgets/form_fields/normal_text_field.dart';

GlobalKey<FormState> stockAddEditKey = GlobalKey();

@RoutePage()
class ScreenBusinessAddAndEditStock extends StatefulWidget {
  const ScreenBusinessAddAndEditStock({
    super.key,
    this.itemInfoModel,
    this.categoryId,
  });

  final MyListItemInfoData? itemInfoModel;

  final int? categoryId;

  @override
  State<ScreenBusinessAddAndEditStock> createState() =>
      _ScreenBusinessAddAndEditStockState();
}

class _ScreenBusinessAddAndEditStockState
    extends State<ScreenBusinessAddAndEditStock> {
  final lowStockAlertController = ValueNotifier<bool>(false);
  String title = '';
  bool enabled = true;
  TextEditingController brandController = TextEditingController();
  TextEditingController productController = TextEditingController();
  TextEditingController skuController = TextEditingController();
  TextEditingController unitController = TextEditingController();
  TextEditingController salesPriceController = TextEditingController();
  TextEditingController purchasePriceController = TextEditingController();
  TextEditingController hsnController = TextEditingController();
  TextEditingController gstController = TextEditingController();
  TextEditingController subCatController = TextEditingController();
  TextEditingController openingStockController = TextEditingController();
  TextEditingController asOfDateController = TextEditingController();
  TextEditingController lowStockController = TextEditingController();
  TextEditingController shopController = TextEditingController();
  TextEditingController currentStockController = TextEditingController();

  @override
  void initState() {
    if (widget.itemInfoModel != null) {
      bloc.add(BusinessStockItemCreateEditInitialEvent(
          categoryId: widget.itemInfoModel!.categoryId!));

      title = 'Edit item';
      brandController.text = widget.itemInfoModel!.categoryName!;
      productController.text = widget.itemInfoModel!.itemName!;
      skuController.text = widget.itemInfoModel!.itemCode!.toString();
      // unitController.text = widget.itemInfoModel!.primaryUnit!;
      // salesPriceController.text = widget.itemInfoModel!.salesPrice!.toString();
      purchasePriceController.text =
          // widget.itemInfoModel!.purchasePrice.toString();
          hsnController.text = widget.itemInfoModel!.hsnSacCode!.toString();
      // gstController.text = widget.itemInfoModel!.purchasePrice.toString();
      subCatController.text = widget.itemInfoModel!.categoryId.toString();
      openingStockController.text = '';
      asOfDateController.text =
          widget.itemInfoModel!.createdAt.toString().split(' ')[0];
      lowStockController.text = '100';
      shopController.text = UserConstants.currentShop!.shopName!;
      currentStockController.text = '100';
      lowStockAlertController.value = true;
      enabled = false;
    } else {
      bloc.add(BusinessStockItemCreateEditInitialEvent(
          categoryId: widget.categoryId ?? 1));

      title = 'Add new item';
    }
    super.initState();
  }

  @override
  void dispose() {
    brandController.clear();
    productController.clear();
    skuController.clear();
    unitController.clear();
    salesPriceController.clear();
    purchasePriceController.clear();
    hsnController.clear();
    gstController.clear();
    subCatController.clear();
    openingStockController.clear();
    asOfDateController.clear();
    lowStockController.clear();
    shopController.clear();
    currentStockController.clear();
    super.dispose();
  }

  final List<String> _list = const [
    // "Brand 1",
    // "Brand 2",
    // "Brand 3",
    // "Brand 4",
    // "Brand 5",
    // "Brand 6",
    // "Brand 7",
    // "Brand 8",
    // "Brand 9",
    // "Brand 10",
    // "Brand 11",
    // "Brand 12",
    // "Brand 13",
    // "Brand 14",
    // "Brand 15",
    // "Brand 16",
  ];
  final List<String> _unitList = const ["piece", "kg", "dozen"];
  // final List<String> _shopList = const ["Warehouse", "Shop 1", "Shop 2"];
  final List<String> _listNumber = const [
    "10",
    "20",
    "30",
    "40",
    // "50",
    // "60",
    // "70",
    // "80",
    // "90",
    // "100",
    // "101",
    // "102",
    // "103",
    // "104",
    // "105",
    // "106",
  ];

  final bloc = getIt<BusinessStockItemCreateEditBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BusinessStockItemCreateEditBloc,
        BusinessStockItemCreateEditState>(
      bloc: bloc,
      listener: (ctx, state) {
        if (state is BusinessStockItemCreateEditNavigateBackState) {
          ctx.router.pop();
        }
      },
      builder: (context, state) {
        if (widget.itemInfoModel != null && state.subCategories.isNotEmpty) {
          subCatController.text = state.subCategories
                  .firstWhere((element) =>
                      element.subCategoryId == widget.itemInfoModel!.categoryId)
                  .name ??
              "select category";

          // log('iam working => ${subCatController.text}');
        }

        return Scaffold(
          appBar: MainAppBar(title: title, context: context),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Form(
              key: stockAddEditKey,
              child: ListView(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  24.verticalSpace,
                  NormalTextField(
                    controller: brandController,
                    textSubmitted: (e) {
                      brandController.text = e;
                    },
                    label: 'Item brand',
                    inputType: TextInputType.name,
                    validator: _nameValidator,
                  ),
                  24.verticalSpace,
                  NormalTextField(
                    controller: productController,
                    textSubmitted: (e) {
                      productController.text = e;
                    },
                    label: 'Item name/service',
                    inputType: TextInputType.name,
                    validator: _nameValidator,
                  ),
                  24.verticalSpace,
                  Text(
                    'SKU',
                    style: AppStyles.detailsTextFieldHead
                        .copyWith(fontSize: 14.sp),
                    textAlign: TextAlign.start,
                  ),
                  8.verticalSpace,
                  NormalTextField(
                    controller: skuController,
                    label: '',
                    suffix: const Icon(
                      Icons.qr_code_sharp,
                      color: AppColors.oldPrimaryP2,
                    ),
                    textSubmitted: (e) {
                      skuController.text = e;
                    },
                    inputType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    validator: _nameValidator,
                  ),
                  24.verticalSpace,
                  AutoFillTextField(
                    controller: unitController,
                    label: 'Unit',
                    suggestions: _unitList,
                    suffix: const Icon(
                      Icons.keyboard_arrow_down,
                    ),
                    textSubmitted: (e) {
                      unitController.text = e;
                    },
                    inputType: TextInputType.name,
                    validator: _nameValidator,
                  ),
                  24.verticalSpace,
                  Row(
                    children: [
                      Flexible(
                        child: NormalTextField(
                          controller: salesPriceController,
                          label: 'Sales price',
                          textSubmitted: (e) {
                            salesPriceController.text = e;
                          },
                          inputType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          validator: _nameValidator,
                        ),
                      ),
                      16.horizontalSpace,
                      Flexible(
                        child: NormalTextField(
                          controller: purchasePriceController,
                          label: 'Purchase price',
                          textSubmitted: (e) {
                            purchasePriceController.text = e;
                          },
                          inputType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          validator: _nameValidator,
                        ),
                      ),
                    ],
                  ),
                  24.verticalSpace,
                  Row(
                    children: [
                      Flexible(
                        child: NormalTextField(
                          controller: hsnController,
                          label: 'HSN',
                          textSubmitted: (e) {
                            hsnController.text = e;
                          },
                          inputType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          validator: _nameValidator,
                        ),
                      ),
                      16.horizontalSpace,
                      Flexible(
                        child: AutoFillTextField(
                          controller: gstController,
                          label: 'GST',
                          suggestions: _listNumber,
                          suffix: const Icon(
                            Icons.keyboard_arrow_down,
                          ),
                          textSubmitted: (e) {
                            gstController.text = e;
                          },
                          inputType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          validator: _nameValidator,
                        ),
                      ),
                    ],
                  ),
                  24.verticalSpace,
                  AutoFillTextField(
                    controller: subCatController,
                    label: 'Sub category',
                    suggestions:
                        state.subCategories.map((e) => e.name!).toList(),
                    suffix: const Icon(
                      Icons.keyboard_arrow_down,
                    ),
                    textSubmitted: (e) {
                      subCatController.text = e;
                    },
                    inputType: TextInputType.name,
                    validator: _nameValidator,
                  ),
                  24.verticalSpace,
                  Text(
                    'Select store to add',
                    style: AppStyles.detailsTextFieldHead
                        .copyWith(fontSize: 14.sp),
                    textAlign: TextAlign.start,
                  ),
                  8.verticalSpace,
                  AutoFillTextField(
                    clearOnSubmit: true,
                    enabled: enabled,
                    controller: shopController,
                    label: 'select shop',
                    suggestions:
                        UserConstants.shops.map((e) => e.shopName!).toList(),
                    textSubmitted: (e) {
                      shopController.text = e;
                    },
                    inputType: TextInputType.name,
                    validator: _nameValidator,
                  ),
                  24.verticalSpace,
                  NormalTextField(
                    enabled: enabled,
                    controller: currentStockController,
                    label: 'Enter Quantity',
                    textSubmitted: (e) {
                      currentStockController.text = e;
                    },
                    inputType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    validator: _nameValidator,
                  ),
                  24.verticalSpace,
                  Row(
                    children: [
                      Text(
                        'Low stock alert',
                        style: AppStyles.detailsTextFieldLabel
                            .copyWith(fontSize: 14.sp),
                        textAlign: TextAlign.start,
                      ),
                      const Spacer(),
                      AdvancedSwitch(
                        enabled: enabled,
                        height: 16.h,
                        width: 25.w,
                        controller: lowStockAlertController,
                        activeColor: AppColors.oldPrimaryP2,
                        thumb: ValueListenableBuilder<bool>(
                          valueListenable: lowStockAlertController,
                          builder: (_, value, __) {
                            return Icon(
                              Icons.circle,
                              color: Colors.white,
                              size: 12.h,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  24.verticalSpace,
                  NormalTextField(
                    enabled: enabled,
                    controller: lowStockController,
                    label: 'Low stock quantity',
                    textSubmitted: (e) {
                      lowStockController.text = e;
                    },
                    inputType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    validator: _nameValidator,
                  ),
                  24.verticalSpace,
                  AppPrimaryButton(
                    label: 'Save',
                    onTap: () {
                      if (_formValidate()) {
                        var subCatId = state.subCategories
                            .firstWhere((element) =>
                                element.name == subCatController.text)
                            .subCategoryId!;

                        if (widget.itemInfoModel == null) {
                          bloc.add(BusinessStockItemCreateEditCreateEvent(
                            subCategoryId: subCatId,
                            categoryId: 0,
                            // businessId:
                            //     UserConstants.currentBusiness!.businessId!,
                            businessId: 1,
                            brand: brandController.text,
                            itemName: productController.text,
                            unit: unitController.text,
                            hsn: hsnController.text,
                            skuCode: int.parse(skuController.text),
                            gstPercentage: int.parse(gstController.text),
                            salesPrice: double.parse(salesPriceController.text),
                            purchasePrice:
                                double.parse(purchasePriceController.text),
                            shopId: UserConstants.shops
                                .firstWhere((element) =>
                                    element.shopName!.trim() ==
                                    shopController.text.trim())
                                .shopId!,
                            availableStock:
                                int.parse(currentStockController.text),
                            lowAlertUnits: int.parse(lowStockController.text),
                            lowAlertStatus: lowStockAlertController.value,
                          ));
                        } else {
                          bloc.add(BusinessStockItemCreateEditEditEvent(
                            itemId: widget.itemInfoModel!.itemId!,
                            subCategoryId: subCatId,
                            categoryId: widget.itemInfoModel!.categoryId!,
                            businessId: 2,
                            brand: brandController.text,
                            itemName: productController.text,
                            unit: unitController.text,
                            hsn: hsnController.text,
                            skuCode: int.parse(skuController.text),
                            gstPercentage: int.parse(gstController.text),
                            salesPrice: double.parse(salesPriceController.text),
                            purchasePrice:
                                double.parse(purchasePriceController.text),
                            shopId: UserConstants.shops
                                .firstWhere((element) =>
                                    element.shopName!.trim() ==
                                    shopController.text.trim())
                                .shopId!,
                            availableStock:
                                int.parse(currentStockController.text),
                            lowAlertUnits: int.parse(lowStockController.text),
                            lowAlertStatus: lowStockAlertController.value,
                          ));
                        }
                      }
                    },
                  ),
                  24.verticalSpace,
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  bool _formValidate() {
    final FormState? form = stockAddEditKey.currentState;
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
