import 'package:flutter/material.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget
{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.amberAccent,
              border: Border.all(
                color: Colors.black,
                width: 3,
              ),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
              gradient: LinearGradient(colors: [Colors.blue,Colors.green,Colors.amber],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              ),
    //           image: DecorationImage(
    // // image: NetworkImage(
    // // 'https://e1.pxfuel.com/desktop-wallpaper/982/835/desktop-wallpaper-rahuljatav7x-new-bular-backgrounds-in-2022.jpg'),
    // //         fit: BoxFit.cover,),
    //
      ),
    child: Center(
      child: Text('Decorated Container',
      style: TextStyle(
      color: Colors.white,      fontSize: 18,
      ),textAlign: TextAlign.center,),
    ),
        ),
        ),
      ),
    );
  }
}