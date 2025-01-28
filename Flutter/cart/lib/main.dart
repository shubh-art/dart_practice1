import 'package:cart/services/cart.dart';
import 'package:flutter/material.dart';
import 'package:cart/pages/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context)
  {
    return Cart(
      child: MaterialApp(
        home: MyHomePage(),
      ),
    );
  }
}