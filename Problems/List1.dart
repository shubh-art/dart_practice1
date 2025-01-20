//  Create a program that takes a list of numbers and prints:
void EvenNumbers(List list){
  print("Even numbers in list :");
  for( int num in list){              // for in loop 
  if( num % 2 == 0 )
    print(num);
  }
}

void SumOfAllElements(List list)
{
  print("Sum of all elments in list :");
  int sum = 0;
  for(int num in list)
  {
    sum += num;
  }
      print(sum);


}
void main(){
  List<int> list = [1,2,3,4,5,6,7,8,10]; // you can customize this list 
  EvenNumbers(list); // invoke function 
  SumOfAllElements(list); // invoke function 
}
