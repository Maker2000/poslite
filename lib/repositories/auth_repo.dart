import 'package:firebase_auth/firebase_auth.dart';

import '../util/magic_strings.dart';

class AuthRepository {
  AuthRepository._inst();
  static final AuthRepository _instance = AuthRepository._inst();
  static AuthRepository get instance => _instance;
  Future<UserCredential> signIn(String password) async {
    return await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: AuthData.email,
      password: password,
    );
  }

  Future<void> signOut() async => await FirebaseAuth.instance.signOut();
}
