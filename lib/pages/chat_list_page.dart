import 'package:flutter/material.dart';
import 'package:flutter_master_prologue/pages/chat_page.dart';
import 'package:flutter_master_prologue/providers/chat_provider.dart';
import 'package:flutter_master_prologue/providers/supabase_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatListPage extends ConsumerStatefulWidget {
  const ChatListPage({super.key});

  @override
  ConsumerState<ChatListPage> createState() => _ChatListPageState();
}

class _ChatListPageState extends ConsumerState<ChatListPage> {
  @override
  Widget build(BuildContext context) {
    final chatList = ref.watch(chatListAsyncProvider);
    final supabase = ref.read(supabaseProvider);

    return Scaffold(
      backgroundColor: Colors.grey[850],

      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
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
          ),
          Expanded(
            child: chatList.when(
              data: (chatlist) {
                debugPrint('CurrentUserId: ${supabase.auth.currentUser?.id}');
                final filteredList =
                    chatlist
                        .where(
                          (u) => u.id != '6f61dfd7-b003-4282-b680-e19262e45614',
                        )
                        .toList();
                return ListView.builder(
                  itemCount: filteredList.length,
                  itemBuilder: (context, index) {
                    final clist = filteredList[index];
                    return GestureDetector(
                      onTap:
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ChatPage()),
                          ),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.yellow,
                          radius: 8,
                        ),
                        title: Text(
                          clist.username,
                          style: TextStyle(color: Colors.white60),
                        ),
                      ),
                    );
                  },
                );
              },
              error: (e, _) => Text(e.toString()),
              loading: () => Center(child: CircularProgressIndicator()),
            ),
          ),
        ],
      ),
    );
  }
}
