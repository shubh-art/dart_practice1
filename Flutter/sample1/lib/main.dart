import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Count extends ChangeNotifier{
  int _count = 0;

  int get count=> _count;

  void increment()
  {
    _count++;
    notifyListeners();
  }
}

void main()
{
  runApp(
    ChangeNotifierProvider(
      create: (context) {
        return Count();
      },
      child: Home(),
    )
  );
}

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(home:Counter());
  }
}

class Counter extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
                  print('rebuid before');

    // final count = Provider.of<Count>(context);
                  print('rebuid after');

    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
        ),
        body:Center(child: Consumer<Count>(
          builder: (context,count,child) {
            return Text('${count.count}',style: TextStyle(fontSize: 20),);
          }
        ),),
        floatingActionButton: Consumer<Count>(
          builder: (context,count,child) {
            return FloatingActionButton(
              onPressed:count.increment,
              child: Icon(Icons.add),
              );
          }
        ),
    );
  }
}