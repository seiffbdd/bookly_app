import 'package:dio/dio.dart';

class ApiServices {
  final String _baseUrl = 'https://www.googleapis.com/books/v1/';

  final Dio dio;
  ApiServices({required this.dio});

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    final response = await dio.get('$_baseUrl$endPoint');

    return response.data;
  }
}
