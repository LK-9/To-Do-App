import 'package:flutter/material.dart';
import 'constants.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.taskTitle,
    required this.checkboxCallback,
    required this.isChecked,
  });

  final String taskTitle;
  final bool isChecked;
  final ValueChanged<bool?> checkboxCallback;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle,
        style: kTaskTextStyle.copyWith(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        value: isChecked,
        onChanged: checkboxCallback,
        activeColor: Colors.lightBlueAccent,
      ),
    );
  }
}
