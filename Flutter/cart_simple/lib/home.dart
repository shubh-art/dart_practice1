import 'package:flutter/material.dart';
import 'cart.dart';

class MyHomePage extends StatefulWidget
{
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
{
  var data;
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title:Text('My Cart'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Center(child: Text('$data',style: TextStyle(fontSize:26),)),
      floatingActionButton: FloatingActionButton(onPressed: ()async{
        final total = await Navigator.push(context,MaterialPageRoute(builder: (context) => cartScreen()));
        print(' total = $total');
        if(total != null ){
          setState(() {
          data = total;            
          });
        }
      },
      child: Icon(Icons.shopping_cart),),
    );
  }
}