import 'package:flutter/foundation.dart';
import 'package:flutter_master_prologue/models/chat.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ChatNotifier extends AsyncNotifier<List<Chat>> {
  final _supabase = Supabase.instance.client;

  @override
  Future<List<Chat>> build() async {
    return _fetchChats();
  }

  Future<List<Chat>> _fetchChats() async {
    final response = await _supabase.from('chat').select();
    debugPrint('Response: $response');
    return response.map((e) => Chat.fromJson(e)).toList();
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      return _fetchChats();
    });
  }
}
