import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_news_api/data/models/articles.dart';

class NewsAPI {
  NewsAPI(this.dio);

  Dio dio;

  Future<List<Article>> fetchTopNews(int page, int pageSize) async {
    try {
      Response response =
          await dio.get('top-headlines?q=it&page=$page&pageSize=$pageSize');
      if (response.statusCode == 200) {
        print(response.statusCode);
        return (response.data['articles'] as List)
            .map((e) => Article.fromJson(e))
            .toList();
      } else {
        print(response.statusCode);
        throw Exception();
      }
    } catch (e, s) {
      debugPrintStack(label: e.toString(), stackTrace: s);
      return [];
    }
  }
}
