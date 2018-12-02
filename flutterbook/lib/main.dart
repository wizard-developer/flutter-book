
import 'package:flutter/material.dart';
import 'boot_page.dart';


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter App',
      theme: new ThemeData.dark(),
      routes: {
        '/slider_page': (BuildContext context) => SliderScreen()
      },
      home: Container(
        child: SliderScreen(),
      ),
    );
  }
}