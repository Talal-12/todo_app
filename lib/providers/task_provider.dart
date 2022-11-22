import 'package:flutter/foundation.dart';

import '../models/task_model.dart';

class TaskProvider extends ChangeNotifier {
  List<TaskModel> tasks = [
    TaskModel(text: "Create Flutter project", isComplete: false),
    TaskModel(
        text: "Install packages (provider & go_router)", isComplete: false),
    TaskModel(text: "Create and Push repo", isComplete: false),
    TaskModel(text: "Start project", isComplete: false),
  ];

  void addTask(String task) {
    TaskModel model = TaskModel(text: task, isComplete: false);
    notifyListeners();
  }

  void changeTaskStatus(int index) {
    tasks[index].isComplete = !tasks[index].isComplete;
    notifyListeners();
  }

  void deleteTask(int index) {
    tasks.removeAt(index);
    notifyListeners();
  }
}
