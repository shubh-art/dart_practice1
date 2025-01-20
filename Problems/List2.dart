//Create a program to find the unique elements from a list using a Set.

import 'dart:math';

void main(){
  List list = [];
  var random = Random(); // using random for random entries
  for( int i = 0 ; i < 10 ; i++ )
  {
    list.add(random.nextInt(8));
  }
  print(" List before ${list}");

// We are using set.from method from code library to copy all values from list

  var set = Set.from(list);

  print("Unique Elements : ${set}");
}