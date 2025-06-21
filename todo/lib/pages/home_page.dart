import 'package:demo/data/database.dart';
import 'package:demo/util/dialog_box.dart';
import 'package:demo/util/todo_tile.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  // Open the Hive box
  final _myBox = Hive.box('todo_box');

  final _controller = TextEditingController();

  // List of tasks
  ToDoDatabase database = ToDoDatabase();

  @override
  void initState() {
    // Initialize the database
    if (_myBox.get('TODOLIST') == null) {
      database.createInitialData();
    } else {
      // Load existing data from the database
      database.toDoList = _myBox.get('TODOLIST');
      database.loadData();
    }

    super.initState();
  }

  void saveNewTask() {
    setState(() {
      database.toDoList.add([_controller.text, false]);
      _controller.clear(); // Clear the text field after saving
    });
    // Close the dialog after saving
    Navigator.of(context).pop();

    // Update the database after adding a new task
    database.updateDataBase();
  }

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      database.toDoList[index][1] = !database.toDoList[index][1];
    });
    database
        .updateDataBase(); // Update the database after changing the task status
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          Controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void deleteTask(int index) {
    setState(() {
      database.toDoList.removeAt(index);
    });
    // Update the database after adding a new task
    database.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f9fa),
      appBar: AppBar(
        title: Text(
          "TO DO'S",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xfff5f9fa),
        elevation: 0,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          createNewTask();
        },
        child: Icon(Icons.add),
        backgroundColor: Color(0xffffffff),
      ),

      body: ListView.builder(
        itemCount: database.toDoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: database.toDoList[index][0],
            taskCompleted: database.toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
