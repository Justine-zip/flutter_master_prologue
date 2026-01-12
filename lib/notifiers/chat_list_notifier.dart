import 'package:flutter/foundation.dart';
import 'package:flutter_master_prologue/models/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ChatListNotifier extends AsyncNotifier<List<Users>> {
  final _supabase = Supabase.instance.client;

  @override
  Future<List<Users>> build() async {
    return _fetchUsers();
  }

  Future<List<Users>> _fetchUsers() async {
    final response = await _supabase.from('profiles').select();
    debugPrint('Response: $response');
    return response.map((e) => Users.fromJson(e)).toList();
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      return _fetchUsers();
    });
  }
}
