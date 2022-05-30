import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poslite/repositories/auth_repo.dart';
import 'package:poslite/util/magic_strings.dart';

class LoginScreenController extends StateNotifier<AsyncValue<String>> {
  LoginScreenController(this.repo) : super(const AsyncValue.data(''));
  final AuthRepository repo;
  Future<void> signIn(String password, BuildContext context) async {
    state = const AsyncLoading<String>();
    String resultData = await repo.signIn(password);
    if (resultData.isEmpty) {
      Navigator.pushReplacementNamed(context, RouteNames.home);
    } else {
      state = AsyncData(resultData);
    }
  }
}
