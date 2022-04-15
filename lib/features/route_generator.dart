import 'package:flutter/material.dart';

import 'home/presentation/home_page.dart';
import 'home/presentation/widgets/unimplemented_page.dart';


class RouteGenerator {
  // RouteGenerator({required this.settingsController});

  Route? call(RouteSettings routeSettings) {
    return MaterialPageRoute<void>(
      settings: routeSettings,
      builder: (BuildContext context) {
        switch (routeSettings.name) {
          case UnImplementedPage.routeName:
            return const UnImplementedPage();
          default:
            return const HomePage();
        }
      },
    );
  }
}
