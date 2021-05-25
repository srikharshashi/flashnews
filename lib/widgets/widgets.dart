import 'package:flutter/material.dart';


//Scroll Behaviour
class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

//Cateogry Tile in the Home

class CatTile extends StatelessWidget {
  final imgUrl,catName;
  CatTile({this.imgUrl,this.catName});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(

        decoration: BoxDecoration(
          color: Colors.black26,

        ),
        margin: EdgeInsets.all(10),
        child: Stack(
          children: [
            ClipRRect(
              child: Image.network(imgUrl,height: 90,width: 130,fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(15),
            ),
            Container(
              child: Text(catName,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),),
              decoration: BoxDecoration(
                color: Colors.black26,
              ),
              height: 90,
              width: 130,
              alignment: Alignment.center,
            ),
          ],
        ),
      ),
    );
  }
}


//Blog Tile
class BlogTile extends StatelessWidget {

final String imageUrl,title,desc;
BlogTile({@required this.imageUrl,@required this.title,@required this.desc});
  @override
  Widget build(BuildContext context) {
    return Padding(

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
            ClipRRect(child: Image.network(imageUrl,height: 200,width: 250,),
            borderRadius: BorderRadius.circular(10),),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(title,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.fromLTRB(8,2,8,10),
              child: Text(desc,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w100)),
            ),

          ],
        ),
      ),
    );
  }
}


