import 'dart:async';
import 'package:to_do/database/database.dart';
import 'package:to_do/model/todo.dart';

class ToDoDao {
  final dbProvider = DatabaseProvider.dbProvider;

  Future <int> createToDo (ToDo todo) async {
    final db = await dbProvider.database;
    var result = db.insert(toDoTable, todo.toDatabaseJson());
    return result;
  }

  Future <List<ToDo>> getToDos({List <String> columns, String query}) async {
    final db = await dbProvider.database;

    List<Map<String, dynamic>> result;
    if (query != null) {
      if (query.isNotEmpty){
        result = await db.query(
          toDoTable,
          columns: columns,
          where: 'description LIKE ?',
          whereArgs: ["%$query%"]
        );
      }
    }
    else{
      result = await db.query(
        toDoTable,
        columns: columns
      );
    }
    List<ToDo> todos = result.isNotEmpty ? result.map((item) => ToDo.fromDatabaseJson(item)).toList() : [];
    return todos;
  }

  Future <int> updateToDo (ToDo todo) async {
    final db = await dbProvider.database;

    var result = await db.update(
      toDoTable,
      todo.toDatabaseJson(),
      where: "id = ?",
      whereArgs: [todo.id]
    );
    return result;
  }

  Future <int> deleteToDo (int id) async {
    final db = await dbProvider.database;
    var result = await db.delete(
      toDoTable,
      where: "id = ?",
      whereArgs: [id]
    );
    return result;
  }

  Future deleteAllToDos() async {
    final db = await dbProvider.database;
    var result = await db.delete(
      toDoTable,
    );
    return result;
  }
}