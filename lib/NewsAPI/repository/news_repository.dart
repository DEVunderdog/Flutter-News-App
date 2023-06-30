import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:the_news_app/NewsAPI/models/news_model.dart';
import 'package:the_news_app/NewsAPI/constants/news_api_constants.dart';

class NewsRepository {
  Future<List<NewsModel>> fetchNews() async {
    String url =
        'https://newsapi.org/v2/top-headlines?q=business&languages=en&apiKey=2f41782089b9486491796eccf5952348';
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);
    List<NewsModel> articleModelList = [];
    if (response.statusCode == 200) {
      for (var data in jsonData[NewsApiConstants.articles]) {
        if (data[NewsApiConstants.urlToImage] != null) {
          NewsModel articleModel = NewsModel.fromJson(data);
          articleModelList.add(articleModel);
        }
      }
      return articleModelList;
    } else {
      return articleModelList;
    }
  }

  Future<List<NewsModel>> fetchBreakingNews() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=in&apiKey=${NewsApiConstants.newsApiKey}";
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    List<NewsModel> articleModelList = [];
    if (response.statusCode == 200) {
      for (var data in jsonData[NewsApiConstants.articles]) {
        if (data[NewsApiConstants.description].toString().isNotEmpty &&
            data[NewsApiConstants.urlToImage].toString().isNotEmpty) {
          NewsModel articelModel = NewsModel.fromJson(data);
          articleModelList.add(articelModel);
        }
      }
      return articleModelList;
    } else {
      return articleModelList;
    }
  }

  Future<List<NewsModel>> searchNews ({required String query}) async {
    String url = '';
    if(query.isEmpty) {
      url =  'https://newsapi.org/v2/everything?q=biden&from=2022-07-12&sortBy=popularity&apiKey=2f41782089b9486491796eccf5952348';

    } else {
      url = "https://newsapi.org/v2/everything?q=$query&from=2022-07-12&sortBy=popularity&apiKey=${NewsApiConstants.newsApiKey}";
    }

    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);
    List<NewsModel> articleModelList = [];
    if(response.statusCode == 200){
      for(var data in jsonData[NewsApiConstants.articles]){
        if(query.isNotEmpty && data[NewsApiConstants.urlToImage] != null){
          NewsModel articleModel = NewsModel.fromJson(data);
          articleModelList.add(articleModel);
        } else if (query.isEmpty){
          throw Exception('Query is empty');
        } else {
          throw Exception('Data was not loaded properly');
        }
      }
      return articleModelList;
    } else {
      return articleModelList;
    }
  }
}
