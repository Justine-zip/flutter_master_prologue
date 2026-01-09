import 'package:flutter/material.dart';
import 'package:flutter_master_prologue/notifier/counter_notifier.dart';
import 'package:flutter_master_prologue/provider/counter_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterPage extends ConsumerWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final counter = ref.watch(counterProvider);
    final counterNoti = ref.watch(counterNotifierProvider);
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            ref.read(counterNotifierProvider.notifier).increment();
          },
          child: Icon(Icons.add),
        ),
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                counterNoti.toString(),
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 80),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    ref.read(counterNotifierProvider.notifier).decrement();
                  },
                  child: Icon(Icons.arrow_circle_left),
                ),
                FloatingActionButton(
                  onPressed: () {
                    ref.read(counterNotifierProvider.notifier).reset();
                  },
                  child: Icon(Icons.error),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
