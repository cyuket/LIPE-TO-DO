import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String title;
  final Function checkboxCallback;
  final Function deleteTask;
  final Function editTask;

  TaskTile({
    this.isChecked,
    this.title,
    this.checkboxCallback,
    this.deleteTask,
    this.editTask,
  });
  @override
  Widget build(BuildContext context) {
    return ListTile(
        onLongPress: deleteTask,
        title: Text(
          title,
          style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Container(
          width: 100,
          child: Row(
            children: <Widget>[
              Checkbox(
                value: isChecked,
                activeColor: Colors.lightBlueAccent,
                onChanged: checkboxCallback,
              ),
              GestureDetector(
                onTap: editTask,
                child: Icon(
                  Icons.edit,
                  color: Colors.lightBlueAccent,
                ),
              ),
              SizedBox(
                width: 4,
              ),
              GestureDetector(
                onTap: deleteTask,
                child: Icon(
                  Icons.delete,
                  color: Colors.redAccent,
                ),
              )
            ],
          ),
        ));
  }
}
