import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SendChatNotifier extends AsyncNotifier<void> {
  final _supabase = Supabase.instance.client;

  @override
  void build() {}

  Future<void> send({
    required String sender,
    required String receiver,
    required String message,
  }) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      await _supabase.from('chat').insert({
        'sender': sender,
        'receiver': receiver,
        'message': message,
      });
    });
  }
}
