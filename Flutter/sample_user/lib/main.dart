import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_user/user.dart';
import 'home.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Users(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      home: Home(),
    );
  }
}
