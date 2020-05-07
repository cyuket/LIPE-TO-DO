import 'package:flutter/material.dart';
import 'package:lipe/widgets/task_list.dart';
import 'package:lipe/screens/addTask.dart';

import 'package:lipe/models/task_data.dart';
import 'package:provider/provider.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => AddTaskScreen(),
          );
        },
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.list,
                      size: 40,
                      color: Colors.lightBlueAccent,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'LIPE To-do',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        '${Provider.of<TaskData>(context).taskCount} Tasks',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '${Provider.of<TaskData>(context).completedTask} Completed',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                  child: TaskList(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
