import 'package:flutter/material.dart';
import 'package:student_grading/utils/utils.dart';

class StudentListTile extends StatelessWidget {

  final Student student;
  final Function onChecked;
  final Function onFailed;

  const StudentListTile({Key key, this.student, this.onChecked, this.onFailed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(student.name),
      subtitle: Text("Grade: ${student.grade}"),
      trailing: student.isUngraded ? Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon:Icon(Icons.check_circle, color: Colors.green,),
            onPressed: onChecked,
          ),
          SizedBox(width: 15,),
          IconButton(
            icon:Icon(Icons.cancel, color: Colors.red,),
            onPressed: onFailed,
          ),
        ],
      ) : student.isPassed ? Icon(Icons.check_circle, color: Colors.green,) : Icon(Icons.cancel, color: Colors.red,),
    );
  }
}
