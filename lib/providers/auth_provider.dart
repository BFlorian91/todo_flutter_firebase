import 'package:firebase_auth/firebase_auth.dart';

class AuthProvider {
  final FirebaseAuth _firebaseAuth;

  AuthProvider(this._firebaseAuth);

  Stream<User?> get authStateChanges => _firebaseAuth.idTokenChanges();

  Future<String> signOut() async {
    return 'SignOut';
  }

  Future<String> signIn() async {
    return 'SignIn';
  }

  Future<String> signUp() async {
    return 'SignUp';
  }
}
