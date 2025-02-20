import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(width: 200,height: 200,color: Colors.red,),
          Container(width: 150,height: 150,color: Colors.amber,),
          Container(width: 100,height: 100,color: Colors.blue,),
          Positioned(
            left: 50,
            child: Container(
              width: 50,
              height: 50,
              color: Colors.white,
            ))
        ],
      ),
    );
  }
}