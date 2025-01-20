// Write a program to print the first 10 numbers in the Fibonacci sequence.

void main()
{
  int sum = 1;
  for ( int i = 1; i <= 10 ; i++  )
  {
    sum *= i;
    print(sum);
  }
}