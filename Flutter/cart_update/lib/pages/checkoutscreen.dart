import 'package:cart/services/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckOutScreen extends StatefulWidget{
@override
  State<CheckOutScreen> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOutScreen>
{

  @override
  Widget build(BuildContext context)
  {
    // Cart cart = Cart.of(context);
    return Scaffold(
      appBar: AppBar(title: Text('Check out page'),
      centerTitle: true,
      backgroundColor: Colors.blue,
      ),
      body: Consumer<Cart>(
        builder: (context,cart,child) {
          return cart.cart.isEmpty ? Center(child:Text('Nothing to show here',style: TextStyle(fontSize: 20),)) : ListView.builder(
            itemCount: cart.cart.length,
              itemBuilder: (BuildContext context, int index){
              return ListTile(
                title: Text('${cart.cart[index].product}'),
                subtitle: Text('${cart.cart[index].price}'),
                trailing: IconButton(onPressed: (){
                  cart.remove(index);
                  setState(() {
                    
                  });
                }, icon: Icon(Icons.delete)),
              );
              });
        }
      ),
      floatingActionButton: FloatingActionButton(onPressed:(){
        Navigator.pop(context,true);
      },child: Icon(Icons.shopping_bag_outlined),),
    );
  }
}