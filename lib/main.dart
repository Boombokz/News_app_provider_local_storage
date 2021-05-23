import 'package:flutter/material.dart';
import 'package:flutter_news_api/screens/home_screen/components/favorites_tab/provider/favorites_news_provider.dart';
import 'package:flutter_news_api/screens/home_screen/home_screen.dart';
import 'package:flutter_news_api/screens/home_screen/components/top_news_tab/provider/top_news_provider.dart';
import 'package:flutter_news_api/utils/hive_init.dart';
import 'package:flutter_news_api/utils/injection_container.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  setupInjections();
  await Hive.initFlutter();
  await initHive();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => TopNewsProvider(getIt())
              ..isLoading = true
              ..getTopNews()
              ..isLoading = false),
        ChangeNotifierProvider(
            create: (context) => FavoritesNewsProvider()..initList()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
