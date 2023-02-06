import 'package:flutter/material.dart';
import 'package:nectar_mac/Modules/log/presentation/Pages/splash/splash_screen.dart';

import 'not_found_page.dart';

part './route_pages.dart';

class Routes extends RoutePages {
  static MaterialPageRoute<dynamic> goTo(Widget page) => MaterialPageRoute(
        builder: (BuildContext context) {
          return page;
        },
      );

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case RoutePages.intial:
        return goTo(const SplashScreen());
      default:
        return goTo(const RouteNotFound());
    }
  }
}
