import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserController extends Notifier<User?> {
  void setUser(User user) {
    state = user;
  }

  @override
  User? build() {
    return state;
  }
}
