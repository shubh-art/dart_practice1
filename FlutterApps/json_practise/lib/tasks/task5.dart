// {
//   "company": {
//     "name": "TechCorp",
//     "departments": [
//       {
//         "name": "IT",
//         "employees": [
//           {"id": 101, "name": "Alice", "role": "Developer"},
//           {"id": 102, "name": "Bob", "role": "Tester"}
//         ]
//       },
//       {
//         "name": "HR",
//         "employees": [
//           {"id": 201, "name": "Charlie", "role": "Recruiter"},
//           {"id": 202, "name": "David", "role": "Trainer"}
//         ]
//       }
//     ]
//   }
// }
import 'dart:convert';

void main()
{
  String jsonString = 
  '''
{
  "company": {
    "name": "TechCorp",
    "departments": [
      {
        "name": "IT",
        "employees": [
          {"id": 101, "name": "Alice", "role": "Developer"},
          {"id": 102, "name": "Bob", "role": "Tester"}
        ]
      },
      {
        "name": "HR",
        "employees": [
          {"id": 201, "name": "Charlie", "role": "Recruiter"},
          {"id": 202, "name": "David", "role": "Trainer"}
        ]
      }
    ]
  }
}
''';

Map<String , dynamic> jsonData = jsonDecode(jsonString);

print('Company : ${jsonData['company']['name']}');

for( var department in jsonData['company']['departments'] )
{
  print( '\n Department : ${department['name']}' );
  for( var employee in department['employees'])
  {
    print('  - Name : ${employee['name']}   - Role : ${employee['role']}');
  }
}

}