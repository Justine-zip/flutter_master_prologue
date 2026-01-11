import 'package:flutter_master_prologue/models/chat.dart';
import 'package:flutter_master_prologue/notifiers/chat_notifier.dart';
import 'package:flutter_master_prologue/notifiers/send_chat_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

//Manual AsyncProvider
final chatAsyncProvider = AsyncNotifierProvider<ChatNotifier, List<Chat>>(
  ChatNotifier.new,
);

//Realtime StreamProvider
final chatRealtimeProvider = StreamProvider<List<Chat>>((ref) {
  final supabase = Supabase.instance.client;

  ref.keepAlive();

  return supabase
      .from('chat')
      .stream(primaryKey: ['id'])
      .order('created_at', ascending: true)
      .map((rows) {
        return rows.map((e) => Chat.fromJson(e)).toList();
      });
});

final sendRealtimeChat = AsyncNotifierProvider<SendChatNotifier, void>(
  SendChatNotifier.new,
);
