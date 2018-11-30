
import 'package:flutter/material.dart';
import 'boot_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter App',
      theme: new ThemeData.dark(),
      home: Container(
        child: SliderScreen(),
      ),
    );
  }
}