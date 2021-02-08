import 'package:TimeTable/core/model/event.dart';
import 'package:TimeTable/ui/views/add_calender/add_calender.dart';
import 'package:flutter/material.dart';


class EventDetailsPage extends StatelessWidget {
  final EventModel event;

  const EventDetailsPage({Key key, this.event}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xFF2B292A),
      appBar: AppBar(
        title: Text('Class details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(event.title, style: Theme.of(context).textTheme.display1,),
            SizedBox(height: 20.0),
            Text(event.description),
            SizedBox(height: 20.0),
            AddCalender()       
          ],
        ),
      ),
      floatingActionButton:  FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.pushNamed(context, '/add_calender'),
      ),
    );
  }
  
}