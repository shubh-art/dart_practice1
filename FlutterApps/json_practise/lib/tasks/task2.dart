// {
//   "name": "Alice",
//   "hobbies": ["Reading", "Gaming", "Cooking"]
// }

import 'dart:convert';

void main()
{
  String jsonString = '''{
  "name": "Alice",
  "hobbies": ["Reading", "Gaming", "Cooking"]
}
''';

Map<String , dynamic> jsonData = jsonDecode(jsonString);

print('name : ${jsonData['name']}');
print('hobbies : ${jsonData['hobbies']}');

for( var hobby in jsonData['hobbies'])
{
  print('hobby : ${hobby}');
}
}