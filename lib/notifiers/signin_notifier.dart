import 'package:flutter_riverpod/flutter_riverpod.dart';

class SigninNotifier extends Notifier<bool> {
  @override
  bool build() => false;

  bool validate(String input) {
    final success = input.toLowerCase().contains('##admin');
    state = success;
    return success;
  }

  bool canEnter(String input) {
    if (input.trim().isEmpty) return true;
    return input.toLowerCase().contains('##admin');
  }
}
