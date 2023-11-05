import 'dart:convert';

import 'package:http/http.dart';

import '../model/nesw_model.dart';

class ApiService {
  final all_news_url =
      "https://newsapi.org/v2/everything?q=bitcoin&apiKey=45ee07653f204017bf2de4f38c938606";
  final breaking_news_url =
      "https://newsapi.org/v2/top-headlines?country=us&apiKey=45ee07653f204017bf2de4f38c938606";

  Future<List<NewsModel>> getAllNews() async {
    try {
      Response response = await get(Uri.parse(all_news_url));
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        List<dynamic> body = json['articles'];
        List<NewsModel> articlelist =
            body.map((e) => NewsModel.fromJson(e)).toList();
        return articlelist;
      } else {
        throw ("No news found");
      }
    } catch (e) {
      throw e;
    }
  }

  Future<List<NewsModel>> getbreakingnews() async {
    try {
      Response response = await get(Uri.parse(breaking_news_url));
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        List<dynamic> body = json['articles'];
        List<NewsModel> articlelist =
            body.map((e) => NewsModel.fromJson(e)).toList();
        return articlelist;
      } else {
        throw ("No news found");
      }
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
