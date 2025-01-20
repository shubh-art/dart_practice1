//Implement an abstract class Shape with a method area() and extend it to Circle and Rectangle. Calculate the area for both.

import 'dart:math';

abstract class Shapes {
  int area();
}

class Circle implements Shapes{
  int radius;
  Circle({required this.radius});
  int area()
  {
    var Area = pi * radius * radius;
    return Area.round();
  }
}

class Rectangle implements Shapes{
  int length;
  int breadth;
  Rectangle({required this.length,required this.breadth});

  int area()=> length*breadth;
}

void main(){
  var obj1 = Rectangle(length: 10, breadth: 20);
  print("Area of Rectangle ${obj1.area()}");

  var obj2 = Circle(radius: 7);
  print("Area of Cirlce ${obj2.area()}");
}