import 'package:flutter_news_api/data/models/articles.dart';
import 'package:flutter_news_api/data/network/news_api.dart';

class NewsRepository {
  NewsRepository(this.newsAPI);

  NewsAPI newsAPI;

  Future<List<Article>> getTopNews(int page, int pageSize) async {
    return await newsAPI.fetchTopNews(page, pageSize);
  }
}
