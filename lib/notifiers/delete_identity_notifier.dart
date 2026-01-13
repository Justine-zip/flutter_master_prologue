import 'package:flutter_master_prologue/providers/supabase_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DeleteProfileNotifier extends AsyncNotifier<void> {
  @override
  Future<void> build() async {}

  Future<void> deleteUser(String userId) async {
    final supabase = ref.read(supabaseProvider);
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      await supabase.from('profiles').delete().eq('userid', userId);
    });
  }
}
