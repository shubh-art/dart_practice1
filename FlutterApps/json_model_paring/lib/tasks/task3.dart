// {
//   "store": {
//     "name": "Gadget World",
//     "products": [
//       {
//         "id": "A101",
//         "name": "Smartphone",
//         "price": 699.99,
//         "details": {
//           "brand": "XYZ Corp",
//           "specs": {
//             "RAM": "8GB",
//             "storage": "128GB",
//             "camera": ["48MP", "12MP"]
//           }
//         }
//       },
//       {
//         "id": "B202",
//         "name": "Laptop",
//         "price": 1199.50,
//         "details": {
//           "brand": "ABC Tech",
//           "specs": {
//             "RAM": "16GB",
//             "storage": "512GB SSD",
//             "graphics": {
//               "brand": "NVIDIA",
//               "memory": "6GB"
//             }
//           }
//         }
//       }
//     ]
//   }
// }


import 'dart:convert';

class Graphics{
  String brand;
  String memory;

  Graphics({required this.brand , required this.memory});

  factory Graphics.fromJson(Map<String,dynamic> json) => Graphics(brand: json['brand'], memory: json['memory']);

  Map<String,dynamic> toJson() => {'brand' : brand , 'memory' : memory };
}

class Specs{
  String RAM;
  String storage;
  List<String>? camera;
  Graphics? graphics;

  Specs({required this.RAM,required this.graphics,required this.storage,required this.camera});

  factory Specs.fromJson(Map<String,dynamic> json){
    return Specs(
      RAM: json['RAM'],
      graphics: json['graphics'] != null ? Graphics.fromJson(json['graphics']) : null ,
      storage: json['storage'],
      camera: json['camera'] != null ? List<String>.from(json['camera']) : null
      );
  }

  Map<String,dynamic> toJson() => { 'RAM' : RAM , 'graphics' : graphics?.toJson() , 'storage' : storage , 'camera' : camera};
  
}

class Product{
  String name;
  double price;
  String brand;
  Specs specs;

  Product({required this.name , required this.price , required this.brand , required this.specs});

  factory Product.fromJson(Map<String,dynamic> json) => Product(name: json['name'], price: json['price'], brand: json['details']['brand'], specs: Specs.fromJson(json['details']['specs']));

  Map<String,dynamic> toJson() => {'name' : name , 'price' : price , 'brand' : brand , 'specs' : specs.toJson()};

}

class Store{
  String name;
  List<Product> products;

  Store({required this.name , required this.products});

  factory Store.fromJson(Map<String,dynamic> json) => Store(name: json['store']['name'], products: (json['store']['products'] as List<dynamic>).map((e) => Product.fromJson(e)).toList());

  Map<String,dynamic> toJson() => {'name' : name , 'products' : products};
}

void main()
{
  String jsonString = '''{
  "store": {
    "name": "Gadget World",
    "products": [
      {
        "id": "A101",
        "name": "Smartphone",
        "price": 699.99,
        "details": {
          "brand": "XYZ Corp",
          "specs": {
            "RAM": "8GB",
            "storage": "128GB",
            "camera": ["48MP", "12MP"]
          }
        }
      },
      {
        "id": "B202",
        "name": "Laptop",
        "price": 1199.50,
        "details": {
          "brand": "ABC Tech",
          "specs": {
            "RAM": "16GB",
            "storage": "512GB SSD",
            "graphics": {
              "brand": "NVIDIA",
              "memory": "6GB"
            }
          }
        }
      }
    ]
  }
}
''';

Map<String,dynamic> jsonData = jsonDecode(jsonString);

Store store = Store.fromJson(jsonData);

print(' Store Name : ${store.name}');

for(var Product in store.products)
{
  print(' Product name : ${Product.brand} ${Product.name} ');
  print('Price : ${Product.price}');
  print('Specs : RAM(${Product.specs.RAM}), Storage(${Product.specs.storage})');
  if( Product.specs.graphics != null )
  print('\t\t Graphics : ${Product.specs.graphics?.brand} ${Product.specs.graphics?.memory}');
  else
  print('\t\t Camera : ${Product.specs.camera?.join(', ')}');
}
}