import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:cool_dropdown/models/cool_dropdown_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickprism/core/colors/app_colors.dart';
import 'package:quickprism/domain/user/models/user_model.dart';
import 'package:quickprism/domain/user/user_constants.dart';

import '../../../../../core/styles/app_styles.dart';

class ShopDropDown extends StatelessWidget {
  const ShopDropDown(
      {Key? key,
      required this.list,
      required this.onChange,
      required this.controller})
      : super(key: key);
  final List<BusinessManagement> list;
  final Function(BusinessManagement) onChange;
  final DropdownController controller;
  // currentShops
  //     .map((e) => e.shopName ?? '')
  //     .toList()

  @override
  Widget build(BuildContext context) {
    var defaultShop = UserConstants.currentShop!;
    // var defaultShop = list[0];

    return SizedBox(
      width: 100,
      child: CoolDropdown(
        defaultItem:
            CoolDropdownItem(label: defaultShop.shopName!, value: defaultShop),

        dropdownItemOptions: DropdownItemOptions(
          selectedBoxDecoration: BoxDecoration(color: Colors.grey.shade100),
          selectedTextStyle: AppStyles.navigationStyleSelected
              .copyWith(fontSize: 12.sp, color: AppColors.primaryP3),
          textStyle:
              AppStyles.navigationStyleSelected.copyWith(fontSize: 12.sp),
        ),
        resultOptions: ResultOptions(
            isMarquee: true,
            placeholderTextStyle:
                AppStyles.dropDownMain.copyWith(color: AppColors.textColorT4),
            textStyle:
                AppStyles.dropDownMain.copyWith(color: AppColors.textColorT4),
            openBoxDecoration: BoxDecoration(
                color: AppColors.primaryP3,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(100.r)),
            boxDecoration: BoxDecoration(
                color: AppColors.primaryP3,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(100.r))),
        dropdownOptions: DropdownOptions(
          width: 150.w,
        ),

        dropdownList: list
            .map((e) => CoolDropdownItem(label: e.shopName!, value: e))
            .toList(),

        controller: controller,
        onChange: onChange,

        // hintText: 'Select job role',
        // items: list,
        // initialItem: list[0],
        // excludeSelected: false,
        // onChanged: debugPrint,
      ),
    );
  }
}
