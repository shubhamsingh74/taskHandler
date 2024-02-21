import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickprism/application/providers.dart';
import 'package:quickprism/core/themes/app_themes.dart';
import 'package:quickprism/infrastructure/routing/app_router.dart';

import 'core/utils/utils.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRouter});

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      child: MultiBlocProvider(
        providers: AppBlocProviders.providers,
        child: MaterialApp.router(
          scaffoldMessengerKey: scaffoldKey,
          routerConfig: appRouter.config(),
          // routerDelegate: _appRouter.delegate(),
          debugShowCheckedModeBanner: false,
          title: 'quickprism',
          theme: Themes.themeData,
        ),
      ),
    );
  }
}
