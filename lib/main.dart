import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:practice_time/main_page_widgets/body_main.dart';
import 'package:practice_time/main_page_widgets/popupMenu.dart';
import 'dart:async';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  startTime() async {
    var _duration = Duration(seconds: 1);
    return Timer(_duration, navigationPage);
  }

  navigationPage() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
      return HomePage();
    }));
  }

  @override
// ignore: must_call_super
  initState() {
    super.initState();
    startTime();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 350,),
            Icon(
              Icons.shopping_cart,
              color: Colors.black,size: 50,
            ),
            Text(
              "Fast Shopping",
              style: TextStyle(color: Colors.black, fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.yellow[600],
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.shopping_cart,
                color: Colors.black,
                size: 34,
              ),
              Text(
                "Fast Shopping",
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
          actions: <Widget>[CustomPopupMenu()],
        ),
        body: Body0());
  }
}
