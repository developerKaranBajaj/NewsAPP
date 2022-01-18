import 'dart:convert';
import 'package:newsapp/models/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  var news = <ArticleModel>[];

  Future<void> getNews() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=in&apiKey=a06c875433bb4ae6bb60f876e258f993";

    // await Future.delayed(const Duration(milliseconds: 2));
    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if (jsonData["status"] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element["description"] != null) {
          ArticleModel articleModel = ArticleModel(
            auther: element['auther'],
            title: element['title'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            content: element['content'],
            // publishedAt: element['publishedAt'],
            id: element['source']['id'],
            name: element['source']['name'],
          );

          news.add(articleModel);
        }
      });
    }
  }
}

class NewsForCategorie {

  List<ArticleModel> news  = [];

  Future<void> getNewsForCategory(String category) async{

    String url =
        "https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=a06c875433bb4ae6bb60f876e258f993";

    // await Future.delayed(const Duration(milliseconds: 2));
    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if (jsonData["status"] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element["description"] != null) {
          ArticleModel articleModel = ArticleModel(
            auther: element['auther'],
            title: element['title'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            content: element['content'],
            // publishedAt: element['publishedAt'],
            id: element['source']['id'],
            name: element['source']['name'],
          );

          news.add(articleModel);
        }
      });
    }
  }
}


