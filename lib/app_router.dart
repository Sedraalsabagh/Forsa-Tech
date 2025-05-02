import 'package:devloper_app/presentaion/screen/forsa_proflile.dart';
import 'package:devloper_app/presentaion/screen/searchJobScreen.dart';
import 'package:devloper_app/presentaion/screen/settingScreen.dart';
import 'package:devloper_app/presentaion/screen/welcomeScreen.dart';

import 'package:flutter/material.dart';
import 'presentaion/screen/logIn.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => Welcomescreen(),
        );

      case '/auth/login/':
        return MaterialPageRoute(
          builder: (context) => const LogIn(),
        );

      default:
        return null;
    }
  }
}
