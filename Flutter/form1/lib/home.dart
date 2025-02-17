import 'package:flutter/material.dart';
import 'Second.dart';

class MyHomePage extends StatefulWidget{
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _age = 10;
  String _city = 'Raipur';
  String _gender = 'Male';
  bool _ischecked = false;
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _address = TextEditingController();

  @override
  Widget build(BuildContext context)
  {
    final age = _age;
    final city = _city;
    final gender = _gender;
    final ischecked = _ischecked;

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(spacing: 10,
            children: [
              TextField(
                controller: _name,
                decoration: InputDecoration(
                  hintText: 'Enter your name',
                  label: Text('Name'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              TextField(
                controller: _email,
                decoration: InputDecoration(
                  hintText: 'Enter Email',
                  label: Text('Email'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  )
                ),
              ),
              SizedBox(height: 16,),
              Text('Enter age range under'),
              Slider(value: age, onChanged: (value) {
                setState(() {
                _age = value;                  
                });
              },
              label: age.round().toString(),
              max: 50,
              min: 5,
              divisions: 9,),

              DropdownButton(
                items: <String>['Raipur' , 'Bilaspur' , 'Bhilai' , 'Korba' ].map<DropdownMenuItem<String>>((String value){
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value));
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _city = value!;
                });
                print(_city);
              },
              value: city,
          ),
          TextField(
            controller: _address,
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              label: Text('Address'),
              hintText: 'Enter address'
            ),
            keyboardType: TextInputType.multiline,
            maxLines: 3,
            
          ),
             Row(
              children: [
                Expanded(
                  child: RadioListTile<String>(value: 'Male', groupValue: gender, onChanged: (value) {
                    setState(() {
                      _gender = value!;
                    });
                                        print(_gender);

                  },
                  title: Text('Male'),),
                ),
                Expanded(
                  child: RadioListTile(value: 'Female', groupValue: gender, onChanged: (value) {
                    setState(() {
                      _gender = value!;
                    });
                                        print(_gender);

                  },
                  title: Text('Female'),),
                ),
                Expanded(
                  child: RadioListTile(value: 'Other', groupValue: gender, onChanged: (value) {
                    setState(() {
                      _gender = value!;
                    });
                    print(_gender);
                  },
                  title: Text('Other'),),
                )
              ],
            ),
            Checkbox(value: ischecked,onChanged: (value) {
              setState(() {
                _ischecked = value!;
              });
            },
            ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed:() => Navigator.push(context,
            MaterialPageRoute(builder: (context) => SecondForm())), child: Text('Next Page'))
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Submitted Sucessfully')));
        print('''
Name : ${_name.text},
Email : ${_email.text}, 
Age : ${_age.round()},
City : $_city ,
Address : ${_address.text} ,
gender : $_gender ,
Java : ${_ischecked} .
''');
_name.clear();
_address.clear();
_email.clear();
      },child: Text('Submit'),),
    );
  }
}