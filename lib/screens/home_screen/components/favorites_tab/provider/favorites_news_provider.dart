import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_news_api/data/models/articles.dart';
import 'package:hive/hive.dart';

class FavoritesNewsProvider extends ChangeNotifier {
  final box = Hive.box<Article>('favorites');

  List<Article> _articles = [];

  void initList() {
    _articles = box.values.toList();
    notifyListeners();
  }

  bool isFavorite(Article article) {
    if (article.isFavorite == false) {
      return false;
    } else {
      return true;
    }
  }

  int get articlesCount {
    return _articles.length;
  }

  UnmodifiableListView<Article> get articles {
    return UnmodifiableListView(_articles);
  }

  void addFavorite(Article article) async {
    await box.add(article..isFavorite = true);

    initList();
  }

  void removeFavorite(Article article) async {
    int index = _articles.indexOf(article);
    article.isFavorite = false;
    await box.deleteAt(index);
    initList();
  }

  void clear() {
    box.clear();
  }
}
