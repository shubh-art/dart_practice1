//Write a function that takes a list of numbers and returns the largest number.

import 'dart:math';

void main()
{
  List list = [];
  for( int i = 0 ; i < 10 ; i++ )
    {
      list.add(Random().nextInt(99));
    }
    print("List : ${list}");

    print(" Largest : ${FindLargest(list)}");
}

int FindLargest(List list){
  int Max = 0;
  for(int n in list)
  {
    Max = max(n,Max);
  }
  return Max;
}