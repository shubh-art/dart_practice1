import 'package:flutter/material.dart';

class DataPage extends StatelessWidget {
final String name;
  final String email;
  final String address;
  final String city;
  final String gender;
  final int age;
  final List<dynamic> skills;

  DataPage({
    required this.name,
    required this.email,
    required this.address,
    required this.city,
    required this.gender,
    required this.age,
    required this.skills,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
          Text('Name : ${name}'),
          Text('${email}'),
          Text('Address : ${address}'),
          Text('City : ${city}'),
          Text('gender : ${gender}'),
          Text('Age : ${age}'),
          SizedBox(height: 200,
            child: GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 1,
                        mainAxisSpacing: 1,
                        ),
                        itemCount:skills.length,
                        itemBuilder: (context,index){
                          final skill = skills[index];
                        return Text(skill);
                      }),
          ),
        ],),
      ),
    );
  }
}