import 'package:cart/services/item.dart';

class Cart{
  List<CartItems> cart;
  int total;
  Function(int) getTotal;

  Cart({required this.cart,required this.total,required this.getTotal});

  void Add(CartItems item){
    cart.add(item);
    total = total + item.price;
  }
}