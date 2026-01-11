import 'package:flutter_master_prologue/notifier/counter_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

//counterProvider
final counterProvider = Provider<int>((ref) {
  return 0;
});

//L E G A C Y
// //counterStateNotifierProvider
// final counterStateNotifierProvider = StateNotifierProvider<CounterNotifier, int>(
//   (ref) => CounterNotifier(),
// );

//M O D E R N
//counterNotifierProvider
final counterNotifierProvider = NotifierProvider<CounterNotifier, int>(
  CounterNotifier.new,
);
