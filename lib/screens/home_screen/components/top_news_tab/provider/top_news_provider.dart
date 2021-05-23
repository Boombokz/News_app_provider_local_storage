import 'package:flutter/material.dart';
import 'package:flutter_news_api/data/models/articles.dart';
import 'package:flutter_news_api/data/repository/news_repository.dart';

class TopNewsProvider extends ChangeNotifier {
  final NewsRepository newsRepository;

  TopNewsProvider(this.newsRepository);

  final List<Article> topNews = [];
  int page = 1;
  bool isLoading = false;

  void getTopNews() async {
    //NewsApi is maximum 100 requests
    if (topNews.length < 100) {
      topNews.addAll(await newsRepository.getTopNews(this.page, 20));
    }
    isLoading = false;
    notifyListeners();
  }
}
