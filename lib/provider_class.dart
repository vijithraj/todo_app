import 'package:flutter/cupertino.dart';

class Todo {
  final String title;
  late final bool isCompleted;
  Todo({
    required this.title,
    this.isCompleted = false,
  });
}

class Todoprovider extends ChangeNotifier {
  List<Todo> iteam = [];
  List<Todo> get todos => iteam;
  void addTodo(Todo items) {
    iteam.add(items);
    notifyListeners();
  }

  void toggletodostatus(int index) {
    iteam[index].isCompleted = !iteam[index].isCompleted;
    notifyListeners();
  }

  void removedTodo(int index) {
    iteam.remove(index);
    notifyListeners();
  }
}
