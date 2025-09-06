import 'package:finalproject/helpers/api.dart';
import 'package:finalproject/models/category_model.dart';

class GetAllcategoriesService {
  Future<List<CategoryModel>> getAllCategory() async {
    try {
      final response = await Api().get(
        url: "https://opentdb.com/api_category.php",
      );

      final data = response.data;

      if (data == null || data['trivia_categories'] == null) {
        throw Exception(
          'No data or missing "trivia_categories" key in response',
        );
      }

      final List categoryList = data['trivia_categories'];

      List<CategoryModel> categories =
          categoryList
              .map((categoryJson) => CategoryModel.fromJson(categoryJson))
              .toList()
              .cast<CategoryModel>();

      return categories;
    } catch (e) {
      throw Exception("Failed to load categories: $e");
    }
  }
}
