// {
//   "product": {
//     "id": 101,
//     "name": "Laptop",
//     "price": 75000.5,
//     "manufacturer": {
//       "name": "Dell",
//       "country": "USA"
//     }
//   }
// }

import 'dart:convert';

void main()
{
  String jsonString = '''{
  "product": {
    "id": 101,
    "name": "Laptop",
    "price": 75000.5,
    "manufacturer": {
      "name": "Dell",
      "country": "USA"
    }
  }
}''';

Map<String , dynamic> jsonData = jsonDecode(jsonString);
print('Name : ${jsonData['product']['name']}');
print('Price : ${jsonData['product']['price']}');
print('Manufacturer : ${jsonData['product']['manufacturer']['name']}');
print('Country : ${jsonData['product']['manufacturer']['country']}');
}