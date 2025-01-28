import 'package:flutter/material.dart';
import 'package:sample_user/user.dart';
import 'package:provider/provider.dart';

class Edit extends StatelessWidget
{
  final TextEditingController Name = TextEditingController();
  final TextEditingController Number = TextEditingController();

  Widget build( BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(title:Text('Edit User'),
      centerTitle: true,
      backgroundColor: Colors.blue,
      ),
      body: Consumer<Users>(
        builder: (context,user,child) {
          return ListView.builder(
            itemCount: user.list.length,
              itemBuilder: (context , int index){
              return ListTile(
                title: Text('${user.list[index].name}'),
                subtitle: Text('${user.list[index].number}'),
                leading: IconButton(onPressed: (){
                  user.remove(index);
                }, icon: Icon(Icons.delete)),
              );
              });
        }
      ),
    );
  }
}