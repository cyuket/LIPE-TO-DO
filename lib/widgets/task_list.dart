import 'package:flutter/material.dart';
import 'task_tile.dart';
import 'package:lipe/models/task_data.dart';
import 'package:provider/provider.dart';
import 'package:lipe/screens/addTask.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return TaskTile(
              title: taskData.tasks[index].name,
              isChecked: taskData.tasks[index].isDone,
              checkboxCallback: (bool newValue) {
                Provider.of<TaskData>(context, listen: false)
                    .toggleDone(taskData.tasks[index]);
              },
              deleteTask: () {
                Provider.of<TaskData>(context, listen: false).deleteTask(index);
              },
              editTask: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => AddTaskScreen(
                    task: taskData.tasks[index],
                  ),
                );
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
