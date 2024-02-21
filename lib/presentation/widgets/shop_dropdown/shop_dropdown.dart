import 'package:cool_dropdown/controllers/dropdown_controller.dart';
import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:cool_dropdown/models/cool_dropdown_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickprism/domain/user/models/user_model.dart';
import 'package:quickprism/domain/user/user_constants.dart';

import '../../../core/colors/app_colors.dart';
import '../../../core/styles/app_styles.dart';

class ShopDropDown extends StatelessWidget {
  const ShopDropDown(
      {Key? key,
      required this.list,
      required this.controller,
      required this.onChange})
      : super(key: key);
  final List<BusinessManagement> list;

  final DropdownController controller;

  final Function(BusinessManagement) onChange;

  @override
  Widget build(BuildContext context) {
    var defaultShop = UserConstants.currentShop ?? UserConstants.shops[0];
    // var defaultShop = list[0].shopName!;
     return SizedBox(
      width: 120.w,
      height: 35.h,
      child: CoolDropdown(
        defaultItem: CoolDropdownItem(
            selectedIcon: Icon(Icons.store),
            label: defaultShop.shopName ?? "N/A",
            value: defaultShop,
            // value: list[0],
            icon: Icon(Icons.store)),
        dropdownItemOptions: DropdownItemOptions(
          selectedBoxDecoration: BoxDecoration(color: Colors.grey.shade100),
          selectedTextStyle: AppStyles.navigationStyleSelected
              .copyWith(fontSize: 12.sp, color: AppColors.primaryP3),
          textStyle:
              AppStyles.navigationStyleSelected.copyWith(fontSize: 12.sp),
        ),
        resultOptions: ResultOptions(
          isMarquee: true,
          // placeholderTextStyle:
          //     AppStyles.dropDownMain.copyWith(color: AppColors.textColorT4),
          // textStyle:
          //     AppStyles.dropDownMain.copyWith(color: AppColors.textColorT4),
          openBoxDecoration: BoxDecoration(
            //  color: AppColors.primaryP3,
            border: Border.all(color: AppColors.primaryP2),
            // borderRadius: BorderRadius.circular(100.r),
          ),
          boxDecoration: BoxDecoration(
            color: AppColors.white,
            border: Border.all(color: AppColors.borderColorTextField),
            borderRadius: BorderRadius.circular(0),
          ),
        ),
        dropdownList: list
            .map((e) => CoolDropdownItem(
                  label: e.shopName!,
                  value: e,
                  icon: Icon(Icons.store),
                ))
            .toList(),
        controller: controller,
        onChange: onChange,

        // hintText: 'Select job role',

        // initialItem: list[0],
        // excludeSelected: false,
        // onChanged: debugPrint,
      ),
    );
  }
}
