import 'package:flutter/material.dart';
import 'package:newsapp/screens/home.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}



