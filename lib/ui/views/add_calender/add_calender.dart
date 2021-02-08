import 'dart:developer';
import 'package:TimeTable/core/api/calender_client.dart';
import 'package:TimeTable/core/api/calender_clientee.dart';
import 'package:TimeTable/core/model/event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class AddCalender extends StatefulWidget {
  final EventModel event;

  const AddCalender({Key key, this.event}) : super(key: key);
  @override
  _AddCalenderState createState() => _AddCalenderState();
}

class _AddCalenderState extends State<AddCalender> {
  CalendarClientee calendarClient = CalendarClientee();
  DateTime startTime = DateTime.now();
  DateTime endTime = DateTime.now().add(Duration(days: 1));
  TextEditingController _eventName = TextEditingController();
  EventModel event = EventModel();
  @override
  Widget build(BuildContext context) {
    return Center(
      //backgroundColor: Color(0xFF2B292A),
      child: _body(context),
    );
  }

  _body(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              FlatButton(
                  onPressed: () {
                    DatePicker.showDateTimePicker(context,
                        showTitleActions: true,
                        minTime: DateTime(2019, 3, 5),
                        maxTime: DateTime(2200, 6, 7), onChanged: (date) {
                      print('change $date');
                    }, onConfirm: (date) {
                      setState(() {
                        this.startTime = date;
                      });
                    }, currentTime: DateTime.now(), locale: LocaleType.en);
                  },
                  child: Text(
                    'Event Start Time',
                    style: TextStyle(color: Colors.blue),
                  )),
              Text('$startTime'),
            ],
          ),
          Row(
            children: <Widget>[
              FlatButton(
                  onPressed: () {
                    DatePicker.showDateTimePicker(context,
                        showTitleActions: true,
                        minTime: DateTime(2019, 3, 5),
                        maxTime: DateTime(2200, 6, 7), onChanged: (date) {
                      print('change $date');
                    }, onConfirm: (date) {
                      setState(() {
                        this.endTime = date;
                      });
                    }, currentTime: DateTime.now(), locale: LocaleType.en);
                  },
                  child: Text(
                    'Event End Time',
                    style: TextStyle(color: Colors.blue),
                  )),
              Text('$endTime'),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _eventName,
              decoration: InputDecoration(hintText: 'class description'),
            ),
          ),
          RaisedButton(
              child: Text(
                'Add class to calender',
              ),
              color: Colors.orangeAccent,
              onPressed: () {
                log('add event pressed');
                //_eventName.text = event.title;
                calendarClient.insert(
                 //_eventName.text,
                  _eventName.text,
                  startTime,
                  endTime,
                 // event.eventDate
                );
              }),
        ],
      ),
    );
  }
}
