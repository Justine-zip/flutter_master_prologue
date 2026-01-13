import 'package:flutter_master_prologue/providers/conversationId_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SendChatNotifier extends AsyncNotifier<void> {
  final _supabase = Supabase.instance.client;

  @override
  void build() {}

  Future<void> send({
    required String sender,
    required String receiver,
    required String senderId,
    required String receiverId,
    required String message,
  }) async {
    final conversationId = ref.read(conversationIdProvider);

    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      await _supabase.from('chat').insert({
        'conversation_id': conversationId,
        'sender': sender,
        'receiver': receiver,
        'sender_id': senderId,
        'receiver_id': receiverId,
        'message': message,
      });
    });
  }
}
