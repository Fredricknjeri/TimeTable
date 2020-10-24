import 'package:TimeTable/ui/views/homespace/teacher_viewmodel.dart';
import 'package:TimeTable/ui/views/teachers/teachers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TeacherList1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TeacherListState();
}

class TeacherListState extends State {
  List<Teacher> teachers;
  List<String> lteacher = ["Fredrick", "Violet", "Janet"];
  int count = 0;
  double top = 0.0;

  @override
  Widget build(BuildContext context) {
    if (teachers == null) {
      teachers = List<Teacher>();
      getData();
    }
    return Scaffold(
      
      // backgroundColor: Color(0xFF2B292A),
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
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
              Padding(padding: EdgeInsets.all(34.0)),
              ListTile(
                  hoverColor: Colors.blue,
                  leading: const Icon(Icons.person),
                  title: const Text(  "Fredrick", style: TextStyle(fontSize: 20.0, color: Color(0xFF2B292A))),
                  subtitle: const Text('Teaches Mathematics and Sciences Classes',),
                  onTap: () => print("ListTile")),
              ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text("Janet",style: TextStyle(fontSize: 20.0, color: Color(0xFF2B292A))),
                  subtitle: const Text('teaches CRE only'),
                  onTap: () => print("ListTile")),
              ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text("Violet",style: TextStyle(fontSize: 20.0, color: Color(0xFF2B292A))),
                  subtitle: const Text('Teaches English and Kiswahili'),
                  onTap: () => print("ListTile")),
            ],
          )
          //getTeacher()
          /*StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance.collection("products").snapshots(),
          builder: (context, snapshot) {
            return !snapshot.hasData
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot data = snapshot.data.documents[index];
                      return Teachers(
                        id: data.documentID,
                        form: data['form'],
                        name: data['name'],
                      );
                    },
                  );
          },
        ),*/
          ),
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
          firstChild: const Text("Hi",
              style: TextStyle(
                fontSize: 28.0,
              )),
          secondChild: const Text("My School",
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
  ListView todoListItems() {
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
                backgroundColor: getColor(this.teachers[position].rank),
                child: Text(this.teachers[position].rank.toString()),
              ),
              onTap: () {
                debugPrint(
                    "Tapped on " + this.teachers[position].id.toString());
                navigateToDetail(this.teachers[position]);
              },
              title: Text(this.teachers[position].title),
              subtitle: Text(this.teachers[position].date),
            ),
          ),
        );
      },
    );
  }

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
  Widget getTeacher() {
    return Container(
      child: ListView.builder(
          itemCount: count,
          itemBuilder: (BuildContext context, int position) {
            return Text(lteacher[position]);
          }),
    );
  }

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

  void navigateToDetail(teacher) {}

  void getData() {}
}
