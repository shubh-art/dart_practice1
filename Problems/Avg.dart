//Use a List to store a series of numbers and find their average using reduce.

import 'dart:math';

void main(){
  List numbers = [];
  var random = Random();
  for( int i =0 ; i < 10 ; i++ ){
    numbers.add(random.nextInt(10));
  }

  print("Numbers in list are : ${numbers}");

  var avg = numbers.reduce((a,b)=>a+b)/numbers.length;
  print(avg.toStringAsFixed(1)); // To restrict no. of digits to be show after decimal point 
}