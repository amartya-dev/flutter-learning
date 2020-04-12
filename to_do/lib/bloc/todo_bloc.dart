import 'package:to_do/model/todo.dart';
import 'package:to_do/repository/todo_repository.dart';

import 'dart:async';

class ToDoBloc {
  final _toDoRepository = ToDoRepository();
  final _toDoController = StreamController<List<ToDo>>.broadcast();

  get todos => _toDoController.stream;

  ToDoBloc() {
    getToDos();
  }

  getToDos({String query}) async {
    _toDoController.sink.add(
      await _toDoRepository.getAllToDos(query: query)
    );
  }

  addToDo(ToDo todo) async {
    await _toDoRepository.insertToDo(todo);
    getToDos();
  }

  updateToDo(ToDo todo) async {
    await _toDoRepository.updateToDo(todo);
    getToDos();
  }

  deleteToDoById(int id) async {
    _toDoRepository.delteToDoById(id);
    getToDos();
  }

  dispose() {
    _toDoController.close();
  }
}