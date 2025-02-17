import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Gesturedetector(),
    );
  }
}

class Gesturedetector extends StatelessWidget{
  @override
  var _top = 0.0;
  var _left = 0.0;

  Widget build(BuildContext context){
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('GestureDetector'),
      //   centerTitle: true,
      //   backgroundColor: Colors.blue,
      // ),
      body:Positioned(
        top:_top,
        left: _left,
        child: GestureDetector(
          onPanUpdate: (details) {
            _top = max(0, _top+details.delta.dy);
            _left = max(0, _left + details.delta.dx);
          },
        )),
    );
  }
}