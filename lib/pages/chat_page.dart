import 'package:flutter/material.dart';
import 'package:flutter_master_prologue/providers/chat_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatPage extends ConsumerStatefulWidget {
  const ChatPage({super.key});

  @override
  ConsumerState<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends ConsumerState<ChatPage> {
  final TextEditingController myMsg = TextEditingController();

  @override
  void dispose() {
    myMsg.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final chatAsync = ref.watch(chatRealtimeProvider);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[850],
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            chatAsync.when(
              data:
                  (chats) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
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
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
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
                  ),
              error: (e, _) => Text(e.toString()),
              loading: () => CircularProgressIndicator(),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: myMsg,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      style: TextStyle(color: Colors.white60),
                    ),
                  ),
                  SizedBox(width: 24),
                  Icon(Icons.send_time_extension, color: Colors.white60),
                  SizedBox(width: 18),
                  IconButton(
                    onPressed: () async {
                      final text = myMsg.text.trim();
                      if (text.isEmpty) return;

                      await ref
                          .read(sendRealtimeChat.notifier)
                          .send(sender: 'Josh', receiver: 'Lea', message: text);
                      myMsg.clear();
                    },
                    icon: Icon(Icons.send, color: Colors.white60),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
