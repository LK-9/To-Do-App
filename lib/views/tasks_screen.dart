import 'package:flutter/material.dart';
import 'package:todo/views/new_task.dart';
import 'package:todo/models/task.dart';
import 'package:todo/utilities/task_list.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  List<Task> tasks = [Task(name: 'Buy Milk'), Task(name: 'Buy Eggs')];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // allow to add new task
          showModalBottomSheet(
            context: context,
            builder: (context) => NewTask(
              addtaskCallback: (newTaskTitle) {
                setState(() {
                  tasks.add(Task(name: newTaskTitle));
                  Navigator.pop(context);
                });
              },
            ),
          );
        },
        backgroundColor: Colors.lightBlueAccent,
        shape: CircleBorder(),
        child: Icon(Icons.add, color: Colors.white, size: 30),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: 80.0,
              left: 30.0,
              right: 30.0,
              bottom: 30.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30.0,
                  child: Icon(
                    Icons.list,
                    size: 35,
                    color: Colors.lightBlueAccent,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  'TODO',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                // SizedBox(height: 10.0),
                Text(
                  '${tasks.length} Tasks',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 20.0),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: TaskList(tasks: tasks),
            ),
          ),
        ],
      ),
    );
  }
}
