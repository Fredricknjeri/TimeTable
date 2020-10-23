import 'package:TimeTable/ui/views/add_calender/add_calender.dart';
import 'package:TimeTable/ui/views/class/add_class/add_class.dart';
import 'package:TimeTable/ui/views/class/add_class/add_event.dart';
import 'package:TimeTable/ui/views/class/view_class/view_event.dart';
import 'package:TimeTable/ui/views/home/home_view.dart';
import 'package:TimeTable/ui/views/introduction/intro_view.dart';
import 'package:TimeTable/ui/views/splash_screen/splash_screen.dart';
import 'package:TimeTable/ui/views/startup/startup.dart';
import 'package:TimeTable/ui/views/teachers/teacher_view.dart';
import 'package:flutter/material.dart';

abstract class Routes {
  static const startupViewRoute = '/startup';
  static const homeViewRoute = '/home';
  static const teacherViewRoute = '/teacher';
  static const introViewRoute = '/intro';
  static const splashViewRoute = '/splashscreen';
  static const add_eventRoute = '/add_event';
  static const add_calender = '/add_calender';
  static const myhomepageRoute = '/';
  static const addClassToCalenderRoute = '/addtocalender';
  static const eventsDetailsPageRoute = '/eventsDetails';
}

class MainRouter {
  //static funtion that generates the routes
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.teacherViewRoute:
        return MaterialPageRoute(builder: (_) => TeacherList());

      case Routes.homeViewRoute:
        return MaterialPageRoute(builder: (_) => HomeView());

      case Routes.introViewRoute:
        return MaterialPageRoute(builder: (_) => IntroScreen());

      case Routes.splashViewRoute:
        return MaterialPageRoute(builder: (_) => SplashScreen());

      case Routes.add_eventRoute:
        return MaterialPageRoute(builder: (_) => AddEventPage());

      case Routes.add_calender:
        return MaterialPageRoute(builder: (_) => AddCalender());

      case Routes.myhomepageRoute:
        return MaterialPageRoute(builder: (_) => MyHomePage());

      case Routes.addClassToCalenderRoute:
        return MaterialPageRoute(builder: (_) => AddClass());

      case Routes.eventsDetailsPageRoute:
        return MaterialPageRoute(builder: (_) => EventDetailsPage());

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
