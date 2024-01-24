import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List toDoList = [];

  // reference our box
  final _myBox = Hive.box('mybox');

  // Default task displayed when the app is opened for the first time
  void createInitialData() {
    toDoList = [
      ["Do Coding", false],
      ["Get the laundry done before Friday", false],
    ];
  }

  // loading data from database
  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

  // updating the database
  void updateDataBase() {
    _myBox.put("TODOLIST", toDoList);
  }
}
