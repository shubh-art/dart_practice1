import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mobiles/services/data.dart';
import 'package:provider/provider.dart';
import 'package:mobiles/Pages/edit.dart';

class MyHomePage extends StatefulWidget
{
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() => Provider.of<DataProvider>(context,listen: false).loadData());
  }
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mobiles'),
        centerTitle : true,
        backgroundColor : Colors.amber,
      ),
      body: Consumer<DataProvider>(
        builder: (context,provider,child) {
          final datalist = provider.list;
          if( datalist.isEmpty ){
            return Center(child: SpinKitPouringHourGlass(color: Colors.red,duration: Duration(seconds: 5),));
          }
          return ListView.builder(
            itemCount: datalist.length,
            itemBuilder: (context,index){
                final data = datalist[index];
                return Card(
                  child: ListTile(
                    title: Text(data.name),
                    subtitle:
                      data.data != null ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: data.data.entries.map<Widget>((entry){ 
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(' ${entry.key} : ${entry.value} '),
                        );
                        }
                        ).toList(),
                      ) : Text('No data Available'),
                    
                  ),
                );    
          }
          );
        }
      ),
      floatingActionButton: FloatingActionButton(onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => Edit()))),
    );
  }
}