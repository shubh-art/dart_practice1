import 'package:cart/services/cart.dart';
import 'package:flutter/material.dart';
import 'package:cart/pages/home.dart';
import 'package:provider/provider.dart';

void main(){

  runApp(
    ChangeNotifierProvider
    (
    create:(context) => Cart(),
    child: MyApp()
    ),
    );
  }

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
        home: MyHomePage(),
      );
  }
}