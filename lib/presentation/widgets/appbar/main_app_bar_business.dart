// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marquee/marquee.dart';
import 'package:shimmer/shimmer.dart';

import 'package:quickprism/domain/core/di/injectable.dart';
import 'package:quickprism/domain/user/user_constants.dart';
import 'package:quickprism/presentation/widgets/shop_dropdown/custom_shop_drop_down.dart';

import '../../../application/business/home/business_home/business_home_bloc.dart';
import '../../../core/assets/svg_canvas/app_bar_menu_icon.dart';
import '../../../core/colors/app_colors.dart';
import '../../../infrastructure/routing/app_router.dart';

class MainAppBarBusiness extends StatefulWidget implements PreferredSizeWidget {
  final bool isLoading;
  final String? businessName;
  final String? description;
  final List<Widget>? actions;
  final Function()? onProfileTap;
  MainAppBarBusiness({
    Key? key,
    required this.isLoading,
    this.businessName,
    this.description,
    this.actions,
    this.onProfileTap,
  })  : preferredSize = const Size.fromHeight(70),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  State<MainAppBarBusiness> createState() => _MainAppBarBusinessState();
}

class _MainAppBarBusinessState extends State<MainAppBarBusiness> {
  final BusinessHomeBloc homeBloc = getIt<BusinessHomeBloc>();

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: widget.preferredSize,
      child: widget.isLoading
          ? appbarLoadingWidget
          : Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    const Color(0xff1790F1).withOpacity(0.3),
                    const Color(0xff1790F1).withOpacity(0),
                    const Color(0xff1790F1).withOpacity(0),
                  ])),
              child: AppBar(
                shadowColor: Colors.transparent,
                forceMaterialTransparency: true,
                leading:
                    //
                    Builder(builder: (context) {
                  return

                      //
                      //     SizedBox(
                      //   height: 10,
                      //   width: 10,
                      //   child: Material(
                      //     elevation: 10,
                      //     borderRadius: BorderRadius.circular(20.r),
                      //     shadowColor: Colors.blue.withOpacity(0.8),
                      //     child: Container(
                      //       // padding: EdgeInsets.all(8.sp),
                      //       decoration: const BoxDecoration(
                      //         shape: BoxShape.circle,
                      //         color: Color(0xff125D99),
                      //       ),
                      //       // child: CustomPaint(
                      //       //   size: Size(20.w, 15.h),
                      //       //   painter: AppBarMenuIconPainter(),
                      //       // ),
                      //     ),
                      //   ),
                      // );
                      //
                      GestureDetector(
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 15.w),
                      width: 35.w,
                      height: 35.w,
                      decoration: const BoxDecoration(
                          color: Color(0xff125D99), shape: BoxShape.circle),
                      child: Center(
                        child: CustomPaint(
                          size: Size(20.w, 15.h),
                          painter: AppBarMenuIconPainter(),
                        ),
                      ),
                    ),
                  );
                }),
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                title: SizedBox(
                  width: 900,
                  height: 30,
                  child: Marquee(
                    // text: widget.businessName ?? " ",
                    text: UserConstants
                            .currentBusiness?.businessProfile?.businessName ??
                        " ",

                    style: TextStyle(
                      fontFamily: "Barlow",
                      fontWeight: FontWeight.w700,
                      fontSize: 25.sp,
                    ),
                    crossAxisAlignment: CrossAxisAlignment.start,
                    blankSpace: 50.0,
                    velocity: 50.0, //speed
                    pauseAfterRound: const Duration(seconds: 10),
                    startPadding: 0.0.w,
                    accelerationDuration: const Duration(seconds: 1),
                    accelerationCurve: Curves.linear,
                    decelerationDuration: const Duration(milliseconds: 500),
                    decelerationCurve: Curves.easeOut,
                  ),
                ),
                centerTitle: false,
                actions: [
                  ...widget.actions ??
                      [
                        CustomShopDropdown(
                          list: UserConstants.shops,
                          onChanged: (shop) {
                            setState(() {
                              homeBloc.add(BusinessHomeChangeShopEvent(
                                shop: shop!,
                              ));
                            });
                          },
                        ),
                        15.w.horizontalSpace,
                        InkWell(
                          onTap: () {
                            context.router.push(const RouteProfile());
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.black,
                            radius: 15.r,
                          ),
                        ),
                        20.w.horizontalSpace,
                      ],
                ],
              ),
            ),
    );
  }

  get appbarLoadingWidget => Center(
        child: Row(
          children: <Widget>[
            16.horizontalSpace,
            Shimmer.fromColors(
                baseColor: AppColors.shimmerGrey,
                highlightColor: AppColors.white,
                child: const Icon(Icons.menu)),
            16.horizontalSpace,
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Shimmer.fromColors(
                    baseColor: AppColors.shimmerGrey,
                    highlightColor: AppColors.white,
                    child: Container(
                      height: 20.h,
                      width: 150.w,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.r)),
                    )),
                5.verticalSpace,
                Shimmer.fromColors(
                    baseColor: AppColors.shimmerGrey,
                    highlightColor: AppColors.white,
                    child: Container(
                      height: 12.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.r)),
                    )),
              ],
            ),
            const Spacer(),
            Shimmer.fromColors(
              baseColor: AppColors.shimmerGrey,
              highlightColor: AppColors.white,
              child: CircleAvatar(
                radius: 15.r,
              ),
            ),
            16.horizontalSpace,
          ],
        ),
      );
}
