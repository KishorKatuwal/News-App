import 'dart:convert';
import '../models/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    var url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=5a578ffc327e4125b5faa6acf7a7f907");
    http.Response response =
        await http.get(url, headers: {'Accept': 'application/json'});

    var jsonData = json.decode(response.body);
    // print("response body: ${response.body}");

    if (jsonData['status'] == "ok") {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null &&
            element['description'] != null &&
            element['content'] != null &&
            element['title'] != null &&
            element['url'] != null &&
            element['author'] != null) {
          // print("inserted here");
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            content: element['content'],
          );

          // print("here i am");

          news.add(articleModel);
        }
      });
    }
  }
}

class CategoryNewsClass {
  List<ArticleModel> news = [];

  Future<void> getNews(String category) async {
    var url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=5a578ffc327e4125b5faa6acf7a7f907");
    http.Response response =
        await http.get(url, headers: {'Accept': 'application/json'});

    var jsonData = json.decode(response.body);
    // print("response body: ${response.body}");

    if (jsonData['status'] == "ok") {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null &&
            element['description'] != null &&
            element['content'] != null &&
            element['title'] != null &&
            element['url'] != null &&
            element['author'] != null) {
          // print("inserted here");
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            content: element['content'],
          );

          // print("here i am");

          news.add(articleModel);
        }
      });
    }
  }
}
