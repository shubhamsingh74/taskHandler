// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/colors/app_colors.dart';
import '../../../../../core/styles/app_styles.dart';

class SelectedItemDisplayTile extends StatelessWidget {
  const SelectedItemDisplayTile({
    Key? key,
    required this.quantity,
    required this.priceOfItem,
    required this.priceAfterTax,
    required this.itemName,
  }) : super(key: key);

  final int quantity;
  final double priceOfItem;
  final double priceAfterTax;
  final String itemName;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      margin: EdgeInsets.only(bottom: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "$itemName\n",
                  style: AppStyles.tileStyleTitle,
                ),
                TextSpan(
                  text: '$quantity x ₹$priceOfItem\n',
                  // '${currentBodyItem.quantity} x ₹${currentBodyItem.price}\n',
                  style: AppStyles.tileStyleGray,
                ),
                TextSpan(
                  text: '\n',
                  style: AppStyles.tileStyleGray,
                ),
                TextSpan(
                  text: 'Item sub-total',
                  style: AppStyles.inter14400T2,
                ),
              ],
            ),
          ),

          // ==
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: ' ${quantity * priceOfItem}\n',
                  // text: ' ${totalDiscountPrice.toStringAsFixed(2)}\n',
                  style: AppStyles.tileStyleGray,
                ),
                TextSpan(text: ' \n', style: AppStyles.tileStyleGray),
                // TextSpan(text: 'Tax: 10%\n', style: AppStyles.tileStyleGray),
                TextSpan(text: '\n', style: AppStyles.tileStyleGray),
                TextSpan(
                  text: '₹${priceAfterTax.toStringAsFixed(2)}',
                  style: AppStyles.inter14600T6,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
