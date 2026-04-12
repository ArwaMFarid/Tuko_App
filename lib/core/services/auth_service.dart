import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // فانكشن اللوجين
  Future<UserCredential?> loginWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      return await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      // هنا بتعالجي الأخطاء (زي إن الباسورد غلط أو الإيميل مش موجود)
      print("Error: ${e.code}");
      return null;
    }
  }
}