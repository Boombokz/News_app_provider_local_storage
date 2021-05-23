import 'package:flutter_news_api/data/models/articles.dart';
import 'package:hive/hive.dart';

initHive() async {
  Hive..registerAdapter(ArticleAdapter())..registerAdapter(SourceAdapter());
  await Hive.openBox<Article>('Favorites');
}
