import 'package:firebase_auth/firebase_auth.dart';
import 'package:target_challenge/auth/auth_error.dart';

abstract class AuthService {
  String? get userId;
  Future<void> signOut();
  Future<bool> login({
    required String email,
    required String password,
  });
}

class FirebaseAuthService implements AuthService {
  @override
  Future<bool> login({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw AuthError.from(e);
    }
    return FirebaseAuth.instance.currentUser != null;
  }

  @override
  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (_) {}
  }

  @override
  String? get userId => FirebaseAuth.instance.currentUser?.uid;
}
