import 'package:firebase_helpers/firebase_helpers.dart';

// ignore: deprecated_member_use
class TeacherModel extends DatabaseItem{
  final String id;
  final String name;
  final String form;
  

  TeacherModel({this.id,this.name, this.form}):super(id);

  factory TeacherModel.fromMap(Map data) {
    return TeacherModel(
      name: data['name'],
      form: data['form'],
    );
  }

  factory TeacherModel.fromDS(String id, Map<String,dynamic> data) {
    return TeacherModel(
      id: id,
      name: data['name'],
      form: data['form'],
    );
  }

  Map<String,dynamic> toMap() {
    return {
      "name":name,
      "form": form,
      "id":id,
    };
  }
}