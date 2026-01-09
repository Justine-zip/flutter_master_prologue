import 'package:flutter_master_prologue/notifier/counter_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

//counterProvider
final counterProvider = Provider<int>((ref) {
  return 0;
});

//counterNotifierProvider
final counterNotifierProvider = StateNotifierProvider<CounterNotifier, int>(
  (ref) => CounterNotifier(),
);
