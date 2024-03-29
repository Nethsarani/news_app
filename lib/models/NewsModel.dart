import 'dart:convert';
import 'package:http/http.dart' as http;

class NewsModel{

  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? content;

  NewsModel({this.author, this.content, this.description, this.title, this.url, this.urlToImage});
}

class ShowNews {
  List<NewsModel> categories = [];

  Future<void> getNewsCategory(String category, String sort) async {

    String sorting="publishedAt";
    if(sort=="Popularity"){
      sorting="popularity";
    }
    else if(sort=="Newest first"){
      sorting="publishedAt";
    }
    String url =
        "https://newsapi.org/v2/top-headlines?country=us&category=$category&sortBy=$sorting&apiKey=ebda3ebe78624bd1a4eead65da01440f";
    if(category=="all"){
      url =
      "https://newsapi.org/v2/top-headlines?country=us&sortBy=$sorting&apiKey=ebda3ebe78624bd1a4eead65da01440f";
    }
    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element['description'] != null) {
          NewsModel categoryModel = NewsModel(
            title: element["title"],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            content: element["content"],
            author: element["author"],
          );
          categories.add(categoryModel);
        }
      });
    }
  }

  Future<void> getNewsSearch(String keyword) async {
    String url =
        "https://newsapi.org/v2/everything?q=$keyword&apiKey=ebda3ebe78624bd1a4eead65da01440f";
    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element['description'] != null) {
          NewsModel categoryModel = NewsModel(
            title: element["title"],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            content: element["content"],
            author: element["author"],
          );
          categories.add(categoryModel);
        }
      });
    }
  }

}