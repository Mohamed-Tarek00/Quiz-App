import 'package:finalproject/models/user_model.dart';
import 'package:finalproject/services/auth_service.dart';
import 'package:finalproject/services/firebase_storage.dart';
import 'package:finalproject/utils/app_enums.dart';
import 'package:flutter/material.dart';

class TopUsersProvider extends ChangeNotifier {
  List<UserModel> users = [];
  AppState state = AppState.init;
  String? errMessage;

  Future<void> getTopUsers() async {
    state = AppState.loading;
    errMessage = null;
    notifyListeners();

    try {
      final response =
          await FireBaseStorage.instance.firestore
              .collection(FireBaseStorage.instance.collectionName)
              .orderBy('totalCorrectAnswers', descending: true)
              .limit(10)
              .get();

      final String? currentUserId = AuthService.instance.currentUserId;
      users.clear();

      for (final userSnapshot in response.docs) {
        final data = userSnapshot.data();
        final user = UserModel.fromJson(data);

        if (userSnapshot.id == currentUserId) {
          user.userName = "You";
        }

        users.add(user);
      }

      state = users.isEmpty ? AppState.emptyData : AppState.success;
    } catch (e) {
      errMessage = e.toString();
      state = AppState.error;
    }

    notifyListeners();
  }
}
