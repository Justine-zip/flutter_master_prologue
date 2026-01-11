import 'package:flutter/material.dart';
import 'package:flutter_master_prologue/providers/chat_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatPage extends ConsumerWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatAsync = ref.watch(chatAsyncProvider);

    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () => ref.read(chatAsyncProvider.notifier).refresh(),
        child: Scaffold(
          backgroundColor: Colors.grey[850],
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'M I S S I N G E R',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    color: Colors.white,
                  ),
                ),
              ),
              chatAsync.when(
                data:
                    (chats) => Expanded(
                      child: ListView.builder(
                        itemCount: chats.length,
                        itemBuilder: (context, index) {
                          final chat = chats[index];
                          return ListTile(
                            title: Text(
                              chat.sender,
                              style: TextStyle(color: Colors.white),
                            ),
                            subtitle: Text(
                              chat.message,
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        },
                      ),
                    ),
                error: (e, _) => Text(e.toString()),
                loading: () => CircularProgressIndicator(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
