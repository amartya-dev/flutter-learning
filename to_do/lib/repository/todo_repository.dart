import 'package:to_do/dao/todo_dao.dart';
import 'package:to_do/model/todo.dart';

class ToDoRepository {
  final toDoDao = ToDoDao();

  Future getAllToDos({String query}) => toDoDao.getToDos(query: query);
  Future insertToDo(ToDo todo) => toDoDao.createToDo(todo);
  Future updateToDo(ToDo todo) => toDoDao.updateToDo(todo);
  Future delteToDoById(int id) => toDoDao.deleteToDo(id);
  Future deleteAllToDos() => toDoDao.deleteAllToDos();
}