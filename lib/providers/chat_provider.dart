import 'package:flutter_master_prologue/models/chat.dart';
import 'package:flutter_master_prologue/models/user.dart';
import 'package:flutter_master_prologue/notifiers/chat_list_notifier.dart';
import 'package:flutter_master_prologue/notifiers/chat_notifier.dart';
import 'package:flutter_master_prologue/notifiers/send_chat_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

//Manual AsyncProvider
final chatAsyncProvider = AsyncNotifierProvider<ChatNotifier, List<Chat>>(
  ChatNotifier.new,
);

//Realtime StreamProvider
final chatRealtimeProvider = StreamProvider.family<List<Chat>, String>((
  ref,
  conversationId,
) {
  final supabase = Supabase.instance.client;

  ref.keepAlive();

  return supabase
      .from('chat')
      .stream(primaryKey: ['id'])
      .eq('conversation_id', conversationId)
      .order('created_at', ascending: true)
      .map((rows) => rows.map(Chat.fromJson).toList());
});

final sendRealtimeChat = AsyncNotifierProvider<SendChatNotifier, void>(
  SendChatNotifier.new,
);

//ChatList AsyncProvider
final chatListAsyncProvider =
    AsyncNotifierProvider<ChatListNotifier, List<Users>>(ChatListNotifier.new);
