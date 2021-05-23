import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_news_api/components/news_listtile.dart';
import 'package:flutter_news_api/screens/home_screen/components/top_news_tab/provider/top_news_provider.dart';
import 'package:provider/provider.dart';

class TopNewsTab extends StatelessWidget {
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    TopNewsProvider state = Provider.of<TopNewsProvider>(context);
    return ListView.builder(
        controller: scrollController
          ..addListener(() {
            if (scrollController.offset ==
                    scrollController.position.maxScrollExtent &&
                state.isLoading == false) {
              state.page++;
              state.getTopNews();
              state.isLoading = true;
            }
          }),
        itemCount: state.topNews.length + (state.isLoading ? 0 : 1),
        itemBuilder: (context, index) {
          if (index < state.topNews.length) {
            return NewsListTile(
              article: state.topNews[index],
            );
          } else {
            //NewsApi maximum 100 requests
            if (index < 100) {
              Timer(Duration(milliseconds: 30), () {
                scrollController
                    .jumpTo(scrollController.position.maxScrollExtent);
              });
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              return Offstage();
            }
          }
        });
  }
}
