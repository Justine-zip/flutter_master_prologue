import 'package:flutter_master_prologue/models/identity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IdentityValueNotifier extends Notifier<Identity> {
  @override
  Identity build() => const Identity();

  void setUserIdentity(String username, String id) {
    state = state.copyWith(user: username, userId: id);
  }

  void setReceiverIdentity(String username, String id) {
    state = state.copyWith(receiver: username, receiverId: id);
  }
}
