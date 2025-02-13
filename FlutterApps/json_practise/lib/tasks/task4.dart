// {
//   "employees": [
//     {
//       "id": 1,
//       "name": "John Doe",
//       "designation": "Software Engineer"
//     },
//     {
//       "id": 2,
//       "name": "Jane Smith",
//       "designation": "Project Manager"
//     }
//   ]
// }

import 'dart:convert';

void main()
{
  String jsonString = '''
{
  "employees": [
    {
      "id": 1,
      "name": "John Doe",
      "designation": "Software Engineer"
    },
    {
      "id": 2,
      "name": "Jane Smith",
      "designation": "Project Manager"
    }
  ]
}
''';

Map<String,dynamic> jsonData = jsonDecode(jsonString);

List<dynamic> employee = jsonData['employees'];

for( var list in employee)
{
  print('Name : ${list['name']}');
  print('Designation : ${list['designation']}');
}
}