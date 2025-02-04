import 'dart:convert';
import 'package:news_app_/models/article_model.dart';
import 'package:http/http.dart' as http;
import 'package:news_app_/models/silder_model.dart';
import 'package:news_app_/models/show_category.dart';

class ShowCategoryNews {
  List<ShowCategoryModel> categories = [];

  Future<void> getCategoriesNews(String category) async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=54145bc9681c42de9a6cc831aa90502b";
    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element['description'] != null) {
          ShowCategoryModel categoryModel = ShowCategoryModel(
            title: element["title"],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            content: element["content"],
            Author: element["author"],
          );
          categories.add(categoryModel);
        }
      });
    }
  }
}
