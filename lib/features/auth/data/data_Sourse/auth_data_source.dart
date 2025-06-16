
import 'package:auvent_intership/features/auth/domain/entities/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';
  abstract class AuthDataSource {
  Future<User> login(String email, String password);
  Future<User> register(String email, String password);
  Future<void> signOut();

}



  class FirebaseAuthDataSource implements AuthDataSource {
    final FirebaseAuth _auth = FirebaseAuth.instance;

    @override
    Future<User> login(String email, String password) async {
      final result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return result.user!;
    }

    @override
    Future<User> register(String email, String password) async {
      final result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return result.user!;
    }

    @override
    Future<void> signOut() async {
      await _auth.signOut();
    }
  }
