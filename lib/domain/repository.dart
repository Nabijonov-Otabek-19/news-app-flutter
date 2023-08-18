import 'dart:async';

import 'package:dio/dio.dart';
import 'package:news_app_bloc/utils/constants.dart';
import '../data/model/search/search_model.dart';
import '../data/model/top/top_model.dart';

// q=bitcoin&apiKey=8ce8a65495544de6976cc5de23fe3fca
// country=us&apiKey=8ce8a65495544de6976cc5de23fe3fca

class Api {
  final Dio dio;

  Api(this.dio);

  Future<List<SearchArticle>> search(String content) async {
    List<dynamic> model = [];

    try {
      var response = await dio.get(path_search, queryParameters: {
        'q': content, // bitcoin everything
      });

      model = response.data['articles'];
    } on DioException catch (e) {
      print("Search Dio error");
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        print('Error sending request!');
        print("Headline Error = ${e}");
      }
    }
    return (model).map((e) => SearchArticle.fromJson(e)).toList();
  }

  Future<List<TopArticle>> topHeadlines(String country,
      {String category = "general"}) async {
    List<dynamic> model = [];

    try {
      var response = await dio.get(path_topHeadlines, queryParameters: {
        'country': country,
        'category': category
      });

      model = response.data['articles'];
    } on DioException catch (e) {
      print("Headline Dio error");
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        print('Error sending request!');
        print("Headline Error = ${e}");
      }
    }
    return (model).map((e) => TopArticle.fromJson(e)).toList();
  }
}
