import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:finalproject/models/user_model.dart';

class FireBaseStorage {
  static final FireBaseStorage instance = FireBaseStorage._internal();

  FireBaseStorage._internal();

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final String collectionName = 'Users';

  Future<void> storeUserData(UserModel user) async {
    try {
      final String? userId = FirebaseAuth.instance.currentUser?.uid;
      if (userId != null) {
        await firestore
            .collection(collectionName)
            .doc(userId)
            .set(user.toJson());
      } else {
        throw Exception("User is not logged in.");
      }
    } catch (e) {
      print("Firestore Error: $e");
      rethrow;
    }
  }

  Future<UserModel?> getUserData() async {
    try {
      final String? userId = FirebaseAuth.instance.currentUser?.uid;

      if (userId != null) {
        final docSnapshot =
            await firestore.collection(collectionName).doc(userId).get();

        if (docSnapshot.exists && docSnapshot.data() != null) {
          return UserModel.fromJson(docSnapshot.data()!);
        }
      }
      return null;
    } catch (e) {
      print("Error getting user data: $e");
      rethrow;
    }
  }

  Future<void> updateUserData(UserModel user) async {
    try {
      final String? userId = FirebaseAuth.instance.currentUser?.uid;

      if (userId != null) {
        await firestore
            .collection(collectionName)
            .doc(userId)
            .update(user.toJson());
      } else {
        throw Exception("User is not logged in.");
      }
    } catch (e) {
      print("Error updating user data: $e");
      rethrow;
    }
  }
}
