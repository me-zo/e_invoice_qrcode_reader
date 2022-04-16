import 'package:flutter/material.dart';

import 'home/presentation/home_controller.dart';


class RouteGenerator {
  // RouteGenerator({required this.settingsController});

  Route? call(RouteSettings routeSettings) {
    return MaterialPageRoute<void>(
      settings: routeSettings,
      builder: (BuildContext context) {
        switch (routeSettings.name) {
          default:
            return const HomeController();
        }
      },
    );
  }
}
