import 'package:TimeTable/core/model/teachers.dart';
import 'package:firebase_helpers/firebase_helpers.dart';
import '../model/event.dart';

DatabaseService<EventModel> eventDBS = DatabaseService<EventModel>("events",fromDS: (id,data) => EventModel.fromDS(id, data), toMap:(event) => event.toMap());

DatabaseService<TeacherModel> teacherDBS = DatabaseService<TeacherModel>("teacher",fromDS: (id,data) => TeacherModel.fromDS(id, data), toMap:(teacher) => teacher.toMap());

