//Create a stream that emits random numbers every second for 5 seconds.

import 'dart:math';

void main()async{
  await for( var values in packet())
  {
    print(values);
  }
}

Stream<int> packet()async*{
  for( int i = 0 ; i < 10 ; i++ )
  {
    await Future.delayed(Duration(seconds: 5));
    yield Random().nextInt(100);
  }
}