import 'package:flutter/material.dart';
import 'package:quickprism/app.dart';
import 'package:quickprism/domain/core/di/injectable.dart';
import 'package:quickprism/infrastructure/routing/app_router.dart';

const bool devMode = false;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();
  final AppRouter router = AppRouter();
  runApp(MyApp(
    appRouter: router,
  ));
}
