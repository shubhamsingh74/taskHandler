import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../application/business/business_create_item/business_create_item_bloc.dart';
import '../../../../../core/styles/app_styles.dart';

class ItemDetailCard extends StatelessWidget {
    final BusinessCreateItemState state;

  const ItemDetailCard({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      color: Colors.white,
      shadowColor: Colors.grey,
      borderRadius: BorderRadius.circular(15.r),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(state.name, style: AppStyles.addunitsTitle),
                    7.horizontalSpace,
                    Text("HSN/SAC Code : ${state.hsnSecCode}", style: AppStyles.addunitsSubTitle),
                  ],
                ),
                2.verticalSpace,
                Text("Item code : ${state.code}",
                    style: AppStyles.addunitsSubTitle),
                2.verticalSpace,
                Text("Category : ${state.category}",
                    style: AppStyles.addunitsSubTitle),
                2.verticalSpace,
                Text("Brand : ${state.brand}",
                    style: AppStyles.addunitsSubTitle),
                2.verticalSpace,
                2.verticalSpace,
                // Text("Pu : ${state.purchasingUnits.first}",
                //     style: AppStyles.addunitsSubTitle),
                // 2.verticalSpace,
              ],
            ),
            const Spacer(),
            // InkWell(
            //   splashFactory: NoSplash.splashFactory,
            //   onTap: () {},
            //   child: Image.asset(
            //     AppAssets.iconsBarCode,
            //     height: 52,
            //     width: 50,
            //   ),
            // ),
            5.horizontalSpace,
          ],
        ),
      ),
    );
  }
}
