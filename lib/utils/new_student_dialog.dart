import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewStudentDialog extends StatefulWidget {

  @override
  _NewStudentDialogState createState() => _NewStudentDialogState();
}

class _NewStudentDialogState extends State<NewStudentDialog> {

  TextEditingController nameController = TextEditingController();
  TextEditingController gradeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 250,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 15),
              child: Text("New Student", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: "Student Name"
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: TextField(
                controller:gradeController,
                decoration: InputDecoration(
                    hintText: "Student Grade"
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CupertinoButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  minSize: 0,
                  padding: EdgeInsets.all(8),
                  child: Container(
                    height: 20,
                    width: 80,
                    child: Center(
                      child: Text("Cancel"),
                    ),
                  ),
                ),
                CupertinoButton(
                  onPressed: () {
                    Map<String, String> values = {
                      "name": nameController.text,
                      "grade": gradeController.text,
                    };

                    Navigator.pop(context, values);
                  },
                  minSize: 0,
                  padding: EdgeInsets.all(8),
                  child: Container(
                    height: 20,
                    width: 80,
                    child: Center(
                      child: Text("Add"),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
