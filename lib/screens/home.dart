import 'package:flutter/material.dart';
import 'package:newsapp/helpers/data.dart';
import 'package:newsapp/helpers/news.dart';
import 'package:newsapp/models/article_model.dart';
import 'package:newsapp/models/catmodel.dart';
import 'package:newsapp/widgets/widgets.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  List<CategoryModel> categories = [];
  List<ArticleModel> articles = [];
  bool _loading = true;

  void initState() {
    // TODO: implement initState
    super.initState();
    print("In init State");
    categories = getCategories();
    print("Loaded cats");
    getnews();
  }

  void getnews() async {
    News newsob = News();
    await newsob.getnews();
    articles = newsob.news;
    setState(() {
      _loading = false;
    });
    print("Got news");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Flash",
              style: TextStyle(color: Colors.white),
            ),
            Text(
              "News",
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black12,
      body: _loading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : Container(
              child: Column(
                children: [
                  //Category
                  ScrollConfiguration(
                    behavior: MyBehavior(),
                    

                        child: Container(
                          height: 100,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: categories.length,
                              itemBuilder: (context, index) {
                                return Container(

                                    child: CatTile(
                                        imgUrl: categories[index].imageUrl,
                                        catName: categories[index].catName));
                              }),
                        ),

                    ),
                  //Blog Cards
                      Expanded(
                        child: Container(
                          child: ListView.builder(
                            itemCount: articles.length,
                              itemBuilder: (context,index)
                          {
                            return BlogTile(imageUrl: articles[index].urlToImage ?? "",
                              title: articles[index].title ?? "",
                              desc: articles[index].description ?? "",
                            );
                          }
                          ),

                        ),
                      ),


                  ],
              ),
              ),

    );
  }
}
