import 'dart:convert';
import 'package:flutter_master_prologue/model/todo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_master_prologue/model/user.dart';

final usersProvider = FutureProvider<List<User>>((ref) async {
  final response = await http.get(
    Uri.parse('https://jsonplaceholder.typicode.com/users'),
  );

  if (response.statusCode == 200) {
    final List decoded = jsonDecode(response.body);
    return decoded.map((e) => User.fromJson(e)).toList();
  } else {
    throw Exception('Failed to load users');
  }
});

final todosProvider = FutureProvider<List<Todo>>((ref) async {
  final response = await http.get(
    Uri.parse('https://jsonplaceholder.typicode.com/todos'),
  );

  if (response.statusCode == 200) {
    final List decoded = jsonDecode(response.body);
    return decoded.map((e) => Todo.fromJson(e)).toList();
  } else {
    throw Exception('Failed to load todos');
  }
});
