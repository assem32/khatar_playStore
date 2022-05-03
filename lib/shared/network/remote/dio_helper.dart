import 'package:dio/dio.dart';

class DioHelper
{
  static late Dio dio;
  static init ()
  {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String URL,
    required Map<String, dynamic> ?Query,
  }) async
  {
    return await dio.get(URL, queryParameters: Query,);
  }
}