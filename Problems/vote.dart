//Create a program that accepts a user’s name and age, then prints whether they are eligible to vote (age >= 18).

import 'dart:io';
void main()
{
  int age;
  print("Please Enter your Age :");
  age = int.parse(stdin.readLineSync()!);
  print(age >= 18 ? "Eligible" : "Not-eliglible");
  /* there are multiple ways to execute this problem like 
  if-else , switch-case , lambda functions too */ 
}