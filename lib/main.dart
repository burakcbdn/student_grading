import 'package:flutter/material.dart';
import 'utils/student_list_tile.dart';
import 'utils/utils.dart';

void main() {
  runApp(StudentGrading());
}

class StudentGrading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Student> studentsUngraded = [];
  List<Student> studentsPassed = [];
  List<Student> studentsFailed = [];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text("Students"),
          bottom: TabBar(
            tabs: [
              Tab(
                text: "Ungraded",
              ),
              Tab(
                text: "Pass",
              ),
              Tab(
                text: "Fail",
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Container(
              child: ListView(
                children: studentsUngraded.map((student) {
                  return StudentListTile(
                    student: student,
                    onChecked: () {
                      setState(() {
                        student.isPassed = true;
                        student.isUngraded = false;
                        studentsUngraded.remove(student);
                        studentsPassed.add(student);
                      });
                    },
                    onFailed: () {
                      setState(() {
                        student.isPassed = false;
                        student.isUngraded = false;
                        studentsUngraded.remove(student);
                        studentsFailed.add(student);
                      });
                    },
                  );
                }).toList(),
              ),
            ),
            Container(
              child: ListView(
                children: studentsPassed.map((student) {
                  return StudentListTile(
                    student: student,
                  );
                }).toList(),
              ),
            ),
            Container(
              child: ListView(
                children: studentsFailed.map((student) {
                  return StudentListTile(
                    student: student,
                  );
                }).toList(),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            var result = await showDialog(context: context, child: NewStudentDialog());

            Student student = Student(name: result["name"], grade: double.parse(result["grade"]));

            setState(() {
              studentsUngraded.add(student);
            });
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
