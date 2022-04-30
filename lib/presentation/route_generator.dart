import 'package:e_invoice_qrcode_reader/presentation/history/presentation/history_page.dart';
import 'package:flutter/material.dart';

import 'home/presentation/home_page.dart';

class RouteGenerator {
  Route? call(RouteSettings routeSettings) {
    return MaterialPageRoute<void>(
      settings: routeSettings,
      builder: (BuildContext context) {
        switch (routeSettings.name) {
          case HistoryPage.routeName:
            return const HistoryPage();
          default:
            return const HomePage();
        }
      },
    );
  }
}
