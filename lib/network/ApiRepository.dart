
import 'package:flutter_news_feed/network/ApiProvider.dart';

import 'model/News.dart';

class ApiRepository{
  final _provider = ApiProvider();

  Future<News> fetchAppleNews() {
    return _provider.fetchAppleNews();
  }
}

class NetworkError extends Error {}
