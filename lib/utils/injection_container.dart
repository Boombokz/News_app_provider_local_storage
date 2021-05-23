import 'package:dio/dio.dart';
import 'package:flutter_news_api/constants/network/network_const.dart';
import 'package:flutter_news_api/data/network/news_api.dart';
import 'package:flutter_news_api/data/repository/news_repository.dart';
import 'package:flutter_news_api/screens/home_screen/components/top_news_tab/provider/top_news_provider.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupInjections() {
  //Data
  getIt.registerLazySingleton<Dio>(() => Dio(BaseOptions(
        contentType: "application/json;charset=UTF-8",
        baseUrl: BASE_URL,
        queryParameters: {'apiKey': API_KEY},
      )));
  getIt.registerLazySingleton<NewsAPI>(() => NewsAPI(getIt()));
  getIt.registerLazySingleton<NewsRepository>(() => NewsRepository(getIt()));
}
