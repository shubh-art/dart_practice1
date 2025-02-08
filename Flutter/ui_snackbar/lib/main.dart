import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      home: const Home()
    );
  }
}

class Home extends StatelessWidget
{
  const Home({super.key});
    void _showSnackbar(BuildContext context)
  {
    final snackbar = SnackBar(content: Text('Button Clicked',textAlign: TextAlign.center,style:TextStyle(fontSize: 20),));
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
        appBar: AppBar(
          title:(Text('Snack bar')),
          centerTitle: true,
          ),
          body: Center(
            child: ElevatedButton(onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=> sample()));},
            style:ElevatedButton.styleFrom(
              elevation: 5,
              shadowColor: Colors.black,
            ) ,
            child: Text('Elevated'),),
          ),
          floatingActionButton: FloatingActionButton(onPressed: () => _showSnackbar(context),
          tooltip : 'SnackBar',
          child: Icon(Icons.navigate_next),
          ),
      );
  }
}

class sample extends StatefulWidget {
  const sample({super.key});

  @override
  State<sample> createState() => _sampleState();
}

class _sampleState extends State<sample> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
 