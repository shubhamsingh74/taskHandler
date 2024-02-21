import 'package:cool_dropdown/controllers/dropdown_controller.dart';
import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:cool_dropdown/models/cool_dropdown_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/colors/app_colors.dart';
import '../../../core/styles/app_styles.dart';

class AttendanceDropDown extends StatelessWidget {
  const AttendanceDropDown(
      {Key? key, required this.list, required this.controller})
      : super(key: key);
  final List list;

  final DropdownController controller;

  @override
  Widget build(BuildContext context) {
    var defaultShop = list[0];

    return SizedBox(
      width: 115.w,
      height: 32.h,
      child: CoolDropdown(
        defaultItem: CoolDropdownItem(
            label: "label",
            value: defaultShop,
            icon: Row(
              children: [
                Icon(Icons.store),
                4.w.verticalSpace,
                Text(
                  'Present',
                  style: AppStyles.tileStyleSubTitle,
                ),
                8.w.horizontalSpace,
              ],
            )),
        dropdownItemOptions: DropdownItemOptions(
            // selectedBoxDecoration: BoxDecoration(color: Colors.grey.shade100),
            // selectedTextStyle: AppStyles.navigationStyleSelected
            //     .copyWith(fontSize: 12.sp, color: AppColors.primaryP3),
            // textStyle:
            //     AppStyles.navigationStyleSelected.copyWith(fontSize: 12.sp),
            ),
        resultOptions: ResultOptions(
            // isMarquee: true,
            // placeholderTextStyle:
            //     AppStyles.dropDownMain.copyWith(color: AppColors.textColorT4),
            // textStyle:
            //     AppStyles.dropDownMain.copyWith(color: AppColors.textColorT4),
            // openBoxDecoration: BoxDecoration(
            //   border: Border.all(color: Colors.white),
            // ),
            // boxDecoration: BoxDecoration(
            //   color: AppColors.white,
            //   border: Border.all(color: AppColors.borderColorTextField),
            //   //borderRadius: BorderRadius.circular(100.r),
            // ),

            ),
        dropdownOptions: DropdownOptions(
          width: 150.w,
        ),

        dropdownList:
            list.map((e) => CoolDropdownItem(label: e, value: e)).toList(),

        controller: controller,
        onChange: (p0) {
          defaultShop = p0;
          print(p0);
        },

        // hintText: 'Select job role',
        // items: list,
        // initialItem: list[0],
        // excludeSelected: false,
        // onChanged: debugPrint,
      ),
    );
  }
}
