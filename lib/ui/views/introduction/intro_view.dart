import 'package:TimeTable/app/router.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';

class IntroScreen extends StatefulWidget {
  IntroScreen({Key key}) : super(key: key);

  @override
  IntroScreenState createState() => new IntroScreenState();
}

class IntroScreenState extends State<IntroScreen> {
  List<Slide> slides = new List();

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        title: "Welcome",
        description:
            "Welcome to the most Advanced Teaching timetable specificaly designed for you",
        pathImage: "assets/images/onboarding/onboarding1.png",
        backgroundColor: Colors.grey,
      ),
    );
    slides.add(
      new Slide(
        title: "Easy",
        description:
            "The timetable is easy to use and navigate with the use of modern Google Calender..",
        pathImage: "assets/images/onboarding/onboarding2.png",
        backgroundColor: Colors.grey
      ),
    );
    slides.add(
      new Slide(
        title: "Manage",
        description:
            "View and manage your classes and lessons in the easier way possible... We love to see you shine",
        pathImage: "assets/images/onboarding/onboarding3.png",
        backgroundColor: Colors.grey,
      ),
    );
  }

  void onDonePress() {
    // Do what you want
    Navigator.of(context).pushNamed(Routes.myhomepageRoute);
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      slides: this.slides,
      onDonePress: this.onDonePress,
    );
  }
}
