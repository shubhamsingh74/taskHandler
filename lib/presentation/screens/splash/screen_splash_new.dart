import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quickprism/core/assets/assets.dart';
import 'package:quickprism/core/styles/app_styles.dart';
import 'package:quickprism/core/utils/extensions.dart';
import 'package:quickprism/infrastructure/auth/auth_service.dart';
import 'package:quickprism/infrastructure/routing/app_router.dart';
import 'package:quickprism/presentation/screens/employee/screen_employee_home.dart';

@RoutePage()
class ScreenSplashNew extends StatelessWidget {
  const ScreenSplashNew({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startNavigation(context);
    });

    return Scaffold(
      //backgroundColor: const Color(0xff5E3A68),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              Image.asset(
                AppAssets.iconsNewBack,
                height: 1.sh,
                width: 1.sw,
                fit: BoxFit.fill,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AppAssets.iconsAppLogo,
                height: 17,
                width: 32,
                fit: BoxFit.fill,
              ),
              0.035.sw.horizontalSpace,
              Text(
                "QuickPrism",
                style: AppStyles.splashText,
              ),
            ],
          )
        ],
      ),
    );
  }

  void _startNavigation(BuildContext context) async {
    var authService = AuthService();
    //function to check the login state here
    //assign route respect to state
    var authRoute = RouteSignUpNew(authType: 'login');
    var homeRoute = RouteBusinessHome();

    ///--just for the easy development part correct it after the things are sorted
    // var authRoute =  RouteUserSelectionNew(phoneNumber: '1234567890');
    //var authRoute =  RouteOtpNew(phoneNumber: '1234567890', authType: 'login');
    // var authRoute = const RouteCreateItemNew();
    // var homeRoute =  const RouteCreateItemNew();

// user type is save where user select its type/role

    var userId = await authService.getUserId();
    var userType = await authService.getUserType();
    userType.toString().log("typee");
    await Future.delayed(const Duration(seconds: 3));
    if (context.mounted) {
      if (userId != null) {
        // context.router.replace(employeeRoute);
        // context.router.replace(homeRoute);
        switch (userType) {
          case "business":
            // () {
            //   context.router.replaceAll([RouteBusinessHome()]);
            // };
            context.router.replaceAll([RouteBusinessHome()]);
          case "employee":
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CustomBottomBar(),
                ));
          case "customer":
            break;
          default: //ScreenUserSelectionNew
            context.router.replaceAll([RouteUserSelectionNew(phoneNumber: "")]);
          // Utils.errorToast(context, "Please select role");
        }
      } else {
        context.router.replace(authRoute);
      }
    }
  }
}
