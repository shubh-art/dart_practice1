import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget{
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _age = TextEditingController();
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Page'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body:Center(
        child: Container(
          width: 200,
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: Colors.deepOrange,
            ),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 7,
                offset: Offset(0, 3),
                spreadRadius: 5,
              ),
            ],
            gradient: LinearGradient(colors: [Colors.blue,Colors.green,Colors.yellow],
            end: Alignment.bottomRight,
            begin: Alignment.topLeft),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [        
                TextField(
                  controller: _name,
                  decoration: InputDecoration(
                    hintText: 'Enter your name',
                    label: Text('Name'),
                  ),
                  keyboardType: TextInputType.name,
                ),
                TextField(
                  controller: _email,
                  decoration: InputDecoration(
                    hintText: 'Enter your email',
                    label: Text('Email'),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                TextField(
                  controller: _age,
                  decoration: InputDecoration(
                    hintText: 'Enter your age',
                    label: Text('Age'),
                  ),
                  keyboardType: TextInputType.numberWithOptions(decimal: false,signed: false),
                ),
            ]
            ),
        ),
      ),      
    );
  }
}