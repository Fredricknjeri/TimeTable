import 'package:TimeTable/app/locator.dart';
import 'package:TimeTable/app/router.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    //  title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: Routes.splashViewRoute,
      onGenerateRoute: MainRouter.generateRoute,
      navigatorKey: locator<NavigationService>().navigatorKey,
    );
  }
}
