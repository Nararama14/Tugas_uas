import 'dart:convert';
import 'package:news_app_2110020031/model/article_model.dart';
import 'package:http/http.dart' as http;

class ApiService1 {
  final endPointUrl = "newsapi.org";
  final client = http.Client();

  Future<List<Article>> getArticle() async {
    final queryParameters = {
      //'country': 'id',
      'q': 'automotive',
      'apiKey': '9ab7b7ebdaf14e0ab9a47349672cc1d1'
    };

    final uri = Uri.https(endPointUrl, '/v2/everything', queryParameters);
    final response = await client.get(uri);
    Map<String, dynamic> json = jsonDecode(response.body);
    List<dynamic> body = json['articles'];
    List<Article> articles =
        body.map((dynamic item) => Article.fromJson(item)).toList();
    return articles;
  }
}