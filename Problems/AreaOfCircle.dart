/*---Write a program to calculate the area of a circle given its radius.---*/

import "dart:math";
import 'dart:io';


int area(int radius){
return (pi * radius * radius).round(); // using round function to roundof double to int
}
void main()
{
  int? radius = int.parse(stdin.readLineSync()!); 
  /* stdin method of dart : io package used to take input and it will only take string ,
   so we have to use int.parse to convert string to int .
   we also need to use null assertion operator "!" to confirm its not null 
   Also you need to enter int value only */
  print(area(radius));
}