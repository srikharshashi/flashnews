import 'dart:convert';
import 'package:newsapp/models/article_model.dart';
import 'package:http/http.dart' as http;
class News
{
  List<ArticleModel> news =[];
  //Fetches Main Headline News
  Future<void> getnews() async
  {

    //URL for Head Line in a particular country

    String url="https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=6b0cc20bce364f09aa6d867d7e2558ff";

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
                   articleModel=ArticleModel(url: element["url"],
                      title: element["title"],
                      author: element["author"],
                      description: element["description"],
                      content: element["content"],
                      urlToImage: element["urlToImage"],
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
  }

}