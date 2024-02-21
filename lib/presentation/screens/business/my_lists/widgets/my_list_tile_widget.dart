import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickprism/core/assets/assets.dart';
import 'package:quickprism/core/colors/app_colors.dart';
import 'package:quickprism/core/styles/app_styles.dart';
import 'package:quickprism/domain/stocks/models/mylist_details/mylist_details_model.dart';
import 'package:quickprism/presentation/widgets/network_image_widget/network_image_widget.dart';
import 'package:quickprism/presentation/widgets/svg_icon_widget/svg_icon_widget.dart';

class MyListItemTile extends StatelessWidget {
  const MyListItemTile({super.key, required this.item, required this.onTap});
  final MyListDetailsData item;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 1.sw,
        color: AppColors.white,
        // decoration: const BoxDecoration(color: AppColors.supportSP3),
        child: Row(
          children: [
            AppNetWorkImageWidget(
              rawSize: 32,
              imageUrl: "https://plus.unsplash.com/premium_photo-1672912260181-95b481639974?q=80&w=2832&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
              // imageUrl: "item.imageUrl!",
            ),
            8.horizontalSpace,
            Flexible(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          item.itemName!,
                          style: AppStyles.tileStyleTitle,
                        ),
                        const Spacer(),
                        SizedBox(
                          width: 93.w,
                          child: Text(
                            ' ',
                            // '${item.totalQuantity} units ',
                            textAlign: TextAlign.right,
                            style: AppStyles.tileStyleTitle,
                          ),
                        ),
                      ],
                    ),
                    4.verticalSpace,
                    //availability
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Spacer(),
                        ListTileStarWidget(
                            rating: item.rating?.floorToDouble().toInt() ?? 0),
                      ],
                    ),
                    1.verticalSpace,
                    //availability
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListTileStarWidget extends StatelessWidget {
  const ListTileStarWidget({super.key, required this.rating});
  final int rating;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 15.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: rating,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return const AppSvgIconWidget(
            iconPath: AppAssets.starIcon,
            color: AppColors.storeColor2,
          );
        },
      ),
    );

    // Row(
    //   children: [
    //     const AppSvgIconWidget(
    //       iconPath: AppAssets.starIcon,
    //       color: AppColors.storeColor2,
    //     ),
    //     2.horizontalSpace,
    //     const AppSvgIconWidget(
    //       iconPath: AppAssets.starIcon,
    //       color: AppColors.storeColor2,
    //     ),
    //     2.horizontalSpace,
    //     const AppSvgIconWidget(
    //       iconPath: AppAssets.starIcon,
    //       color: AppColors.storeColor2,
    //     ),
    //     2.horizontalSpace,
    //     const AppSvgIconWidget(
    //       iconPath: AppAssets.starIcon,
    //       color: AppColors.storeColor2,
    //     ),
    //     2.horizontalSpace,
    //     const AppSvgIconWidget(
    //       iconPath: AppAssets.starIcon,
    //       color: AppColors.storeColor2,
    //     ),
    //   ],
    // );
  }
}
