import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginSuccessPage extends StatefulWidget {
  LoginSuccessPage({Key key, this.title}) : super(key: key);
  final String title;
  _LoginSuccessPageState createState() => _LoginSuccessPageState();
}

class _LoginSuccessPageState extends State<LoginSuccessPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.blueAccent,
      ),
      body: Builder(builder: (BuildContext context) {
        return Container(
         child: Center(
           child: IconButton(
             icon: Icon(FontAwesomeIcons.gamepad),
             onPressed: () {
              Navigator.of(context).pushNamed('/slider_page');
             },
           ),
         ),
        );
      }),
    );
  }
}
