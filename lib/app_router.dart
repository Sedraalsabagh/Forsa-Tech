import 'package:devloper_app/presentaion/screen/EducationFormScreen.dart';
import 'package:devloper_app/presentaion/screen/ExperienceForm.Screen.dart';
import 'package:devloper_app/presentaion/screen/experience_screen.dart';
import 'package:devloper_app/presentaion/screen/forsa_proflile.dart';
import 'package:devloper_app/presentaion/screen/language.dart';
import 'package:devloper_app/presentaion/screen/quiz_screen.dart';
import 'package:devloper_app/presentaion/screen/searchJobScreen.dart';
import 'package:devloper_app/presentaion/screen/settingScreen.dart';
import 'package:devloper_app/presentaion/screen/welcomeScreen.dart';
import 'package:devloper_app/presentaion/screen/widget/experience_form.dart';
import 'package:flutter/material.dart';
import 'presentaion/screen/FQA.dart';
import 'presentaion/screen/logIn.dart';
import 'presentaion/screen/needhelp.dart';
import 'presentaion/screen/settings.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => QuizScreen(),
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
