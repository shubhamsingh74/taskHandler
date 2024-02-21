import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickprism/core/assets/assets.dart';
import 'package:quickprism/core/colors/app_colors.dart';
import 'package:quickprism/core/styles/app_styles.dart';

///---------common item widget
customCommonItemWidget(
    {required String name,
    required String category,
    required String brand,
    required String unit,
    required String quantity}) {
  return Material(
    elevation: 10,
    shadowColor: Colors.blue.withOpacity(0.4),
    borderRadius: BorderRadius.circular(11.r),
    child: Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(11.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: AppStyles.inter60019242323,
                  ),
                  FittedBox(
                    child: Text(
                      "Category : $category",
                      style: AppStyles.inter50015474545,
                    ),
                  ),
                  Text(
                    "Brand : $brand",
                    style: AppStyles.inter50015474545,
                  ),
                  Text(
                    "Qty: $quantity , Unit: $unit",
                    style: AppStyles.inter50015474545,
                  ),
                ],
              ),
              Image.asset(
                AppAssets.imageBarCodeImage,
                height: 45.h,
                width: 45.w,
                fit: BoxFit.fill,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
