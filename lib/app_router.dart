import 'package:devloper_app/presentaion/screen/forsa_proflile.dart';
import 'package:devloper_app/presentaion/screen/searchJobScreen.dart';
import 'package:devloper_app/presentaion/screen/settingScreen.dart';
import 'package:devloper_app/presentaion/screen/welcomeBot.dart';
import 'package:devloper_app/presentaion/screen/widget/Forsa_Details.dart';

import 'presentaion/screen/widget/bouttom_navigation.dart';

import 'package:flutter/material.dart';
import 'presentaion/screen/logIn.dart';
import 'presentaion/screen/welcomeScreen.dart';
import 'presentaion/screen/widget/bouttom_navigation.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => MenuScreen(),
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
