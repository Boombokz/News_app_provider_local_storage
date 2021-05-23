import 'package:flutter/material.dart';
import 'package:flutter_news_api/screens/home_screen/components/favorites_tab/provider/favorites_news_provider.dart';
import 'package:flutter_news_api/components/news_listtile.dart';
import 'package:provider/provider.dart';

class FavoritesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<FavoritesNewsProvider>(
      builder: (BuildContext context, item, Widget? child) {
        if (item.articlesCount == 0) {
          return Center(
            child: Text(
              'There are not favorites yet...',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          );
        }
        return ListView.builder(
            itemCount: item.articlesCount,
            itemBuilder: (context, index) {
              return NewsListTile(article: item.articles[index]);
            });
      },
    );
  }
}
