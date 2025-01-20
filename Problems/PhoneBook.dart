// Create a phonebook using a Map where the key is a person's name and the value is their phone number. Add, remove, and look up entries.
import 'dart:io';
void main(){
  var map = Map<String , String>();
  print( "enter type of operation you want to perform : (add , remove and look ) enter \"stop\" to terminate" );
  var str = stdin.readLineSync();
/*
We need to use loops to loops to perform as expected otherwise all the data
will be removed everytime you run main ;
data is not persist
*/ 
  while(str != "stop"){
  if(str != null){
  str = str.trim();}
  
  if( str is String )
  {
    switch(str.trim()){
      case 'add': 
      print("Enter Name : ");
      String? tempName = stdin.readLineSync();
      print("Enter Phone number : ");
      String? tempNum = stdin.readLineSync();
      if( tempNum != null && tempName != null){
      map[tempName] = tempNum;
      print("Contact added successfully ... ");
      }
      else{
      print("invlid input for add ");}
      

      break;

      case 'remove':
      print("Enter name to be deleted :");
      String? tempName = stdin.readLineSync();
      if(tempName != null && map.containsKey(tempName)){
      map.remove(tempName);
      print("Contact deleted successfully ... ");
      }
      else {print("Invalid Input for delete ");}
      break;

      case 'look' :
      print("Enter Name to be searched : ");
      String? tempName = stdin.readLineSync();
      if(tempName != null && map.containsKey(tempName)){
      print("$tempName : ${map[tempName]}");
      }
      else {print("Invalid Input for look ");}
      break;

      default:
      print("Invalid Input");
    }
      print( "enter type of operation you want to perform : (add , remove and look ) enter \"stop\" to terminate" );
  str = stdin.readLineSync();
  }
  }
}