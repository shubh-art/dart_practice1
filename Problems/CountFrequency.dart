//Write a Dart program to count the frequency of each character in a given string using a Map.

import 'dart:io';
void main()
{
  print("Enter a Strign : ");
  String? str = stdin.readLineSync();
  
  var map = Map<String,int>();

  for( final char in str!.split(""))
  {
    if( map.containsKey(char) )
    {
      map[char] = map[char]! + 1;
    }
    else if( char == " " ){ // To Skip spaces
      continue;
    }
    else
    {
      map[char] = 1;
    }
  }
  print(map);
}