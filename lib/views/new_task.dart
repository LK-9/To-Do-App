import 'package:flutter/material.dart';
import 'package:todo/utilities/constants.dart';

class NewTask extends StatefulWidget {
  const NewTask({super.key, required this.addtaskCallback});

  final Function addtaskCallback;

  @override
  State<NewTask> createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  String newTaskTitle = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add Task',
              style: kTaskTextStyle.copyWith(
                fontSize: 25.0,
                color: Colors.lightBlueAccent,
              ),
              textAlign: TextAlign.center,
            ),
            // SizedBox(height: 20.0),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              style: kTaskTextStyle,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.lightBlueAccent,
                    width: 2,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.lightBlueAccent,
                    width: 3,
                  ),
                ),
              ),
              onChanged: (newText) {
                newTaskTitle = newText;
              },
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                widget.addtaskCallback(newTaskTitle);
              },
              style: ButtonStyle(
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                backgroundColor: WidgetStatePropertyAll(Colors.lightBlueAccent),
              ),
              child: Text(
                'Add',
                style: kTaskTextStyle.copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
