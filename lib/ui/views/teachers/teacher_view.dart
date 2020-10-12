import 'package:TimeTable/ui/views/teachers/teacher_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class TeacherView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        builder: (context, model, child) => Scaffold(
              body: Center(
                child: Text(model.name),
              ),
            ),
        viewModelBuilder: () => TeacherViewModel());
  }
}
