import 'package:flutter_master_prologue/models/chat.dart';
import 'package:flutter_master_prologue/notifiers/chat_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final chatAsyncProvider = AsyncNotifierProvider<ChatNotifier, List<Chat>>(
  ChatNotifier.new,
);
