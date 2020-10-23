import 'package:TimeTable/core/model/teachers.dart';
import 'package:TimeTable/core/services/event_firestore_service.dart';
import 'package:TimeTable/ui/views/homespace/teacher_viewmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TeacherList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TeacherListState();
}

class TeacherListState extends State {
 // final databaseReference = Firestore.instance;
  List<dynamic> _selectedTeachers;
  int count = 0;
  double top = 0.0;
  //List<dynamic> _teachers;
  List<dynamic> _teachers;
  //Map<String, List<dynamic>> _events;
  // List<dynamic> _selectedEvents;

  List<dynamic> _groupEvents(List<TeacherModel> allteachers) {
    List<dynamic> data = [];
    allteachers.forEach((teacher) {
      data.add(teacher);
    });
    return data;
  }

  @override
  void initState() {
    super.initState();
    _teachers = [];
    _selectedTeachers = [];
  }

  @override
  Widget build(BuildContext context) {
    if (_selectedTeachers == null) {
      _selectedTeachers = List<Teacher>();
      getData();
    }
    return Scaffold(
      backgroundColor: Color(0xFF2B292A),
      body: StreamBuilder<List<TeacherModel>>(
          stream: teacherDBS.streamList(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<TeacherModel> allteachers = snapshot.data;
              if (allteachers.isNotEmpty) {
                _teachers = _groupEvents(allteachers);
              } else {
                _teachers = [];
                _selectedTeachers = [];
              }
            }
            return NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                      expandedHeight: 200.0,
                      floating: false,
                      pinned: true,
                      flexibleSpace: LayoutBuilder(builder:
                          (BuildContext context, BoxConstraints constraints) {
                        top = constraints.biggest.height;
                        return FlexibleSpaceBar(
                            title: _appBarText(top),
                            background: Image.asset(
                              "assets/images/home.jpg",
                              fit: BoxFit.cover,
                            ));
                      }),
                    ),
                  ];
                },
                body: Column(
                  children: [
                    //getData(),
                    ..._selectedTeachers.map((teacher) => ListView.builder(
                          // teacher: _teachers,
                          itemCount: count,
                          itemBuilder: (BuildContext context, int position) {
                            return Container(
                              height: 90,
                              child: Card(
                                semanticContainer: true,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                color: Colors.white,
                                elevation: 6.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: ListTile(
                                  leading: CircleAvatar(
                                    //backgroundColor: getColor(this.teachers[position].rank),
                                    child: Text(teacher.name),
                                  ),
                                  onTap: () {
                                    // debugPrint("Tapped on " + this.teachers[position].id.toString());
                                    //navigateToDetail(this.teachers[position]);
                                  },
                                  title: Text(teacher.name),
                                  subtitle: Text(teacher.name),
                                ),
                              ),
                            );
                          },
                        ))
                  ],
                ));
            /*
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                navigateToDetail(Teacher('', 3, ''));
              },
              tooltip: "Add new Teacher",
              child: new Icon(Icons.add),
            ),*/
          }),
    );
  }

  //AppBar custom text i.e Title and subtitle
  Widget _appBarText(double top) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        AnimatedCrossFade(
          duration: const Duration(milliseconds: 200),
          firstChild: const Text("My School",
              style: TextStyle(
                fontSize: 28.0,
              )),
          secondChild: const Text("Hi",
              style: TextStyle(
                fontSize: 28.0,
              )),
          crossFadeState: top > 100.0
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
        ),
        AnimatedOpacity(
          duration: Duration(milliseconds: 450),
          opacity: top < 100.0 ? 0.0 : 1.0,
          child: Visibility(
            visible: top < 100.0 ? false : true,
            child: Text(
              "This is your Teachers List",
              style: TextStyle(fontSize: 14.0),
            ),
          ),
        ),
      ],
    );
  }

  //Listview for the lists of todo
  /* ListView teacherListItems() {
          return ListView.builder(
            itemCount: count,
            itemBuilder: (BuildContext context, int position) {
              return Container(
                height: 90,
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  color: Colors.white,
                  elevation: 6.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      //backgroundColor: getColor(this.teachers[position].rank),
                      child: Text(teacher.name),
                    ),
                    onTap: () {
                     // debugPrint("Tapped on " + this.teachers[position].id.toString());
                      //navigateToDetail(this.teachers[position]);
                    },
                    title: Text(this.teacher[position].title),
                    subtitle: Text(this.teachers[position].date),
                  ),
                ),
              );
            },
          );
        }*/
  /*
        void getData() {
          final dbFuture = helper.initializeDb();
          dbFuture.then((result) {
            final todosFuture = helper.getTodos();
            todosFuture.then((result) {
              List<Todo> todoList = List<Todo>();
              count = result.length;
              for (int i = 0; i < count; i++) {
                todoList.add(Todo.fromObject(result[i]));
                debugPrint(todoList[i].title);
              }
              setState(() {
                todos = todoList;
                count = count;
              });
            });
          });
        }
        
        void navigateToDetail(Todo todo) async {
          bool result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TodoDetail(todo)),
          );
          if (result == true) {
            getData();
          }
        }
      */
  Color getColor(int rank) {
    switch (rank) {
      case 1:
        return Colors.red;
        break;
      case 2:
        return Colors.blue;
        break;
      case 3:
        return Colors.green;
        break;

      default:
        return Colors.green;
    }
  }

  // void getData() {
  //   databaseReference
  //       .collection("books")
  //       .getDocuments()
  //       .then((QuerySnapshot snapshot) {
  //     snapshot.documents.forEach((f) => print('${f.data}}'));
  //   });
  // }

  void navigateToDetail(teacher) {}

  void getData() {}
}
