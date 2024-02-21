import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickprism/core/assets/assets.dart';
import 'package:quickprism/infrastructure/auth/auth_service.dart';
import 'package:quickprism/infrastructure/routing/app_router.dart';

@RoutePage()
class ScreenSplash extends StatelessWidget {
  const ScreenSplash({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startNavigation(context);
    });

    return Scaffold(
      body: Center(
        child: Image.asset(
          AppAssets.logo,
          height: 100.w,
        ),
      ),
    );
  }

  void _startNavigation(BuildContext context) async {
    var authService = AuthService();
    //todo
    //function to check the login state here
    //assign route respect to state
    // var authRoute = const RouteSignupOrLogin();
    // var homeRoute =  RouteBusinessHome();

    ///--just for the easy development part correct it after the things are sorted
    var authRoute = const RouteCreateItemNew();
    var homeRoute =  const RouteCreateItemNew();

    var userId = await authService.getUserId();
    await Future.delayed(const Duration(seconds: 3));
    if (context.mounted) {
      if (userId != null) {
        context.router.replace(homeRoute);
      } else {
        context.router.replace(authRoute);
      }
    }
  }
}
