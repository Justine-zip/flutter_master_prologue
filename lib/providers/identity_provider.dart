import 'package:flutter_master_prologue/models/identity.dart';
import 'package:flutter_master_prologue/notifiers/delete_identity_notifier.dart';
import 'package:flutter_master_prologue/notifiers/identity_notifier.dart';
import 'package:flutter_master_prologue/notifiers/identity_value_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final identityProvider = NotifierProvider<IdentityValueNotifier, Identity>(
  IdentityValueNotifier.new,
);

final createIdentityProvider = AsyncNotifierProvider<IdentityNotifier, String>(
  IdentityNotifier.new,
);

final deleteProfileProvider =
    AsyncNotifierProvider<DeleteProfileNotifier, void>(
      DeleteProfileNotifier.new,
    );
