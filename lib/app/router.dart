import 'package:TimeTable/ui/views/home/home_view.dart';
import 'package:TimeTable/ui/views/introduction/intro_view.dart';
import 'package:TimeTable/ui/views/splash_screen/splash_screen.dart';
import 'package:TimeTable/ui/views/teachers/teacher_view.dart';
import 'package:flutter/material.dart';

abstract class Routes {
  static const startupViewRoute = '/startup';
  static const homeViewRoute = '/';
  static const teacherViewRoute = '/teacher';
  static const introViewRoute = '/intro';
  static const splashViewRoute = '/splashscreen';
}

class MainRouter {
  //static funtion that generates the routes
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.teacherViewRoute:
        return MaterialPageRoute(builder: (_) => TeacherView());

      case Routes.homeViewRoute:
        return MaterialPageRoute(builder: (_) => HomeView());

      case Routes.introViewRoute:
        return MaterialPageRoute(builder: (_) => IntroScreen());

      case Routes.splashViewRoute:
        return MaterialPageRoute(builder: (_) => SplashScreen());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text("No route defined for ${settings.name}"),
                  ),
                ));
    }
  }
}
