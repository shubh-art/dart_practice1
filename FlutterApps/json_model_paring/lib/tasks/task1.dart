// {
//   "organization": {
//     "name": "FutureTech",
//     "branches": [
//       {
//         "city": "New York",
//         "employees": {
//           "developers": [
//             {"id": 101, "name": "Alice", "skills": ["Flutter", "Dart"]},
//             {"id": 102, "name": "Bob", "skills": ["Java", "Spring"]}
//           ],
//           "managers": [
//             {"id": 201, "name": "Charlie", "team_size": 5}
//           ]
//         }
//       },
//       {
//         "city": "San Francisco",
//         "employees": {
//           "developers": [
//             {"id": 103, "name": "David", "skills": ["React", "Node.js"]},
//             {"id": 104, "name": "Eve", "skills": ["Python", "Django"]}
//           ],
//           "managers": [
//             {"id": 202, "name": "Frank", "team_size": 8}
//           ]
//         }
//       }
//     ]
//   }
// }

import 'dart:convert';

class Manager{
  String name;
  int teamSize;
  Manager({required this.name,required this.teamSize});

  factory Manager.fromJson(Map<String , dynamic> json){
    return Manager(
      name: json['name'],
      teamSize: json['team_size'],
      );
  }

  Map<String , dynamic> toJson(){
    return{
      'name' : name,
      'team_size' : teamSize,
    };
  }
}

class Developer{
  String name;
  List<String> skills;

  Developer({required this.name , required this.skills});

  factory Developer.fromJson(Map<String , dynamic> json)
  {
    return Developer(
      name: json['name'],
      skills: List<String>.from(json['skills']),
      );
  }

  Map<String,dynamic> toJson()
  {
    return {
      'name' : name,
      'skills' : skills,
    };
  }
}

class Employee {
  List<Developer> developers;
  List<Manager> managers;
  Employee({required this.developers , required this.managers});

  factory Employee.fromJson(Map<String,dynamic> json){
    return Employee(
      developers: (json['developers'] as List<dynamic>).map((e) => Developer.fromJson(e)).toList(),
      managers:(json['managers'] as List<dynamic>).map((e) => Manager.fromJson(e)).toList(),
      );
  }

  Map<String , dynamic> toJson(){
    return{
      'developers' : developers.map((e) => e.toJson()).toList(),
      'managers' : managers.map((e) => e.toJson()).toList(),
    };
  }
}

class Branch{
  String city;
  Employee employees;
  Branch({required this.city , required this.employees});

  factory Branch.fromJson(Map<String,dynamic> json){
    return Branch(
    city: json['city'],
    employees: Employee.fromJson(json['employees']),
    );
  }

  Map<String , dynamic> toJson(){
    return{
      'city' : city,
      'employees' : employees.toJson(),
    };
  }
}

class Organization{
  String name;
  List<Branch> branches;
  Organization({required this.name , required this.branches});

  factory Organization.fromJson(Map<String , dynamic> json){
    return Organization(
      name: json['name'],
      branches: (json['branches'] as List<dynamic>).map((e) => Branch.fromJson(e)).toList(),
      );
  }

  Map<String,dynamic> toJson(){
    return{
      'name' : name,
      'branches' : branches.map((e) => e.toJson()).toList(),
    };
  }
}

void main(){
  String jsonString = '''{
  "organization": {
    "name": "FutureTech",
    "branches": [
      {
        "city": "New York",
        "employees": {
          "developers": [
            {"id": 101, "name": "Alice", "skills": ["Flutter", "Dart"]},
            {"id": 102, "name": "Bob", "skills": ["Java", "Spring"]}
          ],
          "managers": [
            {"id": 201, "name": "Charlie", "team_size": 5}
          ]
        }
      },
      {
        "city": "San Francisco",
        "employees": {
          "developers": [
            {"id": 103, "name": "David", "skills": ["React", "Node.js"]},
            {"id": 104, "name": "Eve", "skills": ["Python", "Django"]}
          ],
          "managers": [
            {"id": 202, "name": "Frank", "team_size": 8}
          ]
        }
      }
    ]
  }
}
''';

Map<String , dynamic> jsonData = jsonDecode(jsonString);

Organization organization = Organization.fromJson(jsonData['organization']);

print(' Organization : ${organization.name} \n ');

for(var branch in organization.branches)
{
  print(' Branch : ${branch.city}');
  print('   Developers :');
  for(var developers in branch.employees.developers)
{
  print('  - ${developers.name}  ,  Skills : ${developers.skills.join(', ')}');
}
  print('   Managers : ');
  for( var managers in branch.employees.managers)
  {
    print('  Name : ${managers.name} , Team Size : ${managers.teamSize}');
  }

  print('\n');
}
}