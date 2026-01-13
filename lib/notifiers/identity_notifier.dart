import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class IdentityNotifier extends AsyncNotifier<String> {
  final _supabase = Supabase.instance.client;

  @override
  Future<String> build() async {
    return '';
  }

  Future<String> createIdentity({required String username}) async {
    state = const AsyncLoading();

    final userId = await AsyncValue.guard(() async {
      final data =
          await _supabase
              .from('profiles')
              .insert({'username': username})
              .select('userid')
              .single();

      return data['userid'] as String;
    });

    state = userId;
    return userId.value!;
  }
}
