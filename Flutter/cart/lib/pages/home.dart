import 'package:cart/services/cart.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget{
  @override
  State<MyHomePage> createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage>{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: 
      AppBar(
        title: Text('My Cart'),
        backgroundColor: Colors.blue,
        centerTitle : true
        ),
        body: ListView.builder(itemBuilder: Cart(cart: cart, total: total)),
    );
  }
}