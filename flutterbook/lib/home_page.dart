import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_qq/flutter_qq.dart';
import 'package:flushbar/flushbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'login_success.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _output = '---';
  @override
  void initState() {
    super.initState();
  }

  Future<Null> _handleisQQInstalled() async {
    var result = await FlutterQq.isQQInstalled();
    var output;
    if (result) {
      output = "QQ已安装";
      Flushbar()
        ..title = output
        ..message = "您的手机已经安装了qq可以选择qq登陆"
        ..backgroundGradient = new LinearGradient(colors: [
          Color.fromRGBO(0, 210, 255, 1.0),
          Color.fromRGBO(58, 123, 213, 1.0)
        ])
        ..duration = Duration(seconds: 3)
        ..isDismissible = false
        ..showProgressIndicator = true
        ..show(context);
    } else {
      output = "QQ未安装";
    }
    setState(() {
      _output = output;
    });
  }

  Future<Null> _handleLogin() async {
    try {
      var qqResult = await FlutterQq.login();
      var output;
      if (qqResult.code == 0) {
        if (qqResult.response == null) {
          output = "登录成功qqResult.response==null";
          return;
        }

        Flushbar()
          ..title = output
          ..message = "您已通过qq登陆成功!"
          ..backgroundGradient = new LinearGradient(colors: [
            Color.fromRGBO(0, 210, 255, 1.0),
            Color.fromRGBO(58, 123, 213, 1.0)
          ])
          ..mainButton = FlatButton(
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  new MaterialPageRoute(
                      builder: (context) => LoginSuccessPage(title: '登陆成功')),
                  (route) => route == null);
            },
            child: Text(
              "登陆",
              style: TextStyle(color: Colors.amber),
            ),
          )
          ..showProgressIndicator = true
          ..show(context);

        // output = "登录成功" + qqResult.response.toString();
      } else {
        output = "登录失败" + qqResult.message;
      }
      setState(() {
        _output = output;

        print(_output);
      });
    } catch (error) {
      print("flutter_plugin_qq_example:" + error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    FlutterQq.registerQQ('1107934363');
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Builder(builder: (BuildContext context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(15.0, 80.0, 0.0, 0.0),
                        child: Text(
                          'Hello',
                          style: TextStyle(
                            fontSize: 80.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        width: 100.0,
                        height: 100.0,
                        margin: EdgeInsets.fromLTRB(0.0, 40.0, 40.0, 0.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.transparent,
                            width: 3.0,
                          ),
                        ),
                        child: Icon(
                          FontAwesomeIcons.studiovinari,
                          size: 100.0,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 145.0, 0.0, 0.0),
                    child: Text(
                      'There',
                      style: TextStyle(
                        fontSize: 80.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(220.0, 145.0, 0.0, 0.0),
                    child: Text(
                      '.',
                      style: TextStyle(
                          fontSize: 80.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.green[100]),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 15.0, left: 20.0, right: 20.0),
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'EMAIL',
                      labelStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[200],
                      ),
                      hintText: "example@gmail.com/example@qq.com",
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[200]),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'PASSWORD',
                      labelStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[200],
                      ),
                      hintText: "example@gmail.com/example@qq.com",
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey[200],
                        ),
                      ),
                    ),
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Container(
                    alignment: AlignmentDirectional.centerEnd,
                    padding: EdgeInsets.only(top: 15.0, left: 20.0),
                    child: InkWell(
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Color.fromRGBO(53, 205, 253, 1.0),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60.0,
                  ),
                  Container(
                    height: 40.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      shadowColor: Color.fromRGBO(53, 205, 253, 0.3),
                      color: Color.fromRGBO(53, 205, 253, 1.0),
                      elevation: 7.0,
                      child: GestureDetector(
                        onTap: () {},
                        child: Center(
                          child: Text(
                            'LogIn',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    height: 40.0,
                    color: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          style: BorderStyle.solid,
                          width: 1.0,
                        ),
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Center(
                            child: Icon(FontAwesomeIcons.qq),
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          Center(
                            child: Text(
                              'LogIn with qq',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Dont't have account?",
                  style: TextStyle(fontFamily: 'Montserrat'),
                ),
                SizedBox(
                  width: 5.0,
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    'Sign up',
                    style: TextStyle(
                      color: Color.fromRGBO(53, 205, 253, 1.0),
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Text(
                    "© 2018 djkloop. All rights reserved.",
                    style: TextStyle(
                      color: Colors.white30,
                    ),
                  ),
                )
              ],
            )
          ],
        );
      }),
    );
  }
}
