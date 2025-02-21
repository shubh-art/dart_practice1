import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
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
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(), 
        child: SafeArea(
          child: Center(
            child: Container(
              width: 300,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 12,
                    offset: const Offset(3, 7),
                    spreadRadius: 5,
                    color: Colors.yellow,
                  ),
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
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter an Email';
                        } else if (!EmailValidator.validate(value)) {
                          return 'Enter a valid Email';
                        }
                        return null;
                      },
                      onSaved: (newValue) => _email = newValue!,
                    ),

                    const SizedBox(height: 12),  

                    
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(  
                          borderRadius: BorderRadius.circular(12),
                        ),
                        labelText: 'Password',
                        hintText: 'Enter Password',
                      ),
                      obscureText: true,
                      validator: (value) {
                        final regex = r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$%&*?.])[a-zA-Z\d@$%&*?.]{8,}$";
                        if (value == null || value.isEmpty) {
                          return 'Enter password';
                        } else if (!RegExp(regex).hasMatch(value)) {
                          return 'Enter a valid password';
                        }
                        return null;
                      },
                      onSaved: (newValue) => _pass = newValue!,
                      textInputAction: TextInputAction.done,
                    ),

                    const SizedBox(height: 16),  

                    
                    ElevatedButton(
                      onPressed: () {
                        if (_globalKey.currentState!.validate()) {
                          _globalKey.currentState!.save();
                          _globalKey.currentState!.reset();
                          print('Email: $_email , Password: $_pass');
                        }
                      },
                      child: const Text('Enter'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
