// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickprism/application/business/business_profile_home/business_profile_home_bloc.dart';

import 'package:quickprism/core/assets/assets.dart';
import 'package:quickprism/core/colors/app_colors.dart';
import 'package:quickprism/domain/core/di/injectable.dart';
import 'package:quickprism/domain/user/models/user_model.dart';
import 'package:quickprism/domain/user/user_constants.dart';
import 'package:quickprism/infrastructure/routing/app_router.dart';
import 'package:quickprism/presentation/screens/profile/screen_staff_management_new.dart';
import 'package:quickprism/presentation/widgets/svg_icon_widget/svg_icon_widget.dart';

import '../../../core/styles/app_styles.dart';
  
@RoutePage()
class ScreenProfile extends StatelessWidget {
  const ScreenProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = getIt<BusinessProfileHomeBloc>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      bloc.add(BusinessProfileHomeInitialEvent());
    });
    return BlocConsumer<BusinessProfileHomeBloc, BusinessProfileHomeState>(
      listenWhen: (prev, current) =>
          (current is BusinessProfileHomeActionState),
      buildWhen: (prev, current) =>
          (current is! BusinessProfileHomeActionState),
      bloc: bloc,
      listener: (context, state) {
        if (state is BusinessProfileHomeLogOutState) {
          context.router.replaceAll([RouteSplashNew()]);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Profile",
              style: AppStyles.appBar,
            ),
            backgroundColor: AppColors.white,
          ),
          body: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                color: AppColors.white,
                child: SafeArea(
                  child: Column(
                    children: [
                      30.h.verticalSpace,
                      //  profile pic name qr code

                      // state.user.data!.businessDetails != null
                      //     ? ProfilePicNameQrInfo(
                      //         businessDetails:
                      //             state.user.data!.businessDetails!)
                      //     : 1.horizontalSpace,

                      ProfilePicNameQrInfo(
                          businessDetails: state.user!.data!.businessDetails)
                      //
                    ],
                  ),
                ),
              ),
              26.h.verticalSpace,
              ProfileInfoItem(
                title: 'My business profile',
                iconPath: AppAssets.myBusinessProfile,
                isError: state.isProfilePending!,
                onTap: () async {
                  await context.router
                      .push(RouteMyBusinessProfile())
                      .then((value) {
                    bloc.add(BusinessProfileHomeInitialEvent());
                  });
                },
              ),
              ProfileInfoItem(
                title: 'Business management',
                iconPath: AppAssets.storeIcon,
                // RouteBusinessManagement
                isError: state.isBManagementPending!,

                onTap: () async {
                  await context.router
                      .push(RouteBusinessManagementStoreList())
                      .then((value) {
                    bloc.add(BusinessProfileHomeInitialEvent());
                  });
                },
              ),
              ProfileInfoItem(
                title: 'Bank account',
                iconPath: AppAssets.bankAccount,
                onTap: () async {
                  await context.router.push(RouteBankAccount()).then((value) {
                    bloc.add(BusinessProfileHomeInitialEvent());
                  });
                },
              ),
              //    AppAssets.notifications,AppAssets.settings,

              ProfileInfoItem(
                title: 'Staff management',
                iconPath: AppAssets.staffManagement,
                isError: state.isSManagementPending!,
                onTap: () async {
                  await context.router
                      .push(RouteStaffManagement())
                      .then((value) {
                    bloc.add(BusinessProfileHomeInitialEvent());
                  });
                },
              ),
              ///----just to check the UI for testing
              ProfileInfoItem(
                title: 'Staff management (New Design)',
                iconPath: AppAssets.staffManagement,
                isError: state.isSManagementPending!,
                onTap: () {
                  ///----just to testing purpose
                  Navigator.push(context,MaterialPageRoute(builder: (context) => ScreenStaffManagementNew(),));
                },
              ),
              ProfileInfoItem(
                title: 'Notifications',
                iconPath: AppAssets.notifications,
              ),
              ProfileInfoItem(
                title: 'Settings',
                iconPath: AppAssets.settings,
              ),
              ProfileInfoItem(
                title: 'Log Out',
                iconPath: AppAssets.power,
                iconColor: AppColors.textColorRed,
                onTap: () {
                  bloc.add(BusinessProfileHomeLogOutEvent());
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class ProfileInfoItem extends StatelessWidget {
  final String title;
  final String iconPath;
  final bool isError;
  final VoidCallback? onTap;
  final Color? iconColor;

  const ProfileInfoItem({
    Key? key,
    required this.title,
    required this.iconPath,
    this.isError = false,
    this.onTap,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 60.h,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            left: BorderSide(color: AppColors.supportUI6),
            top: BorderSide(color: AppColors.supportUI6),
            right: BorderSide(color: AppColors.supportUI6),
            bottom: BorderSide(width: 1, color: AppColors.supportUI6),
          ),
        ),
        child: Row(
          children: [
            AppSvgIconWidget(
              iconPath: iconPath,
              color: iconColor ?? AppColors.primaryP2,
            ),
            8.w.horizontalSpace,
            Text(
              title,
              style: TextStyle(
                color: Color(0xFF3D3D3D),
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
            ),
            8.w.horizontalSpace,
            if (isError == true)
              AppSvgIconWidget(
                iconPath: AppAssets.alertTriangle,
                color: AppColors.textColorRed,
              ),
            Spacer(),
            AppSvgIconWidget(iconPath: AppAssets.forwardArrowIcon)
          ],
        ),
      ),
    );
  }
}

class ProfilePicNameQrInfo extends StatelessWidget {
  const ProfilePicNameQrInfo({
    super.key,
    required this.businessDetails,
  });
  final BusinessDetails? businessDetails;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                Center(
                  child: SizedBox(
                    width: 48.w,
                    height: 48.w,
                    child: CircularProgressIndicator(
                      strokeWidth: 3.w,
                      value: UserConstants.getCompletedProfilePercentage / 100,
                      semanticsLabel: '80',
                      semanticsValue: '80',
                      color: AppColors.primaryP1,
                    ),
                  ),
                ),
                Container(
                  width: 48.w,
                  height: 48.w,
                  padding: EdgeInsets.all(3.w),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(AppAssets.profile),
                )
              ],
            ),
            4.verticalSpace,
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${UserConstants.getCompletedProfilePercentage}',
                  style: AppStyles.inter12400T2.copyWith(
                    fontSize: 10.sp,
                    color: AppColors.secondary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '%',
                  style: AppStyles.inter12400T2.copyWith(
                    fontSize: 8.sp,
                    color: AppColors.secondary,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            )
          ],
        ),
        //
        8.w.horizontalSpace,
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              businessDetails?.businessProfile?.businessName ?? 'Business name',
              style: AppStyles.inter16600T1.copyWith(
                color: businessDetails == null
                    ? AppColors.textColorT3
                    : AppColors.textColorT1,
                fontSize: businessDetails == null ? 16.sp : 18.sp,
              ),
            ),
            //
            Text(
              'QPID: ${UserConstants.currentUser!.data!.userId!}',
              style: AppStyles.inter12400T2,
            ),
            Text(
              UserConstants.getCompletedProfilePercentage < 100
                  ? 'Weak profile'
                  : 'Strong profile',
              style: AppStyles.inter12400T2.copyWith(fontSize: 10.sp),
            ),
          ],
        ),
        Spacer(),
        Container(
          width: 70.w,
          height: 70.w,
          decoration: ShapeDecoration(
            color: AppColors.supportSP4,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.r)),
          ),
        )
      ],
    );
  }
}
