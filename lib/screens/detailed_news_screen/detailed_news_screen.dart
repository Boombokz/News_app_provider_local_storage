import 'package:flutter/material.dart';
import 'package:flutter_news_api/data/models/articles.dart';
import 'package:flutter_news_api/screens/home_screen/components/favorites_tab/provider/favorites_news_provider.dart';
import 'package:provider/provider.dart';

class DetailedNewsScreen extends StatefulWidget {
  final Article article;

  DetailedNewsScreen({required this.article});

  @override
  _DetailedNewsScreenState createState() => _DetailedNewsScreenState();
}

class _DetailedNewsScreenState extends State<DetailedNewsScreen> {
  @override
  Widget build(BuildContext context) {
    FavoritesNewsProvider state = Provider.of<FavoritesNewsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('IT News'),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: () {
                // state.clear();
                if (state.isFavorite(widget.article) == false) {
                  state.addFavorite(widget.article);
                } else {
                  state.removeFavorite(widget.article);
                }
              },
              child: Icon(state.isFavorite(widget.article)
                  ? Icons.favorite
                  : Icons.favorite_outline_sharp),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(widget.article.urlToImage)),
            ),
            SizedBox(height: 12),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Text(
                    '${widget.article.title}',
                    style: Theme.of(context).textTheme.headline6,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Text('Author: ${widget.article.author}'),
                  SizedBox(height: 20),
                  Text('Source: ${widget.article.source.name}'),
                  SizedBox(height: 20),
                  Text('${widget.article.content}'),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
