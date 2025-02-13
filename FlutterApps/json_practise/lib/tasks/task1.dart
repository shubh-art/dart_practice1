// {
//   "name": "John Doe",
//   "age": 30,
//   "city": "New York"
// }

import 'dart:convert';

void main()
{
  String jsonString = '''{
  "name": "John Doe",
  "age": 30,
  "city": "New York"
}''';

Map<String,dynamic> jsonData = jsonDecode(jsonString);

print('Name : ${jsonData['name']}');
print('age : ${jsonData['age']}');
print('city : ${jsonData['city']}');

}