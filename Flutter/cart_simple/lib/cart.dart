import 'package:flutter/material.dart';

class cartScreen extends StatefulWidget{
  @override
  State<cartScreen> createState() => _cartScreenState();
}

class _cartScreenState extends State<cartScreen>
{
  int count = 0 ;
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(title: Text('Cart Screen'),
      centerTitle: true,
      backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('$count',style: TextStyle(fontSize: 26),),
            ElevatedButton(onPressed: (){
               Navigator.pop(context,count);
            }, child: Text('Checkout')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () => setState(() {
        count++;
      }),
      child: Icon(Icons.add),
      ),
    );
  }
}