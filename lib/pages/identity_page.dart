import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_master_prologue/pages/chat_list_page.dart';
import 'package:flutter_master_prologue/providers/identity_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_animation_transition/animations/right_to_left_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';

class IdentityPage extends ConsumerStatefulWidget {
  final String identity;
  const IdentityPage({super.key, required this.identity});

  @override
  ConsumerState<IdentityPage> createState() => _IdentityPageState();
}

class _IdentityPageState extends ConsumerState<IdentityPage> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () async {
      if (!mounted) return;

      final userId = await ref
          .read(createIdentityProvider.notifier)
          .createIdentity(username: widget.identity);

      ref
          .read(identityProvider.notifier)
          .setUserIdentity(widget.identity, userId);

      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        PageAnimationTransition(
          page: ChatListPage(),
          pageAnimationType: RightToLeftTransition(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'WELCOME',
              style: TextStyle(
                color: Colors.white60,
                fontFamily: 'Roboto',
                fontSize: 24,
              ),
            ),
            Text(
              widget.identity,
              style: TextStyle(
                color: Colors.white60,
                fontFamily: 'Roboto',
                fontSize: widget.identity == 'ADMINISTRATOR' ? 40 : 48,
              ),
            ),
            const Text(
              'IDENTITY',
              style: TextStyle(
                color: Colors.white60,
                fontFamily: 'Roboto',
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
