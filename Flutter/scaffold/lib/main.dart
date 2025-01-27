import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(home: ScaffoldExample(),);
  }
}

class ScaffoldExample extends StatelessWidget{
  const ScaffoldExample({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('AppBar Demo'),
        actions: <Widget>[
          IconButton(onPressed: (){
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('This is SnackBar'),));
          }, icon: Icon(Icons.add_alert),
          tooltip:'Show SnackBar' ,),
          IconButton(onPressed: (){
            Navigator.push(context , MaterialPageRoute(builder: (BuildContext context){
              return Scaffold(
                appBar: AppBar(
                  title: Text('Next Page'),
                  centerTitle: true,
                ),
                body: Text('This is next page',style: TextStyle(fontSize: 24),),
              );
            },
            )
            );
          }, icon: Icon(Icons.navigate_next)),
        ],
      ),
      body: Text('This is main page',style: TextStyle(fontSize: 24),),
    );
  }
}