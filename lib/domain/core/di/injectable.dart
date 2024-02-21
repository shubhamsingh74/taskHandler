import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injectable.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
Future<void> configureInjection() async =>
    getIt.initGetIt(environment: Environment.prod);
