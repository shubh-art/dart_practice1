import "package:flutter/material.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: ContainerExample(),
    );
  }
}

class ContainerExample extends StatelessWidget{
  const ContainerExample({super.key});

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
      ),
      body:Container(
          padding: EdgeInsets.all(50),
          margin: EdgeInsets.all(30),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.blue,
          ),
          transform: Matrix4.rotationZ(0.1),
          alignment:Alignment.center,
          // constraints: BoxConstraints.tightForFinite(width: 100),
          child: const Text.rich(
            TextSpan(
              text: 'Hello ',style: TextStyle(fontSize: 25),
              children: <TextSpan>[
                TextSpan(text: "Beautiful ",style: TextStyle(fontStyle: FontStyle.italic)),
                TextSpan(text: 'world !!! ',style: TextStyle(fontWeight: FontWeight.bold), ),
              ],
            ),
          ),
      ),
    );
  }
}