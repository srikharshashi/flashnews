import 'package:flutter/cupertino.dart';

class ArticleModel
{
  //This is a API Helper class to model the data for the API we are using

  String title;
  String author;
  String description;
  String url;
  String urlToImage;
  String content;
  // DateTime publishedAt;

  ArticleModel({@required this.url,@required this.title,@required this.author,@required this.description,@required this.content,@required this.urlToImage});

}