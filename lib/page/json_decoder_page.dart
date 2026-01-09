import 'package:flutter/material.dart';
import 'package:flutter_master_prologue/provider/json_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class JsonDecoderPage extends ConsumerWidget {
  const JsonDecoderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final jsonProv = ref.watch(jsonDecoderProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Text('Json Decoder')),
          Center(child: Text(jsonProv.toString())),
        ],
      ),
    );
  }
}
