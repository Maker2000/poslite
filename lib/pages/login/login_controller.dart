import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poslite/repositories/auth_repo.dart';

class LoginScreenController extends StateNotifier<AsyncValue<String>> {
  LoginScreenController(this.repo) : super(const AsyncValue.data(''));
  final AuthRepository repo;
  Future<void> signIn(String password) async {
    state = const AsyncLoading<String>();
    state = await AsyncValue.guard<String>(() => repo.signIn(password));
  }
}
