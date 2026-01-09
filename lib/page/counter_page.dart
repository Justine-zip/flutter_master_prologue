import 'package:flutter/material.dart';
import 'package:flutter_master_prologue/provider/counter_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterPage extends ConsumerWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Text(counter.toString())),
    );
  }
}
