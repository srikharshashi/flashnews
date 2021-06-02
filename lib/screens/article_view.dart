import 'package:webview_flutter/webview_flutter.dart';
import "package:flutter/material.dart";
class ArticleView extends StatefulWidget {

  String blogurl;
  ArticleView({this.blogurl});
  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          // mainAxisAlignment: MainAxisAlignment.center,
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

     body: Container(
      child:
        WebView(
          initialUrl: widget.blogurl,
          javascriptMode: JavascriptMode.unrestricted,
        )
      )
    );
  }
}
