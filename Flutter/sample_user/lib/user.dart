import 'package:flutter/material.dart';

class User{
  String name;
  int number;
  User({required this.name,required this.number});
}
class Users extends ChangeNotifier{
final List<User> _list = [
  User(name : "Alice", number : 1234567890),
  User(name : "Bob",number :  9876543210),
  User(name : "Charlie",number :  4567891230),
  User(name : "David",number :  7890123456),
  User(name : "Eve",number :  2345678901),
  User(name : "Frank",number :  6789012345),
  User(name : "Grace",number :  8901234567),
  User(name : "Hannah",number :  3456789012),
  User(name : "Ivy",number :  5678901234),
  User(name : "Jack",number :  9012345678),
];

List<User> get list => _list;

void edit(String Name , int Number ,int index)
{
  _list[index] = User(name : Name,number : Number );
  notifyListeners();
}

void add(String Name , int Number)
{
  _list.add(User(name : Name, number : Number));
  notifyListeners();
}

void remove(int index)
{
  _list.removeAt(index);
  notifyListeners();
}
}