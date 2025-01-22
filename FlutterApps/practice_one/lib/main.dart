import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  const MyApp({super.key});
@override
  Widget build(BuildContext context){
    return MaterialApp(
      home: form(), /*Scaffold(
        appBar: AppBar(
          title: Text("AppBar"),
          backgroundColor: Colors.blue[900],
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              width: 100,
                height: 100,
                color: Colors.amber,
              child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. In tempus venenatis erat non placerat. Nulla magna tortor, vehicula eget consequat vel, dictum vel est. Suspendisse et cursus diam, vitae hendrerit velit. Etiam ornare, ligula ut bibendum sollicitudin, augue mi luctus dui, sed dapibus ligula nisi ut tortor. Praesent finibus massa."),
              ),

              Icon(Icons.edit,size: 20,),
          ],
        ),
          floatingActionButton: FloatingActionButton(
            onPressed: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (context) => const form())),backgroundColor: Colors.amber,),
            )*/
      );
  }
}


class form extends StatefulWidget {
  const form({super.key});


  @override
  State<form> createState() => _formState();
}

class _formState extends State<form> {

  double _slider = 20;
  bool light = false;
  bool check = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          SizedBox(height: 10,),
          Slider(value: _slider,
          max: 100,
          label: _slider.round().toString(),
          divisions: 10,
           onChanged: (double value){
            setState(() {
              _slider = value;
              print(_slider);
            });
          }),
          Switch(
            value: light,
            activeColor: Colors.blue,
            onChanged: (bool Bool){
              setState(() {
                light = Bool;
                print(light);
              });
            },
          ),
          Checkbox(value: check, onChanged: (bool? Bool){
            setState(() {
              check = Bool!;
            },);
          },
          checkColor: Colors.white,
          )
        ],
      ),
    );
  }
}