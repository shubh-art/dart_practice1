import 'package:cart/services/item.dart';
import 'package:flutter/cupertino.dart';

class Cart extends InheritedWidget{
  Cart({
    super.key,
    required super.child,
      });

  final List<CartItems> cart = [];
  int total = 0;

  static Cart of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<Cart>()!;
  }

  @override
  bool updateShouldNotify(Cart oldWidget) {
    return cart != oldWidget.cart || total != oldWidget.total;
  }


  int getTotal() => total;

  void add(CartItems item) {
    // Check if the item already exists in the cart
    final existingItem = cart.firstWhere(
          (cartItem) => cartItem.product == item.product,
      orElse: () => CartItems(product: '', price: 0, quantity: 0),
    );

    if (existingItem.product.isNotEmpty) {
      // If it exists, increase its quantity
      existingItem.quantity += item.quantity > 0 ? item.quantity : 1;
    } else {
      // Otherwise, add it to the cart
      cart.add(CartItems(
        product: item.product,
        price: item.price,
        quantity: item.quantity > 0 ? item.quantity : 1,
      ));
    }

    total += item.price * (item.quantity > 0 ? item.quantity : 1);
  }



  void remove(int index){
    total -= cart[index].price * cart[index].quantity;
    cart.removeAt(index);
  }
}