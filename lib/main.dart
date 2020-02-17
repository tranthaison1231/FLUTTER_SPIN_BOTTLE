import 'dart:math';
import 'package:flutter/material.dart';

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
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  AnimationController _animationController;
  Random rng = Random();

  double randomNumber() {
    return rng.nextDouble();
  }

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height,
          child: Image.asset(
            'assets/floor.jpg',
            fit: BoxFit.fill,
          ),
        ),
        Center(
          child: Container(
            child: RotationTransition(
                turns: Tween(begin: 0.0, end: randomNumber()).animate(
                    CurvedAnimation(
                        parent: _animationController, curve: Curves.linear)),
                child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _animationController = AnimationController(
                            vsync: this, duration: const Duration(seconds: 3));

                        _animationController.forward();
                      });
                    },
                    child: Image.asset(
                      'assets/bottle.png',
                      height: 250,
                      width: 250,
                    ))),
          ),
        ),
      ],
    ));
  }
}
