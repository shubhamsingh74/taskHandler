// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:quickprism/core/colors/app_colors.dart';
import 'package:quickprism/core/styles/app_styles.dart';
import 'package:quickprism/presentation/widgets/appbar/main_appbar.dart';
import 'package:quickprism/presentation/widgets/button/primary_button.dart';

@RoutePage()
class ScreenStockInvoice extends StatefulWidget {
  Widget? child;
  ScreenStockInvoice({
    Key? key,
    this.child,
  }) : super(key: key);
  @override
  State<ScreenStockInvoice> createState() => _ScreenStockInvoiceState();
}

class _ScreenStockInvoiceState extends State<ScreenStockInvoice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: 'Invoice', context: context),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              color: AppColors.textColorT2,
              margin: EdgeInsets.all(16.w),
              child: widget.child,
            ),
          ),
          16.verticalSpace,
          Container(
            height: 50.h,
            width: 1.sw,
            color: AppColors.supportSP4,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                shareIconWidget(icon: Icons.download, label: 'Download'),
                shareIconWidget(icon: Icons.share, label: 'Share'),
                shareIconWidget(icon: Icons.print, label: 'Print'),
                shareIconWidget(icon: Icons.message, label: 'Whatsapp'),
              ],
            ),
          ),
          24.verticalSpace,
          AppPrimaryButton(
            label: 'Done',
            onTap: () {
              context.router.pop();
            },
          ),
          24.verticalSpace,
        ],
      ),
    );
  }

  shareIconWidget({required String label, required IconData icon}) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 15.sp,
            color: AppColors.oldPrimaryP2,
          ),
          2.horizontalSpace,
          Text(
            label,
            style:
                AppStyles.subHeading12.copyWith(color: AppColors.oldPrimaryP2),
          ),
        ],
      );
}
