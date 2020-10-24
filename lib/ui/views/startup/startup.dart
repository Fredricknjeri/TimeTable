import 'package:TimeTable/core/model/event.dart';
import 'package:TimeTable/core/services/event_firestore_service.dart';
import 'package:TimeTable/ui/views/class/view_class/view_event.dart';
import 'package:TimeTable/ui/views/home/home_view.dart';
import 'package:TimeTable/ui/views/homespace/homespace.dart';
import 'package:TimeTable/ui/views/teachers/teacher_view.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  PageController _pageController;


  @override
  void initState() {
    super.initState();

    _pageController = PageController();

  }


  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2B292A),
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            //_home(context),    
            TeacherList1(),
            HomeView(), 
            Container(
              color: Colors.blue,
              child: Center(child: Text('created with Love, enjoy'),),),                    
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        backgroundColor: Color(0xFF2B292A),
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            title: Text('Home'),
            icon: Icon(Icons.home)
          ),
          BottomNavyBarItem(
            title: Text('Classes'),
            icon: Icon(Icons.calendar_today)
          ),
          BottomNavyBarItem(
            title: Text('About'),
            icon: Icon(Icons.help)
          ),
        ],
      ),
    );
  }

}