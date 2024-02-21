import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:cool_dropdown/models/cool_dropdown_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickprism/core/colors/app_colors.dart';
import 'package:quickprism/domain/stocks/models/category/category_model.dart';

import '../../../../../core/styles/app_styles.dart';

class CategoryDropDown extends StatelessWidget {
  const CategoryDropDown(
      {Key? key,
      required this.list,
      required this.controller,
      required this.onChange})
      : super(key: key);
  final List<CategoryData> list;
  final DropdownController controller;
  final Function(CategoryData) onChange;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: CoolDropdown(
        defaultItem: list.isNotEmpty
            ? CoolDropdownItem(label: list[0].name, value: list[0])
            : null,

        dropdownItemOptions: DropdownItemOptions(
          selectedBoxDecoration: BoxDecoration(color: Colors.grey.shade100),
          selectedTextStyle: AppStyles.navigationStyleSelected
              .copyWith(fontSize: 12.sp, color: AppColors.primaryP3),
          textStyle:
              AppStyles.navigationStyleSelected.copyWith(fontSize: 12.sp),
        ),
        resultOptions: ResultOptions(
            isMarquee: true,
            placeholderTextStyle: AppStyles.dropDownMain,
            textStyle: AppStyles.dropDownMain,
            openBoxDecoration: BoxDecoration(
                color: AppColors.supportSP4,
                border: Border.all(
                  color: AppColors.supportSP4,
                ),
                borderRadius: BorderRadius.circular(100.r)),
            boxDecoration: BoxDecoration(
                color: AppColors.supportSP4,
                border: Border.all(
                  color: AppColors.supportSP4,
                ),
                borderRadius: BorderRadius.circular(100.r))),
        dropdownOptions: DropdownOptions(
          width: 150.w,
        ),

        dropdownList:
            list.map((e) => CoolDropdownItem(label: e.name, value: e)).toList(),

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
