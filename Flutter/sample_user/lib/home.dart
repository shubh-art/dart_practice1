import 'package:flutter/material.dart';
import 'package:sample_user/user.dart';
import 'package:provider/provider.dart';
import 'edit.dart';

class Home extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Consumer<Users>(
        builder: (context,user,child) {
          return ListView.builder(
            itemCount: user.list.length,
              itemBuilder: (context, int index ){
            return Card(
              child: ListTile(
                title: Text('${user.list[index].name}'),
                subtitle: Text('${user.list[index].number}'),
              ),
            );
          });
        }
      ),
      floatingActionButton: FloatingActionButton(onPressed:() {Navigator.push(context, MaterialPageRoute(builder: (context) => Edit()));},
      child:Icon(Icons.navigate_next),),
    );
  }
}