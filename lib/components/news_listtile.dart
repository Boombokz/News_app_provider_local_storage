import 'package:flutter/material.dart';
import 'package:flutter_news_api/data/models/articles.dart';
import 'package:flutter_news_api/screens/detailed_news_screen/detailed_news_screen.dart';
import 'package:intl/intl.dart';
import 'package:transparent_image/transparent_image.dart';

class NewsListTile extends StatelessWidget {
  final Article article;

  NewsListTile({required this.article});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailedNewsScreen(article: article)));
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        '${article.title}',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(fontWeight: FontWeight.bold),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 8),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: FadeInImage.memoryNetwork(
                        fadeInDuration: Duration(milliseconds: 150),
                        fadeOutDuration: Duration(milliseconds: 150),
                        width: 60,
                        height: 60,
                        image: article.urlToImage,
                        fit: BoxFit.cover,
                        placeholder: kTransparentImage,
                        imageErrorBuilder: (BuildContext context,
                            Object exception, StackTrace? stackTrace) {
                          return Container(
                              height: 60, width: 60, child: Placeholder());
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  '${article.description}',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${DateFormat('MMM, dd').format(article.publishedAt)} ${DateFormat.jm().format(article.publishedAt)}',
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    Text(
                      ' ${article.source.name}',
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
