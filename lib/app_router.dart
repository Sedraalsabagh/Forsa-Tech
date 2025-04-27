import 'package:devloper_app/presentaion/screen/searchJobScreen.dart';

import 'package:flutter/material.dart';
import 'presentaion/screen/logIn.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const Searchjobscreen(),
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
