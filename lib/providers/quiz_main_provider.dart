import 'package:finalproject/models/category_model.dart';
import 'package:finalproject/models/result_model.dart';
import 'package:finalproject/routes/app_routes_name.dart';
import 'package:finalproject/services/auth_service.dart';
import 'package:finalproject/services/firebase_storage.dart';
import 'package:finalproject/services/get_allCategories_service.dart';
import 'package:finalproject/services/get_category_quiz_service.dart';
import 'package:finalproject/utils/app_enums.dart';
import 'package:finalproject/utils/app_functions.dart';
import 'package:flutter/material.dart';

class QuizMainProvider extends ChangeNotifier {
  AppState appState = AppState.init;
  String errMesage = "";
  List<CategoryModel> categories = [];
  List<ResultModel> questions = [];
  int currentQuestion = 0;
  int correctAnswers = 0;

  Future<void> fetchCategories() async {
    try {
      appState = AppState.loading;
      final value = await GetAllcategoriesService().getAllCategory();
      if (value.isEmpty) {
        appState = AppState.emptyData;
      } else {
        categories = value;
        appState = AppState.success;
      }
    } on Exception catch (e) {
      appState = AppState.error;
      errMesage = e.toString();
    }
    notifyListeners();
  }

  void pushMethod(BuildContext context, CategoryModel category) {
    Navigator.pushNamed(
      context,
      AppRoutesName.quizRouteName,
      arguments: category,
    );
  }

  Future<void> fetchQuestions(int categoryId) async {
    try {
      appState = AppState.loading;
      final result = await GetCategoryQuizService().getCategoryQuiz(categoryId);
      if (result.isEmpty) {
        appState = AppState.emptyData;
      } else {
        questions = result;
        appState = AppState.success;
      }
    } catch (e) {
      errMesage = e.toString();
      appState = AppState.error;
    }
    notifyListeners();
  }

  void handleAnswer(String selectedAnswer, {required BuildContext context}) {
    if (currentQuestion >= questions.length) return;

    bool isCorrect = selectedAnswer == questions[currentQuestion].correctAnswer;
    if (isCorrect) {
      correctAnswers++;
    }

    Future.delayed(const Duration(milliseconds: 350), () {
      if (currentQuestion < questions.length - 1) {
        currentQuestion++;
        notifyListeners();
      } else {
        final currentUser = AuthService.instance.currentUser;
        currentUser!.totalCorrectAnswers =
            currentUser.totalCorrectAnswers! + correctAnswers;
        currentUser.totalQuestions =
            currentUser.totalQuestions! + questions.length;
        currentUser.totalQuizsCompelete = currentUser.totalQuizsCompelete! + 1;
        FireBaseStorage.instance.updateUserData(currentUser);
        AppFunctions.show(
          context: context,
          correctAnswers: correctAnswers,
          totalQuestions: questions.length,
        );
      }
    });
  }

  void resetQuiz() {
    currentQuestion = 0;
    correctAnswers = 0;
    questions = [];
    appState = AppState.init;
    notifyListeners();
  }
}
