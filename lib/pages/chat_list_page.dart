import 'package:flutter/material.dart';
import 'package:flutter_master_prologue/components/group_create.dart';
import 'package:flutter_master_prologue/pages/chat_page.dart';
import 'package:flutter_master_prologue/providers/chat_provider.dart';
import 'package:flutter_master_prologue/providers/identity_provider.dart';
import 'package:flutter_master_prologue/providers/supabase_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_animation_transition/animations/bottom_to_top_faded_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';

class ChatListPage extends ConsumerStatefulWidget {
  const ChatListPage({super.key});

  @override
  ConsumerState<ChatListPage> createState() => _ChatListPageState();
}

class _ChatListPageState extends ConsumerState<ChatListPage> {
  @override
  Widget build(BuildContext context) {
    final chatList = ref.watch(chatListAsyncProvider);
    final supabase = ref.watch(supabaseProvider);
    final identity = ref.watch(identityProvider);

    return Scaffold(
      backgroundColor: Colors.grey[850],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(context: context, builder: (context) => GroupCreate());
        },
        backgroundColor: Colors.white30,
        child: Icon(Icons.group_add, color: Colors.grey[300]),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'M.O.N.E.Y',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    color: Colors.white,
                  ),
                ),
                Text(
                  '${identity.user}',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                Text(
                  '\$17.2',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: chatList.when(
              data: (chatlist) {
                debugPrint('CurrentUserId: ${supabase.auth.currentUser?.id}');
                final filteredList =
                    chatlist.where((u) => u.username != identity.user).toList();
                return ListView.builder(
                  itemCount: filteredList.length,
                  itemBuilder: (context, index) {
                    final clist = filteredList[index];
                    return GestureDetector(
                      onTap: () {
                        debugPrint(clist.username);
                        ref
                            .read(identityProvider.notifier)
                            .setReceiverIdentity(clist.username);
                        Navigator.push(
                          context,
                          PageAnimationTransition(
                            page: ChatPage(),
                            pageAnimationType: BottomToTopFadedTransition(),
                          ),
                        );
                      },
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
