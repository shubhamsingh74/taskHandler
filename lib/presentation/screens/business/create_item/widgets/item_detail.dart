import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../application/business/business_create_item/business_create_item_bloc.dart';
import '../../../../../core/assets/assets.dart';
import '../../../../../core/colors/app_colors.dart';
import '../../../../../core/styles/app_styles.dart';
import '../../../../widgets/button/common_primary_button_business.dart';
import '../../../../widgets/form_fields/normal_text_field.dart';
import '../../../../widgets/normal_dropdown/normal_dropdown.dart';
import '../../../../widgets/svg_icon_widget/svg_icon_widget.dart';

class WidgetCreateItemItemDetails extends StatefulWidget {
  final BusinessCreateItemBloc businessCreateItemBloc;
  final BusinessCreateItemState state;
  const WidgetCreateItemItemDetails({
    Key? key,
    required this.businessCreateItemBloc,
    required this.state,
  }) : super(key: key);

  @override
  State<WidgetCreateItemItemDetails> createState() => _WidgetCreateItemItemDetailsState();
}

class _WidgetCreateItemItemDetailsState extends State<WidgetCreateItemItemDetails> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _itemCodeController = TextEditingController();

  final TextEditingController _itemBrandController = TextEditingController();

  final TextEditingController _itemHsnSacController = TextEditingController();

  final TextEditingController _itemNameController = TextEditingController();

  final TextEditingController _itemSelectController = TextEditingController();


  int categoryId = 0;

  String categoryName = "";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          25.verticalSpace,
          Material(
            elevation: 10,
            color: AppColors.white,
            shadowColor: Colors.blue.withOpacity(0.5),
            borderRadius: BorderRadius.circular(18.r),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Scan Item Code",
                    style: AppStyles.inter60016242323,
                  ),
                  6.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Image.asset(
                        AppAssets.imageCamera,
                        height: 64.h,
                        width: 64.w,
                      ),
                      Text("Scan Item Code \nto Auto-fill Details",style: AppStyles.inter500154B4A4A,),
                      const SizedBox(),
                    ],
                  ),
                  25.verticalSpace,
                  NormalTextField(
                    validator: (value){
                      if(_itemCodeController.text.isEmpty){
                        return "Enter the item code";
                      }
                      return null;
                    },
                    label: "Item Code*",
                    hintText: "Item Code*",
                    controller: _itemCodeController,
                    inputType: TextInputType.number,
                    prefix: const AppSvgIconWidget(
                      iconPath: AppAssets.barCode,
                      color: AppColors.primaryP2,
                    ),
                    borderColor: AppColors.primaryP2,
                    suffix: Text(
                      'Assign QuickSKU   ',
                      style: AppStyles.styleInter14500T7.copyWith(
                        fontSize: 12.sp,
                        height: 4,
                      ),
                    ),
                  ),
                  5.h.verticalSpace,
                ],
              ),
            ),
          ),
          35.h.verticalSpace,
          Text(
            "Item category*",
            style: AppStyles.inter50016242424,
          ),
          2.h.verticalSpace,
          NormalDropDown(
            controller: _itemSelectController,
            fillcolor: AppColors.textFieldFilledColor,
            width: 0.89.sw,
            height: 55.h,
            hintText: "Select Item Category",
            onSelected: (categoriesInfoDatum) {
              categoryId = categoriesInfoDatum.categoryId ?? -1;
              categoryName = categoriesInfoDatum.name ?? "N/A";
              setState(() {

              });
            },
            entries: widget.state.categoriesList
                .map((e) => DropdownMenuEntry(value: e, label: e.name ?? "N/A"))
                .toList(),
            // entries: [],
          ),
          2.h.verticalSpace,
          if(_itemSelectController.text.isEmpty)...[
            const Text("Please select the Item Category",style: TextStyle(color: Colors.red),)
          ],
          15.h.verticalSpace,
          Text(
            "Item brand",
            style: AppStyles.inter50016242424,
          ),
          2.h.verticalSpace,
          NormalTextField(
            isFilled: true,
            label: "Add Item brand",
            hintText: "Add Item brand",
            inputType: TextInputType.name,
            controller: _itemBrandController,
            validator: (value){
              if(_itemBrandController.text.isEmpty){
                return "Enter the item brand";
              }
              return null;
            },
          ),
          15.h.verticalSpace,
          Text(
            "HSN/SAC code*",
            style: AppStyles.inter50016242424,
          ),
          2.h.verticalSpace,
          NormalTextField(
            isFilled: true,
            label: "Add HSN/SAC Code",
            hintText: "Add HSN/SAC Code",
            inputType: TextInputType.number,
            controller: _itemHsnSacController,
            validator: (value){
              if(_itemHsnSacController.text.isEmpty){
                return "Enter the item HSN/SAC code";
              }
              return null;
            },
            //suffix: const Icon(Icons.search),
          ),
          15.h.verticalSpace,
          Text(
            "Item Name",
            style: AppStyles.inter50016242424,
          ),
          2.h.verticalSpace,
          NormalTextField(
            isFilled: true,
            label: "Add Item name",
            hintText: "Add Item name",
            inputType: TextInputType.name,
            controller: _itemNameController,
            validator: (value){
              if(_itemNameController.text.isEmpty){
                return "Enter the item name";
              }
              return null;
            },
          ),
          15.h.verticalSpace,
          Text(
            "Tax on Item",
            style: AppStyles.inter50016242424,
          ),
          2.h.verticalSpace,
          NormalDropDown(
            fillcolor: AppColors.textFieldFilledColor,
            width: 0.89.sw,
            height: 55.h,
            hintText: "Select Item Category",
            entries: const [],
            // entries: [],
          ),
          CommonPrimaryButton(
            margin: const EdgeInsetsDirectional.symmetric(vertical: 30),
            title: "Next",
            onTap: () {
              if( _formKey.currentState!.validate() && _itemSelectController.text.isNotEmpty){
                widget.businessCreateItemBloc
                    .add(BusinessCreateItemSaveItemDetailsEvent(
                  brand: _itemBrandController.text,
                  category: categoryName,
                  categoryId: categoryId,
                  code: int.parse(_itemCodeController.text),
                  hsnSecCode: int.parse(_itemHsnSacController.text),
                  name: _itemNameController.text,
                ));
              }
            },
          ),
        ],
      ),
    );
  }
}
