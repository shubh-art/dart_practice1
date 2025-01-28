import 'package:cart/services/cart.dart';
import 'package:flutter/material.dart';
import 'package:cart/pages/itemscreen.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget{
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage>{
  @override
  Widget build(BuildContext context)
  {
    int _total = 0;
    return Scaffold(
      appBar: 
      AppBar(
        title: Text('My Cart'),
        backgroundColor: Colors.blue,
        centerTitle : true
        ),
        body: Consumer<Cart>(
          builder: (context,cart,child) {
            int total = cart.total;
            _total = total;
            return cart.cart.isEmpty ? Center(child:Text('Nothing to show here',style: TextStyle(fontSize: 20),),) :ListView.builder(
              itemCount: cart.cart.length,
                itemBuilder:(BuildContext context,int index){
                return Card(
                  child: ListTile(
                    title: Text('${cart.cart[index].product}',style: TextStyle(fontSize: 20),),
                    subtitle: Text('${cart.cart[index].price}',),
                    ),
                );
                }
            );
          },
        ),
      floatingActionButton:
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
  
      
      bottomSheet: Text(' Total = ${_total}',style: TextStyle(fontSize: 20),),
    );
  }
}