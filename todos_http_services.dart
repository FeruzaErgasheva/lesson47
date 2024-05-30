import 'dart:convert';

import 'package:lesson47/models/todo_model.dart';
import 'package:http/http.dart' as http;

class TodosHttpServices {
  Future<List<TodoModel>> getTodos() async {
    Uri uri = Uri.parse(
        "https://todoapp-8fd7b-default-rtdb.firebaseio.com/todos.json");
    try {
      final response = await http.get(uri);
      final data = jsonDecode(response.body);
      // print(data);

      List<TodoModel> loadedTodos = [];
      if (data != null) {
        for (Map todo in data) {
          Map<String, dynamic> todoMap = todo.cast<String, dynamic>();
          loadedTodos.add(TodoModel.fromJson(todoMap));
        }
      }
      print(loadedTodos.length);
      return loadedTodos;
    } catch (e) {
      print(e);
    }
    return [];
  }
}

void main(List<String> args) {
  TodosHttpServices todosHttpServices=TodosHttpServices();
  todosHttpServices.getTodos();
}
