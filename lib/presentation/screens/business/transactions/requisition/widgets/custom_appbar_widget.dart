import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickprism/core/assets/assets.dart';
import 'package:quickprism/core/colors/app_colors.dart';
import 'package:quickprism/core/styles/app_styles.dart';
import 'package:quickprism/presentation/widgets/svg_icon_widget/svg_icon_widget.dart';


///-------appbar for this screen.
customAppBarStaffManagement({required BuildContext context}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(100.r),
        shadowColor: Colors.blue.withOpacity(0.8),
        child: Container(
          padding: EdgeInsets.all(8.sp),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xff125D99),
          ),
          child: AppSvgIconWidget(
            iconPath: AppAssets.imageAppBarLines,
            size: 50,
            color: Colors.white,
            onTap: () {},
          ),
        ),
      ),
      10.horizontalSpace,
      Text(
        "B-Name",
        style: AppStyles.createITemTitleSTyle.copyWith(
            fontWeight: FontWeight.w700,
            fontSize: 25,
            color: const Color(0xff2E4251)),
      ),
      const Spacer(),
      InkWell(
        splashFactory: NoSplash.splashFactory,
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: AppColors.itemstoreColor2, width: 1)),
          child: Row(
            children: [
              const AppSvgIconWidget(
                iconPath: AppAssets.storeIcon,
                size: 15,
                color: AppColors.storeColor1,
              ),
              Text(
                "Store1",
                style: AppStyles.storeTitle,
              ),
              15.horizontalSpace,
              const AppSvgIconWidget(
                iconPath: AppAssets.iconsDown,
                size: 10,
              )
            ],
          ),
        ),
      ),
      10.horizontalSpace,
      InkWell(
          onTap: () {},
          splashFactory: NoSplash.splashFactory,
          child: const CircleAvatar(
            radius: 15,
            backgroundImage: AssetImage(
              AppAssets.imageGirlImage,
            ),
          )),
      // AppSvgIconWidget(
      //   onTap: () {},
      //   iconPath: AppAssets.iconsSetting,
      //   size: 24,
      //   color: Colors.black45,
      // )
    ],
  );
}