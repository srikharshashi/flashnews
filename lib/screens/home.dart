import 'package:flutter/material.dart';
import 'package:newsapp/helpers/data.dart';
import 'package:newsapp/helpers/news.dart';
import 'package:newsapp/models/catmodel.dart';
import 'package:newsapp/widgets/widgets.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  News newsob;
  List<CategoryModel> categories = [];
  var articles = [];
  bool _loading = true;
  String cat = "business";

  void initState() {
    // TODO: implement initState
    super.initState();
    print("In init State");
    categories = getCategories();
    print("Loaded cats");
    getnews(cat);
  }

  void getnews(String cat) async {
    setState(() {
      _loading = true;
    });
    newsob = News();
    await newsob.getnews(cat);
    articles.clear();
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
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.centerRight,
                child: Text(
                  "Flash",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "News",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ),
            Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Icon(Icons.search),
                )),
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
              child: ListView(
                children: [
                  //Category
                  Container(
                    height: 100,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              print(categories[index].catName.toLowerCase());
                              getnews(categories[index].catName.toLowerCase());
                              print("After on Tap");
                            },
                            child: Container(
                                child: CatTile(
                                    imgUrl: categories[index].imageUrl ?? "",
                                    catName: categories[index].catName)),
                          );
                        }),
                  ),

                  //Blog Cards
                  Container(
                    child: ListView.builder(
                        physics: ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: articles.length,
                        itemBuilder: (context, index) {
                          print(articles[index].urlToImage);
                          return BlogTile(
                            imageUrl: articles[index].urlToImage ??
                                "https://images.unsplash.com/photo-1458419948946-19fb2cc296af?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80",
                            title: articles[index].title ?? "",
                            desc: articles[index].description ?? "",
                            url: articles[index].url ?? "",
                          );
                        }),
                  ),
                ],
              ),
            ),
      drawer: Drawer(
        child: Container(
          color: Colors.black87,
          child: ListView(
            padding: EdgeInsets.all(0),
            children: [
              DrawerHeader(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: CircleAvatar(
                          backgroundColor: Colors.brown.shade800,
                          child: const Text('AH'),
                          radius: 35,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10,15,10,0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Flash",style: TextStyle(color: Colors.white,fontSize: 18)),
                            Text("News",style: TextStyle(color: Colors.red,fontSize: 18),)

                          ],
                        ),
                      )

                    ],
                  )
              ),
              buildMenuItem("Profile", Icons.person),
              buildMenuItem("Search", Icons.search),
              buildMenuItem("Settings", Icons.settings),

            ],
          ),
        ),
      ),
    );
  }

  Widget buildMenuItem(@required var text, @required IconData icon) {
    final color = Colors.white;

    return Padding(
      padding: EdgeInsets.all(10),
      child: ListTile(
        leading: Icon(
          icon,
          color: color,
        ),
        title: Text(
          text,
          style: TextStyle(color: color),
        ),
        onTap: () {},
      ),
    );
  }
}
