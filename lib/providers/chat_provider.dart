import 'package:flutter_master_prologue/models/chat.dart';
import 'package:flutter_master_prologue/models/user.dart';
import 'package:flutter_master_prologue/notifiers/chat_list_notifier.dart';
import 'package:flutter_master_prologue/notifiers/chat_notifier.dart';
import 'package:flutter_master_prologue/notifiers/send_chat_notifier.dart';
import 'package:flutter_master_prologue/providers/identity_provider.dart';
import 'package:flutter_master_prologue/providers/supabase_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Manual AsyncProvider
final chatAsyncProvider = AsyncNotifierProvider<ChatNotifier, List<Chat>>(
  ChatNotifier.new,
);

//Filtered ChatList Provider
final filteredChatListProvider = Provider<List<Users>>((ref) {
  final chats = ref.watch(chatListRealtimeProvider).value ?? [];
  final identity = ref.watch(identityProvider);

  return chats.where((e) => e.id != identity.userId).toList();
});

//Realtime StreamProvider
final chatRealtimeProvider = StreamProvider.family<List<Chat>, String>((
  ref,
  conversationId,
) {
  final supabase = ref.read(supabaseProvider);

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

//Realtime ChatList Provider
final chatListRealtimeProvider = StreamProvider<List<Users>>((ref) {
  final supabase = ref.read(supabaseProvider);
  ref.keepAlive();

  return supabase
      .from('profiles')
      .stream(primaryKey: ['userid'])
      .order('created', ascending: true)
      .map((rows) => rows.map(Users.fromJson).toList());
});
