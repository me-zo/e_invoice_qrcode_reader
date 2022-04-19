import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../core/localization/app_localization.dart';
import '../core/localization/language_notifier.dart';
import '../presentation/home/presentation/manager/home_cubit.dart';
import '../presentation/home/presentation/widgets/splash_page.dart';
import '../presentation/route_generator.dart';
import '../main.dart';
import 'app_theme/app_theme.dart';

/// The Widget that configures your application.
class MyApp extends StatefulWidget {
  const MyApp({
    Key? key,
    // required this.settingsController,
    required this.currentLocale,
  }) : super(key: key);

  //final SettingsController settingsController;
  final AppLanguage currentLocale;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => widget.currentLocale,
      child: Consumer<AppLanguage>(
        builder: (context, model, child) {
          // return AnimatedBuilder(
          //   animation: widget.settingsController,
          //   builder: (BuildContext context, Widget? child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<HomeCubit>(
                create: (context) => sl<HomeCubit>(),
              ),
            ],
            child: MaterialApp(
              builder: (context, widget) => ResponsiveWrapper.builder(
                ClampingScrollWrapper.builder(context, widget!),
                breakpoints: const [
                  ResponsiveBreakpoint.resize(400,
                      name: MOBILE, scaleFactor: 1),
                  ResponsiveBreakpoint.resize(800,
                      name: TABLET, scaleFactor: 1.4),
                ],
              ),
              debugShowCheckedModeBanner: false,
              restorationScopeId: 'app',
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale("en"),
                //Locale("ar") // English, no country code
              ],
              localeResolutionCallback: (locale, supportedLocales) {
                for (var supportedLocale in supportedLocales) {
                  if (supportedLocale.languageCode == locale!.languageCode) {
                    return supportedLocale;
                  }
                }
                return supportedLocales.first;
              },
              theme: AppTheme.darkTheme,
              darkTheme: AppTheme.darkTheme,
              onGenerateRoute: RouteGenerator(),
              home: const SplashScreen(),
            ),
          );
        },
      ),
    );
  }
}
