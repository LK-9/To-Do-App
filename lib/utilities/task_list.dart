import 'package:flutter/material.dart';
import 'package:todo/models/task_data.dart';
import 'package:provider/provider.dart';
import 'task_tile.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          reverse: false,
          itemCount: taskData.taskCount,
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TaskTile(
              taskTitle: task.name,
              isChecked: task.isDone,
              checkboxCallback: (checkBoxState) => taskData.updateTask(task),
              longpressCallback: () => taskData.deleteTask(task), 
            );
          },
        );
      },
    );
  }
}
