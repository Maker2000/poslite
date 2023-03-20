import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/user/user.dart';

class UserController extends Notifier<User?> {
  void setUser(User user) {
    state = user;
  }

  @override
  User? build() {
    return state;
  }
}
