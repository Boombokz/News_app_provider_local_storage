import 'package:flutter/material.dart';
import 'package:flutter_news_api/screens/home_screen/components/favorites_tab/favorites_tab.dart';
import 'package:flutter_news_api/screens/home_screen/components/top_news_tab/top_news_tab.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('TOP News'),
          centerTitle: true,
          bottom: TabBar(
            indicator: UnderlineTabIndicator(
                borderSide: BorderSide(width: 2.0, color: Colors.white),
                insets: EdgeInsets.symmetric(horizontal: 16.0)),
            tabs: [
              Tab(
                child: Text('Top'),
              ),
              Tab(
                child: Text('Favorites'),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            TopNewsTab(),
            FavoritesTab(),
          ],
        ),
      ),
    );
  }
}
