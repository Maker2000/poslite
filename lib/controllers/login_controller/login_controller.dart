import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poslite/controllers/user_controller.dart';
import 'package:poslite/providers/providers.dart';
import 'package:poslite/repositories/auth_repo.dart';

part 'login_controller.freezed.dart';
part 'login_state.dart';

class LoginScreenController extends AutoDisposeAsyncNotifier<LoginState> {
  Future<void> signIn(BuildContext context) async {
    state = const AsyncValue.loading();
    try {
      var res = await AuthRepository.instance.signIn(state.value!.password!);
      if (res.user != null) {
        ref.read(userProvider.notifier).setUser(res.user!);
      }
    } catch (e) {
      state = AsyncValue.data(state.value!);
      debugPrint('object');
    }
  }

  void updatePassword(String data) =>
      state = AsyncValue.data(state.value!.copyWith(password: data));

  @override
  FutureOr<LoginState> build() {
    return state.value!;
  }
}
