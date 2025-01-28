import 'package:cart/services/cart.dart';
import 'package:cart/services/item.dart';
import 'package:flutter/material.dart';
import 'package:cart/pages/checkoutscreen.dart';
import 'package:provider/provider.dart';

class ItemScreen extends StatefulWidget
{
  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen>
{
  List<CartItems> cartItems = [
    CartItems(product: 'Apple', price: 150, quantity: 1),
    CartItems(product: 'Banana', price: 80, quantity: 1),
    CartItems(product: 'Orange', price: 120, quantity: 1),
    CartItems(product: 'Grapes', price: 200, quantity: 1),
    CartItems(product: 'Pineapple', price: 300, quantity: 1),
    CartItems(product: 'Strawberry', price: 250, quantity: 1),
    CartItems(product: 'Blueberry', price: 400, quantity: 1),
    CartItems(product: 'Mango', price: 180, quantity: 1),
    CartItems(product: 'Watermelon', price: 600, quantity: 1),
    CartItems(product: 'Papaya', price: 220, quantity: 1),
  ];

  @override
  Widget build(BuildContext context)
  {
    // Cart cart = Cart.of(context);
    return Scaffold(
      appBar: AppBar(title: Text('Items'),),
      body: ListView.builder(
        itemCount: cartItems.length,
          itemBuilder:
          (BuildContext context , int index){
          return Card(
            child: ListTile(
                title: Text('${cartItems[index].product}'),
              subtitle: Text('\$${cartItems[index].price}'),
              leading: IconButton(onPressed: () {
                setState(() {
                  Provider.of<Cart>(context,listen : false).add(cartItems[index]);
                });
              }, icon: Icon(Icons.shopping_cart_checkout),
              ),
              trailing: IconButton(onPressed: (){
               // cartItems[index].quantity++;
                Provider.of<Cart>(context , listen : false).add(cartItems[index]);
              },
              icon: Icon(Icons.add),
              ),
            ),
          );
          },
      ),
      floatingActionButton:
          FloatingActionButton(onPressed:() async{
            final result = await Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => CheckOutScreen()));
            if( result != null ) {
              Navigator.pop(context,true);
            }
          
            },
          child: Icon(Icons.navigate_next),),


    );
  }
}