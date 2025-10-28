import 'package:flutter/material.dart';
import 'package:todo/models/task.dart';
import 'task_tile.dart';

class TaskList extends StatefulWidget {
  const TaskList({super.key, required this.tasks});

  final List<Task> tasks;

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      reverse: false,
      itemCount: widget.tasks.length,
      itemBuilder: (context, index) {
        return TaskTile(
          taskTitle: widget.tasks[index].name,
          isChecked: widget.tasks[index].isDone,
          checkboxCallback: (checkBoxState) {
            setState(() {
              widget.tasks[index].toggleDone();
            });
          },
        );
      },
    );
  }
}
