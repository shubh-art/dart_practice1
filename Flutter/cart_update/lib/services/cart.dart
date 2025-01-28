import 'package:cart/services/item.dart';
import 'package:flutter/cupertino.dart';

class Cart with ChangeNotifier{

  final List<CartItems> _cart = [];

  int _total = 0;

  List<CartItems> get cart=> _cart;

  int get total => cart.fold(0, (sum, item) => sum + item.price * item.quantity);

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
      _cart.add(CartItems(
        product: item.product,
        price: item.price,
        quantity: item.quantity > 0 ? item.quantity : 1,
      ));
    }

    _total += item.price * (item.quantity > 0 ? item.quantity : 1);

    notifyListeners();
  }



  void remove(int index){
    _total -= _cart[index].price * _cart[index].quantity;
    _cart.removeAt(index);
    notifyListeners();
  }
}