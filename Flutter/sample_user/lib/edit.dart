import 'package:flutter/material.dart';
import 'package:sample_user/user.dart';
import 'package:provider/provider.dart';

class Edit extends StatefulWidget
{

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {

  void _showDialogBox(int? index , Users user)
  {
    final TextEditingController Name = TextEditingController(text: index != null ? user.list[index].name : '');
    final TextEditingController Number = TextEditingController( text: index != null ? user.list[index].number.toString() : '');

    showDialog(
      context: context,
        builder:(BuildContext context) => Expanded(
          child: Dialog(
            child:Padding(
                padding: EdgeInsets.all(8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: Name,
                    decoration: InputDecoration(
                      labelText: 'Enter Name',
                    ),
                  ),
                  TextField(
                    controller: Number,
                    decoration: const InputDecoration(
                      labelText: 'Enter Number',
                    ),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          onPressed: (){
                            final name = Name.text;
                            final number = int.tryParse(Number.text);
                            if( index != null )
                              {
                                user.edit(name, number! , index);
                              }
                            else
                              {
                                user.add(name, number!);
                              }
                            Name.clear();
                            Number.clear();
                            Navigator.pop(context);
                          }
                          , child: Text('Submit')),
                      ElevatedButton(onPressed: ()=> Navigator.pop(context), child: Text('Cancel',style: TextStyle(color: Colors.red),))
                    ],
                  ),
                ],
              ),),
          ),
        ),);
  }

  @override
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
              return Card(
                child: ListTile(
                  title: Text('${user.list[index].name}'),
                  subtitle: Text('${user.list[index].number}'),
                  leading: IconButton(onPressed: (){
                    user.remove(index);
                  }, icon: Icon(Icons.delete)),
                  trailing: IconButton(onPressed:(){
                    _showDialogBox(index,user);
                    }, icon: Icon(Icons.edit)),
                ),
              );
              });
        }
      ),
      floatingActionButton: Consumer<Users>(builder: (context,user,child){
        return FloatingActionButton(onPressed:(){_showDialogBox(null,user);},
        child: Icon(Icons.add),);
      }),
    );
  }
}