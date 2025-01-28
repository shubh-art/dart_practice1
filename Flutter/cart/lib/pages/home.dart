import 'package:cart/services/cart.dart';
import 'package:flutter/material.dart';
import 'package:cart/pages/itemscreen.dart';

class MyHomePage extends StatefulWidget{
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage>{
  @override
  Widget build(BuildContext context)
  {
    Cart cart = Cart.of(context);
    int total = cart.cart.fold(0, (sum, item) => sum + item.price * item.quantity);
    return Scaffold(
      appBar: 
      AppBar(
        title: Text('My Cart'),
        backgroundColor: Colors.blue,
        centerTitle : true
        ),
        body: cart.cart.isEmpty ? Center(child:Text('Nothing to show here',style: TextStyle(fontSize: 20),),) :ListView.builder(
          itemCount: cart.cart.length,
            itemBuilder:(BuildContext context,int index){
            return Card(
              child: ListTile(
                title: Text('${cart.cart[index].product}',style: TextStyle(fontSize: 20),),
                subtitle: Text('${cart.cart[index].price}',),
                ),
            );
            }
        ),
      floatingActionButton: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(onPressed: (){setState((){});},child: Icon(Icons.restart_alt),),

          FloatingActionButton(onPressed: ()async{
            final result =await Navigator.push(context,
                MaterialPageRoute(builder: (context) => ItemScreen()));
            if(result == true){
              setState(() {
              });
            }
          },


            tooltip: 'Add Items',
            child: Icon(Icons.shopping_cart),
          ),
        ],
      ),
      bottomSheet: Text(' Total = ${total}',style: TextStyle(fontSize: 20),),
    );
  }
}