import 'package:finalproject/helpers/api.dart';
import 'package:finalproject/models/result_model.dart';

class GetCategoryQuizService {
  Future<List<ResultModel>> getCategoryQuiz(int categoryId) async {
    try {
      final response = await Api().get(
        url:
            "https://opentdb.com/api.php?amount=10&category=$categoryId&type=multiple",
      );

      final resultsJson = response.data['results'] as List;

      List<ResultModel> questions =
          resultsJson
              .map((json) => ResultModel.fromJson(json as Map<String, dynamic>))
              .toList();

      return questions;
    } catch (e) {
      print("Error loading quiz: $e");
      rethrow;
    }
  }
}
