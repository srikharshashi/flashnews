import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:newsapp/models/article_model.dart';
import 'package:http/http.dart' as http;
class News
{
  List<ArticleModel> news =[];
  //Fetches Main Headline News
  Future<void> getnews(String cat) async
  {
    String url="";
    //URL for Head Line in a particular country
    if(cat=="general")
     url="https://newsapi.org/v2/top-headlines?country=us&apiKey=76536a659548432eaae23af5baefa4a8";
    else
     url="https://newsapi.org/v2/top-headlines?country=in&category=${cat}&apiKey=76536a659548432eaae23af5baefa4a8";

    Uri parsedurl=Uri.parse(url);

    var response= await http.get(parsedurl);
    ArticleModel articleModel;
    var jsonData=jsonDecode(response.body);

    if(jsonData["status"]=="ok")
      {
        jsonData["articles"].forEach((element)
            {
              if(element["urlToImage"]!=null && element["description"]!= null )
                {
                  if(cat=="technology") {
                    print("In fecth");
                    // print(element["urlToImage"]);
                  }
                   articleModel=ArticleModel(url: element["url"],
                      title:  element["title"] ?? "",
                      description: element["description"] ?? "",
                      urlToImage: element["urlToImage"] ?? "https://images.unsplash.com/photo-1458419948946-19fb2cc296af?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80",
                      // publishedAt: element["publishedAt"]
                  );
                }
              if(news.contains(articleModel))
                print("Ok");
              else
                news.add(articleModel);
            }
        );
      }
    else
      print("Error fetching news ");
  }

}
