import 'package:firebase_auth/firebase_auth.dart';

import '../util/magic_strings.dart';

class AuthRepository {
  Future<String> signIn(String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: AuthData.email,
        password: password,
      );
      return '';
    } on FirebaseAuthException catch (e) {
      return e.message!;
    } catch (e) {
      return 'error';
    }
  }

  Future<void> signOut() async => await FirebaseAuth.instance.signOut();
}
