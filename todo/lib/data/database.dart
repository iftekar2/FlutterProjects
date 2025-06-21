import 'package:hive/hive.dart';

class ToDoDatabase {
  List toDoList = [];

  final _myBox = Hive.box('todo_box');

  // First Time Opening the App
  void createInitialData() {
    toDoList = [];
  }

  // Load Data
  void loadData() {
    toDoList = _myBox.get('TODOLIST') ?? [];
  }

  // Update Data
  void updateDataBase() {
    _myBox.put('TODOLIST', toDoList);
  }
}
