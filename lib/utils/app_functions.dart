import 'package:finalproject/routes/app_routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/export.dart';

class AppFunctions {
  static void show({
    required BuildContext context,
    required int correctAnswers,
    required int totalQuestions,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder:
          (_) => AlertDialog(
            title: Text("Quiz DONE 🎉".tr),
            content: Text(
              "You answered @correctAnswers out of @totalQuestions questions correctly."
                  .trParams({
                    "correctAnswers": correctAnswers.toString(),
                    "totalQuestions": totalQuestions.toString(),
                  }),
              style: const TextStyle(fontSize: 16),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                    context,
                    AppRoutesName.homeRouteName,
                  );
                },
                child: Text("Ok".tr),
              ),
            ],
          ),
    );
  }
}
