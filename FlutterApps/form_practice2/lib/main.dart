import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      home: FormSample(),
    );
  }
}

class FormSample extends StatefulWidget {
  const FormSample({super.key});

  @override
  State<FormSample> createState() => _FormSampleState();
}

class _FormSampleState extends State<FormSample> {
TextEditingController _Email = TextEditingController();
TextEditingController _Pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Validation'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Container(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _Email,
                decoration: InputDecoration(
                  label: Text('Email'),
                  hintText: 'Enter email',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Colors.orange,
                      width: 3,
                    )
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Colors.blueAccent,
                      width: 2,
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Colors.blueGrey,
                      width: 2
                    )
                  ),
                  suffixText: null,
                  suffixIcon: IconButton(onPressed: (){}, icon:Icon(Icons.remove_red_eye,color: Colors.amber,)),
                  prefixIcon: Icon(Icons.mail),
                ),
                enabled: true,
              ),
              SizedBox(height: 20,),
              TextField(
                controller: _Pass,
                obscureText: true,
                obscuringCharacter: '*',
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              ElevatedButton(onPressed: (){
                final String Email = _Email.text.toString();
                final String Pass = _Pass.text;

                print(' Email : $Email , Pass : $Pass');
              },child: Text('Submit'))
            ],
          ),
        ),
      ),
    );
  }
}