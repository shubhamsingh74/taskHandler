import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickprism/core/colors/app_colors.dart';
import 'package:quickprism/core/utils/extensions.dart';
import 'package:quickprism/core/utils/utils.dart';
import 'package:quickprism/presentation/widgets/button/bottom_navigation_bar.dart';
import 'package:quickprism/presentation/widgets/error_widget/error_widget.dart';
import 'package:quickprism/presentation/widgets/loading_widget/loading_widget.dart';

import '../../../../application/business/business_create_item/business_create_item_bloc.dart';
import '../../../../core/assets/assets.dart';
import '../../../../core/styles/app_styles.dart';
import '../../../../domain/core/di/injectable.dart';
import '../../../../domain/stocks/models/item_info/stock_item_info_model.dart';
import '../../../widgets/form_fields/normal_text_field.dart';
import '../../../widgets/normal_dropdown/normal_dropdown.dart';
import '../../../widgets/svg_icon_widget/svg_icon_widget.dart';

@RoutePage()
class ScreenEditItem extends StatefulWidget {
  final MyListItemInfoData? itemInfoData;

  const ScreenEditItem({super.key, required this.itemInfoData});

  @override
  State<ScreenEditItem> createState() => _ScreenEditItemState();
}

class _ScreenEditItemState extends State<ScreenEditItem> {
  final updateItemBloc = getIt<BusinessCreateItemBloc>();
  TextEditingController itemCodeController = TextEditingController();
  TextEditingController itemCategoryController = TextEditingController();
  TextEditingController hsnSacController = TextEditingController();
  TextEditingController itemNameController = TextEditingController();
  TextEditingController minStockQtyController = TextEditingController();

  String categoryId = "1";

  @override
  void initState() {
    super.initState();
    itemCategoryController.text =
        widget.itemInfoData?.categoryName.toString() ?? "1";
    categoryId = widget.itemInfoData?.categoryId.toString() ?? "1";
    itemCodeController.text = widget.itemInfoData?.itemCode.toString() ?? "1";
    hsnSacController.text = widget.itemInfoData?.hsnSacCode.toString() ?? "1";
    itemNameController.text = widget.itemInfoData?.itemName ?? "name";
    minStockQtyController.text =
        widget.itemInfoData?.categoryId.toString() ?? "";

    updateItemBloc.add(BusinessCreateItemGetItemCategoriesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BusinessCreateItemBloc, BusinessCreateItemState>(
      bloc: updateItemBloc,
      listener: (context, state) {
        if (state is BusinessUpdateItemSuccessState) {
          Utils.successToast(context, "Update Successfully");
          context.router.pop();
        }
      },
      builder: (context, state) {
        if (state is BusinessUpdateItemLoadingState ||
            state is BusinessCreateItemGetItemCategoriesLoadingState) {
          return const Scaffold(
            body: AppLoadingWidget(),
          );
        }
        if (state is BusinessUpdateItemErrorState) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.white,
            ),
            body: const AppErrorWidget(),
          );
        }
        if (state is BusinessCreateItemGetItemCategoriesState) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.white,
            ),
            bottomNavigationBar: ButtonBottomNavigationBar(
              title: "Update",
              onTap: () {
                updateItemBloc.add(
                  BusinessCreateItemUpdateInitialEvent(
                    
                      categoryId: categoryId,
                      hsnSacCode: hsnSacController.text,
                      imageUrl: "https://ibb.co/TK2DDvG",
                      itemCode: itemCodeController.text,
                      itemName: itemNameController.text,
                      itemId: "${widget.itemInfoData?.itemId}",
                      lowStockQty: minStockQtyController.text),
                );
            
              },
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  10.verticalSpace,
                  Flexible(
                    fit: FlexFit.loose,
                    child: NormalTextField(
                      label: "Item Code*",
                      hintText: "Item Code*",
                      controller: itemCodeController,
                      inputType: TextInputType.number,
                      prefix: const AppSvgIconWidget(
                        iconPath: AppAssets.barCode,
                        color: AppColors.primaryP2,
                      ),
                      suffix: Text(
                        'Assign QuickSKU   ',
                        style: AppStyles.styleInter14500T7.copyWith(
                          fontSize: 12.sp,
                          height: 4,
                        ),
                      ),
                    ),
                  ),
                  16.h.verticalSpace,
                  Flexible(
                    fit: FlexFit.loose,
                    child: NormalDropDown(
                      hintText: itemCategoryController.text,
                      entries: state.categoriesList!
                          .map(
                            (e) => DropdownMenuEntry(
                              value: e.categoryId,
                              label: e.name ?? "N/A",
                            ),
                          )
                          .toList(),
                      onSelected: (_catId) {
                        categoryId = _catId.toString();
                      },
                    ),
                  ),
                  16.h.verticalSpace,
                  16.h.verticalSpace,
                  Flexible(
                    fit: FlexFit.loose,
                    child: NormalTextField(
                      label: "HSN/SAC code*",
                      hintText: "HSN/SAC code*",
                      inputType: TextInputType.number,
                      controller: hsnSacController,
                      suffix: const Icon(Icons.search),
                    ),
                  ),
                  16.h.verticalSpace,
                  Flexible(
                      fit: FlexFit.loose,
                      child: NormalTextField(
                        label: "Item name*",
                        hintText: "Item name*",
                        controller: itemNameController,
                      )),
                  16.h.verticalSpace,
                  Flexible(
                    fit: FlexFit.loose,
                    child: NormalTextField(
                      label: "Min stock qty",
                      hintText: "Min stock qty",
                      inputType: TextInputType.number,
                      controller: minStockQtyController,
                    ),
                  ),
                  16.h.verticalSpace,
                ],
              ),
            ),
          );
        }
        return Scaffold(
          body: Text(state.toString()),
        );
      },
    );
  }
}
