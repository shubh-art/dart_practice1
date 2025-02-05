import 'package:flutter/material.dart';
import 'package:mobiles/Pages/home.dart';
import 'package:provider/provider.dart';
import 'package:mobiles/services/data.dart';

void main()
{
  runApp(ChangeNotifierProvider(
    create: (context) => DataProvider(),
    child: MyApp()
    )
    );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:MyHomePage(),
    );
  }
}