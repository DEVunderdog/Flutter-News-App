import 'article_model.dart';







class NewsModel {
  
  String status;
  int totalResutls;
  List<ArticleModel> articles;

  NewsModel(this.status, this.totalResutls, this.articles);

  Map<String, dynamic> toJson(){
    return {
      'status': status,
      'totalResults': totalResutls,
      'articles': articles
    };
  }

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
    json['status'],
    json['totalResults'],
    (json['articles'] as List<dynamic>).map((e) => ArticleModel.fromJson(e as Map<String,dynamic>)).toList()
  );
}

