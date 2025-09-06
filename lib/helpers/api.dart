import 'package:dio/dio.dart';

class Api {
  final Dio _dio = Dio();

  Future<Response> get({required String url}) async {
    try {
      Response response = await _dio.get(url);

      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception(
          "There is a problem with the status code ${response.statusCode}",
        );
      }
    } on DioException catch (e) {
      throw Exception('Dio error: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }
}
