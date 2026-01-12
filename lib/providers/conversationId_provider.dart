import 'package:flutter_master_prologue/providers/identity_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final conversationIdProvider = Provider<String?>((ref) {
  final identity = ref.watch(identityProvider);

  final user = identity.user;
  final receiver = identity.receiver;

  if (user == null || receiver == null) return null;

  final ids = [user, receiver]..sort();
  return ids.join('_');
});
