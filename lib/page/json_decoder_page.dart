import 'package:flutter/material.dart';
import 'package:flutter_master_prologue/provider/json_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class JsonDecoderPage extends ConsumerWidget {
  const JsonDecoderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersAsync = ref.watch(usersProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Text('Json Decoder')),
          usersAsync.when(
            data:
                (users) => Expanded(
                  child: ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      final user = users[index];
                      return ListTile(
                        title: Text(user.name),
                        subtitle: Text(user.email),
                        trailing: Text(user.username),
                      );
                    },
                  ),
                ),
            error: (e, stack) => Center(child: Text(e.toString())),
            loading: () => const Center(child: CircularProgressIndicator()),
          ),
        ],
      ),
    );
  }
}
