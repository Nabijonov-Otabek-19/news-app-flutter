import 'package:dio/dio.dart';
import 'package:news_app_bloc/utils/constants.dart';

class BaseApi {
  final _dio = Dio(
    BaseOptions(
      queryParameters: {'apiKey': api_key},
      baseUrl: base_url,
      validateStatus: (status) => true,
    ),
  );

  Dio get dio => _dio;
}
