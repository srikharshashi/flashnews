import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/helpers/news.dart';
import 'package:newsapp/screens/article_view.dart';



//Scroll Behaviour
class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

//Cateogry Tile in the Home

class CatTile extends StatefulWidget {
  final  String imgUrl , catName;
  CatTile({this.imgUrl,this.catName});

  @override
  _CatTileState createState() => _CatTileState();
}

class _CatTileState extends State<CatTile>
{
  News newsob;

  @override
  Widget build(BuildContext context) {
    // return
    return
      // GestureDetector(
      //   onTap: ()
      //   {
      //     newsob=News();
      //     newsob.getnews(widget.catName.toLowerCase());
      //     setState(() {
      //
      //
      //     });
      //   },
      //   child:
        Container(

          decoration: BoxDecoration(
            color: Colors.black26,
          ),
          margin: EdgeInsets.all(10),
          child: Stack(
            children: [
              ClipRRect(
                child: CachedNetworkImage(imageUrl:widget.imgUrl,height: 90,width: 130,fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(15),
              ),
              Container(
                child: Text(widget.catName,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),),
                decoration: BoxDecoration(
                  color: Colors.black26,
                ),
                height: 90,
                width: 130,
                alignment: Alignment.center,
              ),
            ],
          ),
        );


  }
}


//Blog Tile
class BlogTile extends StatelessWidget {

final String imageUrl,title,desc,url;
BlogTile({@required this.imageUrl,@required this.title,@required this.desc,@required this.url});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()
      {
        Navigator.push(context, MaterialPageRoute(
            builder: (context)
                {
                  return ArticleView(blogurl:url,);
                }
        ));
      },
      child:
      Padding(

        padding: const EdgeInsets.all(8.0),
        child: Container(

          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            // border: Border.all(color: Colors.white),
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(20)
          ),
          child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: ClipRRect(
                  child: Image.network(imageUrl ?? "https://images.unsplash.com/photo-1458419948946-19fb2cc296af?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80"
                    ,width: 250,),
                  borderRadius: BorderRadius.circular(20),

                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(title,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),),
              ),
              SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.fromLTRB(8,2,8,10),
                child: Text(desc,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w100)),
              ),

            ],
          ),
        ),
    ),
      );

  }
}


