import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  // Screens for different sections
  final List<Widget> _screens = [
    ProductsScreen(),
    CartScreen(),
    OrdersScreen(),
  ];

  // Change tab when clicked
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Shopping App")),
        body: _screens[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.store), label: "Products"),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart"),
            BottomNavigationBarItem(icon: Icon(Icons.list), label: "Orders"),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

// Screen 1: Products List
class ProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("🛍️ Products Page"));
  }
}

// Screen 2: Cart Page
class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("🛒 Cart Page"));
  }
}

// Screen 3: Orders Page
class OrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("📦 Orders Page"));
  }
}
