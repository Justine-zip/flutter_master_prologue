import 'package:flutter_master_prologue/models/identity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IdentityValueNotifier extends Notifier<Identity> {
  @override
  Identity build() => const Identity();

  void setUserIdentity(String value) {
    state = state.copyWith(user: value);
  }

  void setReceiverIdentity(String value) {
    state = state.copyWith(receiver: value);
  }
}
