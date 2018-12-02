import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'home_page.dart';

class SliderScreen extends StatefulWidget {
  _SliderScreenState createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  List<Slide> slides = new List();


  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        title: "FLUTTER",
        description:
            "Get Faster Development, Flexible UI & Access Native Features. Learn More! High-Quality Interfaces. Flexible UI. Fast Development.",
        pathImage: "assets/images/flutter.gif",
        backgroundColor: Color(0xfff5a623),
      ),
    );
    slides.add(
      new Slide(
        title: "DART",
        description:
            "Developers at Google and elsewhere use Dart to create high-quality, mission-critical apps for iOS, Android, and the web. With features aimed at client-side development, Dart is a great fit for both mobile and web apps.",
        pathImage: "assets/images/dart.png",
        backgroundColor: Color(0xff1ca9da),
      ),
    );
    slides.add(
      new Slide(
        title: "WELCOME",
        description:
            "请开始你的表演, six six six",
        pathImage: "assets/images/flutter_3.gif",
        backgroundColor: Color(0xff203152),
      ),
    );
  }

  void onDonePress() {
    Navigator.of(context).pushAndRemoveUntil(
      new MaterialPageRoute(
        builder: (context) => MyHomePage(
          title: '开始用qq登陆吧'
        )
      )
      , (route) => route == null);
  }

  void onSkipPress() {
    Navigator.of(context).pushAndRemoveUntil(
      new MaterialPageRoute(
        builder: (context) => MyHomePage(
          title: '开始用qq登陆吧'
        )
      )
      , (route) => route == null);
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      slides: this.slides,
      onDonePress: this.onDonePress,
      onSkipPress: this.onSkipPress,
    );
  }
}
