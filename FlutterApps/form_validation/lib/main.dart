import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(home: const HomePage(),);
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _globalKey = GlobalKey<FormState>();
  String _email = '';
  String _pass = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            width: 250,
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              border:Border.all(
                width: 1,
              ),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(blurRadius: 12,offset: Offset(3, 7),spreadRadius: 5,color: Colors.yellow),
              ],
              color: Colors.white,
            ),
            child: Form(
              key: _globalKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      labelText: 'Email',
                      hintText: 'Enter your email',
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if(value == null || value.isEmpty)
                      {
                        return 'Enter an Email';
                      }
                      else if(!EmailValidator.validate(value)){
                        return 'Enter a valid Email';
                      }
                      return null;
                    },
                    onSaved: (newValue) => _email = newValue!,
                  ),
            
                  TextFormField(
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      labelText: 'Password',
                      hintText: 'Enter Password',
                    ),
                    obscureText: true,
                    validator: (value) {
                      final regex = r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$%&*?.])[a-zA-Z\d@$%&*?.]{8,}$";
                      if( value == null || value.isEmpty )
                      {
                        return 'Enter password';
                      }
            
                      else if( !RegExp(regex).hasMatch(value) ){
                        return 'Enter a valid password';
                      }
            
                      return null;
                    },
                    onSaved: (newValue) => _pass = newValue!,
                  ),
            
                  SizedBox(height: 8,),
            
                  ElevatedButton(onPressed: (){
                    if(_globalKey.currentState!.validate())
                    {
                      _globalKey.currentState!.save();
                      _globalKey.currentState!.reset();
                      print('Email : $_email , password : $_pass');
                    }
                  }, child: Text('Enter')),
            
                ],
            )),
          ),
        ),
        ),
    );
  }
}