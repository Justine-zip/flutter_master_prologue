import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class IdentityNotifier extends AsyncNotifier<void> {
  final _supabase = Supabase.instance.client;

  @override
  void build() {}

  Future<void> createIdentity({required String username}) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      await _supabase.from('profiles').insert({'username': username});
    });
  }
}
