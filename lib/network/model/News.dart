import './Article.dart';

class News {
  List<Article>? articles;
  String? error;

  News({
    this.articles,
  });

  News.withError(String errorMessage){
    error = errorMessage;
  }

  News.fromJson(Map<String, dynamic> json) {
    if(json['articles'] != null) {
      articles = [];
      json['articles'].forEach((value){
        articles!.add(Article.fromJson(value));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if(articles != null) {
      data['articles'] = articles!.map((value) => value.toJson()).toList();
    }
    return data;
  }
}
