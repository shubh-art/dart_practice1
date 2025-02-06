import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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

 void _showEditOptionsDialog(Data main_data,Map<String, dynamic> data) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Edit Data"),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView(
              shrinkWrap: true,
              children: data.entries.map((entry) {
                return ListTile(
                  title: Text("${entry.key} : ${entry.value}"),
                  trailing: IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      Navigator.pop(context);
                      _showEditValueDialog(entry.key, entry.value , main_data);
                    },
                  ),
                );
              }).toList(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _showAddKeyValueDialog(main_data);
              },
              child: Text("Add New Specs"),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Close"),
            ),
          ],
        );
      },
    );
  }

  // To edit an existing value
  void _showEditValueDialog(String key, dynamic currentValue ,Data data) {
    TextEditingController controller = TextEditingController(text: currentValue.toString());

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Edit Value"),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(labelText: "New Value"),
          ),
          actions: [
            TextButton(
              onPressed: (){ Navigator.pop(context);
              controller.clear();
              }
,

              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                // Call API or update provider state here
                print("Updated $key to ${controller.text}");
                data.data[key] = controller.text;
                Provider.of<DataProvider>(context,listen: false).edit(data.id ,{key : controller.text});
                controller.clear();
                Navigator.pop(context);
              },
              child: Text("Save"),
            ),
          ],
        );
      },
    );
  }

  /// Show dialog to add a new key-value pair
  void _showAddKeyValueDialog( Data data) {
    TextEditingController keyController = TextEditingController();
    TextEditingController valueController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Add Key-Value Pair"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: keyController,
                decoration: InputDecoration(labelText: "Key"),
              ),
              TextField(
                controller: valueController,
                decoration: InputDecoration(labelText: "Value"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                // Call API or update provider state here
                print("Added ${keyController.text} : ${valueController.text}");
                data.data[keyController.text] = valueController.text;
                Provider.of<DataProvider>(context,listen: false).update(data.id,data);
                valueController.clear();
                keyController.clear();
                Navigator.pop(context);
              },
              child: Text("Add"),
            ),
          ],
        );
      },
    );
  }

void _showAddNewDataDialog() {
  TextEditingController nameController = TextEditingController();
  TextEditingController dataController = TextEditingController();

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("Add New Data"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: "Name"),
            ),
            TextField(
              controller: dataController,
              decoration: InputDecoration(labelText: "Data"),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              if (nameController.text.isNotEmpty && dataController.text.isNotEmpty) {
                // Create a new Data object
                Data newData = Data(
                  id: '', // ID will be assigned by the API
                  name: nameController.text,
                  data: { "spec": dataController.text },
                );
               
                Provider.of<DataProvider>(context, listen: false).addNew(newData);

                nameController.clear();
                dataController.clear();
                Navigator.pop(context);
              } else {

                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please fill in both fields')));
              }
            },
            child: Text("Add"),
          ),
        ],
      );
    },
  );
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
          final datalist = provider.list;
          if( datalist.isEmpty )
          {
            return SpinKitDoubleBounce(color: Colors.red,);
          }
          return ListView.builder(
            itemCount: datalist.length,
            itemBuilder: (context, index){
              final data = datalist[index];
            return Card(
              child: ListTile(
              title: Text(data.name,
                        style:TextStyle(
                          fontWeight: FontWeight.bold,
                        ),),
              subtitle:
                data.data != null ?Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
              children:data.data.entries.map<Widget>((entry){
                  return Text(
                    '${entry.key} : ${entry.value}'
                    );
                    }
                    ).toList()          
              
                        )
                : Text('No Text to show'),
                trailing:SizedBox(
                  width: 100,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(onPressed: (){
                          _showEditOptionsDialog(data, data.data);
                        }, icon: Icon(Icons.edit),),
                        IconButton(
                          onPressed: (){
                          provider.delete(data.id);
                        }, icon: Icon(Icons.delete),)
                      ],
                    ),
                ),
                
              ),
            );
          }
          );
        }
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){_showAddNewDataDialog();},child: Icon(Icons.add),),
    );
  }
}