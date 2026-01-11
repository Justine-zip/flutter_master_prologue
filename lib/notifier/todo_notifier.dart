import 'dart:convert';

import 'package:flutter_master_prologue/model/todo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class TodoNotifier extends AsyncNotifier<List<Todo>> {
  @override
  //Initialize build notifier
  Future<List<Todo>> build() async {
    return _fetchTodos();
  }

  //Fetch data using http
  Future<List<Todo>> _fetchTodos() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/todos'),
    );

    final List data = jsonDecode(response.body);
    return data.map((e) => Todo.fromJson(e)).toList();
  }

  //Refresh/Reload data
  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      return _fetchTodos();
    });
  }
}
