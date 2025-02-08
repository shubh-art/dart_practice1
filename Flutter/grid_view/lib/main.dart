import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Grid View'
          ),
          backgroundColor: Colors.greenAccent,
          centerTitle : true,
        ),
        body: GridView.count(
          crossAxisCount: 3,
          padding: EdgeInsets.all(8),
          children: List.generate(100, (index){
                        return Center(
                          child: Container(
                                        width: 100,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 2,
                                            style: BorderStyle.solid
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color:Colors.grey,
                                              spreadRadius: 5,
                                              blurRadius: 7,
                                              offset: Offset(0, 3)
                                            )
                                          ],
                                          gradient: LinearGradient(
                                            colors: [
                                              Colors.blue , Colors.green
                                              ],
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                              ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            ' Item ${index+1}'
                                          ),
                                        ),
                                      ),
                        );
          })
        ),
      ),
    );
  }
}