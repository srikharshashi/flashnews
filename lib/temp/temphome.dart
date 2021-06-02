import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TempHome extends StatefulWidget {
  const TempHome({Key key}) : super(key: key);

  @override
  _TempHomeState createState() => _TempHomeState();
}

class _TempHomeState extends State<TempHome> {
  List<Container> conts=[
  Container(decoration: BoxDecoration(border:Border.all(color: Colors.white)),),
  Container(decoration: BoxDecoration(border:Border.all(color: Colors.white)),),
  Container(decoration: BoxDecoration(border:Border.all(color: Colors.white)),),
  Container(decoration: BoxDecoration(border:Border.all(color: Colors.white)),),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar:AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Flash",style: TextStyle(color: Colors.red),),
            Text("News",style: TextStyle(color: Colors.white),),
          ],
        ),
      ) ,
      body:Padding(
        padding: EdgeInsets.all(5),
        child: ListView(
            children: [
              ListView.builder(
                shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  // physics: ClampingScrollPhysics(),
                  itemBuilder: (context,index)

                            {
                              return (conts[index]);
                            },
                itemCount:conts.length,
              )
            ],
          ),
          

      ),
    );
  }
}
