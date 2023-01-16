import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:poslite/util/magic_strings.dart';
import '../../providers/providers.dart';
import '../../repositories/auth_repo.dart';

part 'login_controller.freezed.dart';
part 'login_state.dart';

class LoginScreenController extends AutoDisposeAsyncNotifier<LoginState> {
  Future<void> signIn(BuildContext context, bool mounted) async {
    state = const AsyncValue.loading();
    try {
      var res = await AuthRepository.instance.signIn(state.value!.password!);
      if (res.user != null) {
        ref.read(userProvider.notifier).setUser(res.user!);
        if (mounted) {
          context.goNamed(RouteName.dashboard.name);
        }
      }
    } catch (e) {
      state = AsyncValue.data(state.value!);
      debugPrint('$e');
    }
  }

  void updatePassword(String data) =>
      state = AsyncValue.data(state.value!.copyWith(password: data));

  @override
  FutureOr<LoginState> build() {
    state = const AsyncValue.data(LoginState());
    return const LoginState();
  }
}
