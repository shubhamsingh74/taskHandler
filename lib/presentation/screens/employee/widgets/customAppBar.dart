import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickprism/core/assets/assets.dart';
import 'package:quickprism/core/styles/app_styles.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key,  this.onTap});
  final VoidCallback? onTap;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        InkWell(
          splashFactory: NoSplash.splashFactory,
          onTap: widget.onTap,
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(100),
            color: Colors.transparent,
            shadowColor: const Color(0xff09707E),
            child: Container(
              padding: const EdgeInsets.all(7),
              decoration: const BoxDecoration(
                  color: Color(0xff09707E),
                  shape: BoxShape.circle),
              child: Image.asset(
                AppAssets.iconsMenuss,
                height: 20,
                width: 22,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        0.02.sw.horizontalSpace,
        Text(
          "QuickPrism",
          style: AppStyles.activeTabStyle.copyWith(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: const Color(0xff080434)),
        ),
        const Spacer(),
        Stack(
          alignment: Alignment.topRight,
          children: [
            Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(100),
              color: Colors.transparent,
              shadowColor: const Color(0xff09707E),
              child: Container(
                padding: const EdgeInsets.all(7),
                decoration: const BoxDecoration(
                    color: Color(0xff09DDFA),
                    shape: BoxShape.circle),
                child: Image.asset(
                  AppAssets.iconsNotify,
                  height: 20,
                  width: 25,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              right: 4,
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(100.r),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
