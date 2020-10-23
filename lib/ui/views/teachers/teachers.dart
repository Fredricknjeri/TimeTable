import 'package:flutter/material.dart';

class Teachers extends StatefulWidget {
  final String name;
  final String form;
  final String id;

  const Teachers({Key key, this.name, this.form, this.id}) : super(key: key);


  @override
  _TeachersState createState() => _TeachersState();
}

class _TeachersState extends State<Teachers> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(widget.name),
    );
  }
}
