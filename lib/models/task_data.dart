import 'package:flutter/foundation.dart';
import 'task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [];
  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  int get completedTask {
    int number = 0;
    _tasks.map((e) {
      if (e.isDone) {
        number++;
      }
    });
    return number;
  }

  void toggleDone(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }

  void addTask(String newTaskTile) {
    final task = Task(name: newTaskTile);
    _tasks.add(task);
    notifyListeners();
  }

  void editTask(Task task, String newValue) {
    task.edit(newValue);
    notifyListeners();
  }
}
