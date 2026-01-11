import 'package:flutter/material.dart';
import 'package:flutter_master_prologue/providers/chat_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatPage extends ConsumerWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatAsync = ref.watch(chatRealtimeProvider);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[850],
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'M.O.N.E.Y',
                style: TextStyle(
                  fontFamily: 'Roboto',
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
                        final isMe = chat.sender == 'Josh';

                        return Align(
                          alignment:
                              isMe
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,
                          widthFactor: 1,
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                              vertical: 4,
                              horizontal: 8,
                            ),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[800],
                            ),
                            child: Column(
                              crossAxisAlignment:
                                  isMe
                                      ? CrossAxisAlignment.end
                                      : CrossAxisAlignment.start,
                              children: [
                                Text(
                                  chat.sender,
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  chat.message,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
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
    );
  }
}
