 import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickprism/presentation/widgets/button/bottom_navigation_bar.dart';

import '../../../../../core/colors/app_colors.dart';
import '../../../../../core/styles/app_styles.dart';
import '../../../../widgets/form_fields/normal_text_field.dart';

class AdditionalDiscountBottomSheet extends StatelessWidget {
  const AdditionalDiscountBottomSheet({
    super.key,
    required this.additionalDiscountController,
    required this.onTapSave,
    required this.onTapClose,
    required this.additionalDiscountTypeIsPercentageController,
  });

  final TextEditingController additionalDiscountController;
  final TextEditingController additionalDiscountTypeIsPercentageController;
  final void Function()? onTapSave;
  final void Function()? onTapClose;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w).copyWith(top: 8.h),
      width: double.infinity,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () async {
              await showModalBottomSheet(
                scrollControlDisabledMaxHeightRatio: 0.4,
                context: context,
                builder: (context) {
                  return StatefulBuilder(
                    builder: (context, sheetSetState) {
                      return Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        decoration: const BoxDecoration(color: AppColors.white),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            10.h.verticalSpace,
                            Row(
                              children: [
                                const Spacer(),
                                CloseButton(onPressed: onTapClose)
                              ],
                            ),
                            Text('Add Additional discount on total bill',
                                style: AppStyles.inter18600T1),
                            16.h.verticalSpace,
                            // NormalTextField(controller: additionalDiscountController,),
                            16.h.verticalSpace,
                            NormalTextField(
                              controller: additionalDiscountController,
                              maxLength:
                                  additionalDiscountTypeIsPercentageController
                                          .text
                                          .contains("true")
                                      ? 2
                                      : null,
                              suffix: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  _additionalDiscountType(
                                      onTap: () {
                                        sheetSetState(() {
                                          // isDiscountInPercentage =
                                          //     !isDiscountInPercentage;
                                          // additionalDiscountTypeIsPercentageController
                                          //         .text =
                                          //     isDiscountInPercentage.toString();
                                          additionalDiscountTypeIsPercentageController
                                              .text = "false";
                                          additionalDiscountController.clear();
                                        });
                                      },
                                      isDiscountInPercentage:
                                          // false,
                                          additionalDiscountTypeIsPercentageController
                                              .text
                                              .contains("true"),
                                      title: "Rupee"),
                                  _additionalDiscountType(
                                      onTap: () {
                                        sheetSetState(() {
                                          additionalDiscountTypeIsPercentageController
                                              .text = "true";
                                          additionalDiscountController.clear();
                                        });
                                      },
                                      isDiscountInPercentage:
                                          // true,
                                          !additionalDiscountTypeIsPercentageController
                                              .text
                                              .contains("true"),
                                      title: "Percentage"),
                                  8.w.horizontalSpace,
                                ],
                              ),
                            ),
                            30.h.verticalSpace,
                            ButtonBottomNavigationBar(
                              title: "Save",
                              onTap: onTapSave,
                            )
                          ],
                        ),
                      );
                    },
                  );
                },
              );
            },
            child: Text(
                '+ Additional discount ₹${additionalDiscountController.text}',
                style: AppStyles.styleInter14500T7),
          ),
          10.h.verticalSpace,
        ],
      ),
    );
  }
}

Widget _additionalDiscountType(
    {required bool isDiscountInPercentage,
    required String title,
    required VoidCallback onTap}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      width: 90.w,
      padding: EdgeInsets.symmetric(vertical: 10.w),
      decoration: BoxDecoration(
          color:
              //
              isDiscountInPercentage
                  ? AppColors.supportUI6
                  : AppColors.primaryP2,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(4.r),
            bottomLeft: Radius.circular(4.r),
          ),
          border: Border.all(
              color:
                  //
                  isDiscountInPercentage
                      ? AppColors.borderColorTextField
                      : AppColors.primaryP2,
              width: 1)),
      child: Center(
        child: Text(title,
            style: AppStyles.inter12400T1.copyWith(
                color:
                    //
                    isDiscountInPercentage
                        ? AppColors.textColorT2
                        : AppColors.white)),
      ),
    ),
  );
}
