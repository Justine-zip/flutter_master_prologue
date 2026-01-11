import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

class CounterNotifier extends Notifier<int> {
  @override
  int build() => 0;

  void increment() => state++;

  void decrement() {
    if (state > 0) state--;
  }

  void reset() => state = 0;
}
