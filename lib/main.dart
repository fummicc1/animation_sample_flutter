import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("アニメーションの練習"),
      ),
      body: Center(child: MovingController()),
      bottomNavigationBar: BottomNavigationBar(items: <BottomNavigationBarItem>[
        new BottomNavigationBarItem(
            icon: Icon(Icons.home), title: new Text("First")),
        new BottomNavigationBarItem(
            icon: Icon(Icons.home), title: new Text("Second"))
      ]),
    );
  }
}

class MovingController extends StatefulWidget {
  @override
  _MovingControllerState createState() => _MovingControllerState();
}

class _MovingControllerState extends State<MovingController>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _logoAnimation;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));
    _logoAnimation =
        Tween<double>(begin: 20, end: 400).animate(_animationController)
          ..addListener(() {
            setState(() {});
          });
    _animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _logoAnimation.value,
      width: _logoAnimation.value,
      child: FlutterLogo(),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
