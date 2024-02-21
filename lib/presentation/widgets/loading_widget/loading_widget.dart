import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickprism/core/colors/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class AppLoadingWidget extends StatelessWidget {
  const AppLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(
          5,
          (index) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                child: Row(
                  children: [
                    Shimmer.fromColors(
                        baseColor: AppColors.shimmerGrey,
                        highlightColor: AppColors.white,
                        child: Container(
                          height: 40.w,
                          width: 40.w,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5.r)),
                        )),
                    24.horizontalSpace,
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Shimmer.fromColors(
                            baseColor: AppColors.shimmerGrey,
                            highlightColor: AppColors.white,
                            child: Container(
                              height: 15.h,
                              width: 200.w,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5.r)),
                            )),
                        5.verticalSpace,
                        Shimmer.fromColors(
                            baseColor: AppColors.shimmerGrey,
                            highlightColor: AppColors.white,
                            child: Container(
                              height: 10.h,
                              width: 100.w,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5.r)),
                            )),
                        5.verticalSpace,
                        Shimmer.fromColors(
                            baseColor: AppColors.shimmerGrey,
                            highlightColor: AppColors.white,
                            child: Container(
                              height: 5.h,
                              width: 150.w,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5.r)),
                            )),
                      ],
                    ),
                  ],
                ),
              )),
    );
  }
}
