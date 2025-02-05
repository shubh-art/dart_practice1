import 'package:flutter/material.dart';
import 'package:mobiles/services/data.dart';
import 'package:provider/provider.dart';

class Edit extends StatefulWidget{
  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit>{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() => Provider.of<DataProvider>(context, listen: false).loadData());
  }
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Page'),
        backgroundColor: Colors.amber,
        centerTitle : true,
      ),
      body:Consumer<DataProvider>(
        builder: (context,provider,child) {
          final Data = provider.list;
          return ListView.builder(
            itemCount: Data.length,
            itemBuilder: (context, index){
            return ListTile(
          
            );
          });
        }
      )
    );
  }
}