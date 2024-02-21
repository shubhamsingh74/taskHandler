import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/colors/app_colors.dart';
import '../../../../../core/styles/app_styles.dart';
import '../../../../widgets/button/bottom_navigation_bar.dart';
import '../../../../widgets/form_fields/normal_text_field.dart';

class PaymentReferenceBottomSheet extends StatelessWidget {
  const PaymentReferenceBottomSheet({
    super.key,
    required this.notesReferenceNoController,
    required this.paymentType,
  });

  final TextEditingController notesReferenceNoController;
  final String paymentType;

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          24.h.verticalSpace,
          const Row(
            children: [
              Spacer(),
              CloseButton(),
            ],
          ),
          Text(
            '$paymentType Notes / reference No',
            style: AppStyles.inter18600T1,
          ),
          16.h.verticalSpace,
          Text('Please enter your notes or the payment reference',
              style: AppStyles.tileStyleGray),
          12.h.verticalSpace,
          Flexible(
            child: NormalTextField(
              label: "Notes/Ref No",
              hintText: "Notes/Ref No",
              controller: notesReferenceNoController,
            ),
          ),
          24.h.verticalSpace,
          Flexible(
              child: ButtonBottomNavigationBar(
            title: "Save",
            onTap: () {
              context.router.pop();
            },
          )),
        ],
      ),
    );
  }
}
