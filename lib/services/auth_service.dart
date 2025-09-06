import 'package:finalproject/models/user_model.dart';
import 'package:finalproject/services/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static final AuthService instance = AuthService._internal();
  AuthService._internal();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  UserModel? currentUser;

  String? get currentUserId => _auth.currentUser?.uid;

  Future<void> signUp({required String email, required String password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      currentUser = await FireBaseStorage.instance.getUserData();
    } on FirebaseAuthException catch (e) {
      print('Sign Up Error: ${e.code} - ${e.message}');
      rethrow;
    }
  }

  Future<void> login({required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);

      currentUser = await FireBaseStorage.instance.getUserData();
    } on FirebaseAuthException catch (e) {
      print('Sign In Error: ${e.code} - ${e.message}');
      rethrow;
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      currentUser = null;
    } catch (e) {
      print('Sign Out Error: $e');
      rethrow;
    }
  }

  bool isUserLoggedIn() {
    return _auth.currentUser != null;
  }
}
