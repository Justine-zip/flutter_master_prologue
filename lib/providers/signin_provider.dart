import 'package:flutter_master_prologue/notifiers/signin_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final signinProvider = NotifierProvider<SigninNotifier, bool>(
  SigninNotifier.new,
);
