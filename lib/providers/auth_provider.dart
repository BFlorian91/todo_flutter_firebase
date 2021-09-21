import 'package:firebase_auth/firebase_auth.dart';

class AuthProvider {
  // final FirebaseAuth _firebaseAuth;

  // AuthProvider(this._firebaseAuth);

  // Stream<User?> get authStateChanges => _firebaseAuth.idTokenChanges();

  Future<String> signOut() async {
    await FirebaseAuth.instance.signOut();
    return 'SignOut';
  }

  Future<String> signIn(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.';
      }
    }
    return 'Connecting...';
  }

  Future<String> signUp() async {
    return 'SignUp';
  }
}
