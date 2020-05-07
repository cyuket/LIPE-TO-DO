class Task {
  String name;
  bool isDone;

  Task({this.name, this.isDone = false});

  void toggleDone() {
    isDone = !isDone;
  }

  void edit(String newValue) {
    name = newValue;
    isDone = false;
  }
}
