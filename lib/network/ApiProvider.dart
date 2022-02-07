import 'dart:developer';

import 'package:dio/dio.dart';

import 'model/News.dart';

class ApiProvider {
  final Dio _dio = Dio();
  final String _apiKey = "950191008b904f3686e6f444b5e1aa32";
  final String _baseUrl = "https://newsapi.org/v2/";
  Future<News> fetchAppleNews() async {
    try {
      Response response = await _dio.get(_baseUrl +
          'everything?q=apple&from=2022-02-01&to=2022-02-03&sortBy=publishedAt&apiKey=$_apiKey');
      return News.fromJson(response.data);
    } catch (error, stackTrace) {
      log("Exception detected: " +
          error.toString() +
          ", stackTrace: " +
          stackTrace.toString());
      return News.withError("Data not found / Connection issue");
    }
  }
}
