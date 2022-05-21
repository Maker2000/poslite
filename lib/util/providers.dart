import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../pages/login/login_controller.dart';
import '../repositories/auth_repo.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository();
});
final loginScreenControllerProvider = StateNotifierProvider.autoDispose<
    LoginScreenController, AsyncValue<String>>((ref) {
  return LoginScreenController(ref.watch(authRepositoryProvider));
});
