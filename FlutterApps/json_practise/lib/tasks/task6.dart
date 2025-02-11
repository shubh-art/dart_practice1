// {
//   "id": 1234,
//   "title": "Flutter JSON Parsing",
//   "ratings": [4.5, 4.8, 5.0, 3.9],
//   "metadata": {
//     "author": "John Doe",
//     "published": true,
//     "tags": ["flutter", "json", "dart"],
//     "views": 1500
//   }
// }

import 'dart:convert';

void main()
{
  String jsonString = 
  '''
{
  "id": 1234,
  "title": "Flutter JSON Parsing",
  "ratings": [4.5, 4.8, 5.0, 3.9],
  "metadata": {
    "author": "John Doe",
    "published": true,
    "tags": ["flutter", "json", "dart"],
    "views": 1500
  }
}
''';

Map<String , dynamic> jsonData = jsonDecode(jsonString);

print('Title : ${jsonData['title']}');
print('Rating : ${jsonData['ratings']}');
print('Author : ${jsonData['metadata']['author']}');
print('Tags : ');
for( var tags in jsonData['metadata']['tags'] )
{
  print('\t ${tags}');
}
print('Views : ${jsonData['metadata']['views']}');
}