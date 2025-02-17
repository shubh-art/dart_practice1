import 'package:flutter/material.dart';
import 'data.dart';

class SecondForm extends StatefulWidget {
  const SecondForm({super.key});

  @override
  State<SecondForm> createState() => _SecondFormState();
}

class _SecondFormState extends State<SecondForm> {

  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _address = TextEditingController();
  double _age = 10;
  String _city = 'Raipur';
  String _gender = 'Male';

  final List<Map<String ,bool>> _skills = [
    {'java':false},
    {'C' : false},
    {'C++': false},
    {'python' : false},
  ];

  void _onChange(int index , bool? value){
    setState(() {
      _skills[index] = {_skills[index].keys.first : value ?? false};
    });
  }

  @override
  Widget build(BuildContext context) {
    final age = _age;
    final city = _city;
    final gender = _gender;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Page'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: 350,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
              ),
              borderRadius: BorderRadius.circular(12)
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 8,
              children: [
                TextField(
                  controller: _name,
                  decoration: InputDecoration(
                    hintText: 'Enter your name',
                    label: const Text('Name'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12), 
                    ),
                  ),
                ),
        
                TextField(
                  controller: _email,
                  decoration: InputDecoration(
                    hintText: 'Enter your email',
                    label: const Text('Email'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    )
                  ),
                ),
                const SizedBox(height: 16,),
        
                const Text('Choose your city : '),
        
                
                  DropdownButton(
                    items: ['Raipur' , 'Bilaspus' , 'Bhilai' , 'Korba']
                    .map<DropdownMenuItem<String>>((String value){
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value));
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _city = value!;
                      });
                    },
                    value: city,),
                
        
                  TextField(
                    controller: _address,
                    decoration: InputDecoration(
                      label: const Text('Address'),
                      hintText: 'Enter your address',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    maxLines: 3,
                  ),
                  const SizedBox(height: 10,),
                  const Text('Gender : '),
                  Row(
                    children: [
                      Expanded(
                        child: RadioListTile(value: 'Male', groupValue: gender, onChanged: (value) {
                          setState(() {
                            _gender = value!;
                          });                        
                        },
                        title:const Text('Male'),),
                      ),
        
                      Expanded(
                        child: RadioListTile(value: 'Female', groupValue: gender, onChanged: (value){
                          setState(() {
                            _gender = value!;
                          });
                        },
                        title: const Text('Female'),
                        ),
                      ),
                    ],
                  ),
                const SizedBox(height: 10,),
                const Text('Enter your age range'),
                Slider(value: age, onChanged: (value){
                  setState(() {
                    _age = value;
                  });
                },
                max: 50,
                min: 5,
                divisions: 9,
                label: age.round().toString(),),
        
                SizedBox(
                  height: 300,
                  child: GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    ),
                    itemCount:_skills.length,
                    itemBuilder: (context,index){
                      final skills = _skills[index];
                      final skillName = skills.keys.first;
                      final skillValue = skills.values.first;
                    return CheckboxListTile(value: skillValue,title: Text(skillName),onChanged: (value)=> _onChange(index,value),shape: Border.all(width: 2),);
                  }),
                ),
                ElevatedButton(onPressed: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context) => DataPage(name: _name.text,email:  _email.text,address: _address.text,city: _city,gender:  _gender,age:  _age.round(),skills: _skills.where((skill) => skill.values.first).map((skill) => skill.keys.first).toList(),)));
                }, child: Text('Next'))
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        print('''
Name : ${_name.text} ,
Email : ${_email.text},
City : $_city,
Address : ${_address.text},
Gender : $gender,
Age range : ${_age.round()},
Skills : ${_skills.where((skill) => skill.values.first).map((skill) => skill.keys.first).toList()},
''');
      }),
    );
  }
}