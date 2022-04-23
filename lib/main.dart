import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'app/app.dart';
import 'core/dependency_registrar/dependencies.dart';
import 'core/localization/language_notifier.dart';

final sl = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initDependencies(sl);

  AppLanguage appLanguage = AppLanguage();

  //TODO: REMOVE IN PRODUCTION (for overriding http certificates)
  HttpOverrides.global = MyHttpOverrides();
  runApp(
    MyApp(
      currentLocale: appLanguage,
      //settingsController: settingsController,
    ),
  );
}

// TODO: REMOVE IN PRODUCTION (for overriding http certificates)
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
