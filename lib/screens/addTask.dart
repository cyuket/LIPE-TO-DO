import 'package:flutter/material.dart';
import 'package:lipe/models/task.dart';
import 'package:provider/provider.dart';
import 'package:lipe/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  final Task task;

  AddTaskScreen({this.task});

  @override
  Widget build(BuildContext context) {
    String newTaskTitle;
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                task == null ? 'Add Task' : "Edit Task",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.lightBlueAccent,
                ),
              ),
              TextField(
                autofocus: true,
                textAlign: task == null ? TextAlign.center : TextAlign.left,
                controller:
                    TextEditingController(text: task == null ? '' : task.name),
                onChanged: (newValue) {
                  newTaskTitle = newValue;
                },
                onSubmitted: (newValue) {
                  newTaskTitle = newValue;
                  if (task == null) {
                    Provider.of<TaskData>(context, listen: false)
                        .addTask(newTaskTitle);
                  } else {
                    Provider.of<TaskData>(context, listen: false)
                        .editTask(task, newTaskTitle);
                  }

                  Navigator.pop(context);
                },
              ),
              SizedBox(
                height: 10,
              ),
              FlatButton(
                onPressed: () {
                  if (task == null) {
                    Provider.of<TaskData>(context, listen: false)
                        .addTask(newTaskTitle);
                  } else {
                    Provider.of<TaskData>(context, listen: false)
                        .editTask(task, newTaskTitle);
                  }

                  Navigator.pop(context);
                },
                child: Text(
                  task == null ? 'Add' : "Edit",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                color: Colors.lightBlueAccent,
              )
            ],
          ),
        ),
      ),
    );
  }
}
