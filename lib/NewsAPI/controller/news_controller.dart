import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:the_news_app/NewsAPI/models/article_model.dart';
import 'package:the_news_app/NewsAPI/models/news_model.dart';
import 'package:the_news_app/NewsAPI/constants/news_api_constants.dart';

class NewsController extends GetxController{
  List<ArticleModel> allNews = <ArticleModel> [];
  RxBool articleNotFound = false.obs;
  String baseUrl = "https://newsapi.org/v2/top-headlines?";
  List<ArticleModel> breakingNews = <ArticleModel>[];
  RxString cName = ''.obs;
  RxString category  = ''.obs;
  RxString channel = ''.obs;
  RxString country = ''.obs;
  RxBool isLoading = false.obs;
  RxInt pageNum = 1.obs;
  RxInt pageSize = 10.obs;
  ScrollController scrollController = ScrollController();
  RxString searchNews = ''.obs;

  getBreakingNews({reload = false}) async {
    articleNotFound.value = false;

    if(!reload && isLoading.value == false){

    } else {
      country.value = '';
    }
    if(isLoading.value == true){
      pageNum++;
    } else {
      breakingNews = [];
      pageNum.value = 2;
    }
    baseUrl = "https://newsapi.org/v2/top-headlines?pageSize=10&page=$pageNum&languages=en&";
    baseUrl += country.isEmpty ? 'country=in&' : 'country=$country&';
    baseUrl += 'apiKey=${NewsApiConstants.newsApiKey}';
    print([baseUrl]);
    getBreakingNewsFromApi(baseUrl);
  }

  getBreakingNewsFromApi(url) async {
    http.Response res = await http.get(Uri.parse(url));

    if(res.statusCode == 200){
      NewsModel newsData = NewsModel.fromJson(jsonDecode(res.body));

      if(newsData.articles.isEmpty && newsData.totalResutls == 0){
        articleNotFound.value = isLoading.value == true ? false: true;
        isLoading.value = false;
        update();
      } else {
        if(isLoading.value == true){
          breakingNews = [...breakingNews, ...newsData.articles];
          update();
        } else {
          if(newsData.articles.isNotEmpty){
            breakingNews = newsData.articles;
            if(scrollController.hasClients) scrollController.jumpTo(0.0);
            update();
          }
        }
        articleNotFound.value = false;
        isLoading.value = false;
        update();
      }
    } else {
      articleNotFound.value = true;
      update();
    }
  }

  getAllNews({channel = '', searchKey = '', reload = false}) async{
    articleNotFound.value = false;

    if(!reload && isLoading.value == false){

    } else {
      country.value = '';
      category.value = '';
    }
    if(isLoading.value == true){
      pageNum++;
    } else {
      allNews = [];
      pageNum.value = 2;
    }

    baseUrl = "https://newsapi.org/v2/top-headlines?country=in&apiKey=2f41782089b9486491796eccf5952348";
    print(baseUrl);
    getAllNewsFromApi(baseUrl);
    
  }

  getAllNewsFromApi(url) async {
    http.Response res = await http.get(Uri.parse(url));

    if(res.statusCode == 200){
      NewsModel newsData = NewsModel.fromJson(jsonDecode(res.body));

      if(newsData.articles.isEmpty && newsData.totalResutls == 0){
        articleNotFound.value = isLoading.value == true ? false : true;
        isLoading.value =  false;
        update();
      } else {
        if(isLoading.value == true){
          allNews = [...allNews, ...newsData.articles];
          update();
        } else {
          if(newsData.articles.isNotEmpty){
            allNews = newsData.articles;
            if(scrollController.hasClients) scrollController.jumpTo(0.0);
            update();
          }
        }
        articleNotFound.value = false;
        isLoading.value = false;
        update();
      }
    } else {
      articleNotFound.value = true;
      update();
    }
  }
}