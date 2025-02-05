import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Data {
  String id;
  String name;
  dynamic data;
  Data({required this.id , required this.name , required this.data});
  factory Data.fromJson(Map<String , dynamic> json){
    return Data(
      id: json['id'],
    name: json['name'],
    data: json['data'],
    );
  }
}

class DataProvider extends ChangeNotifier{
   List<Data> _list = [];
  
  List<Data> get list => _list;

  Future<void> loadData() async{
    final url = Uri.parse('https://api.restful-api.dev/objects');
    try{
      final response =await http.get(url);
    if( response.statusCode == 200 )
    {
      List<dynamic> data_list = jsonDecode(response.body);
      _list = data_list.map<Data>((data) => Data.fromJson(data)).toList();
      notifyListeners();
    }
    else
    print('fail to load');
  }
  catch(e){
    print('Error : $e');
  }
  }
  
  Future<void> delete(String id)async{
    final url = Uri.parse('https://api.restful-api.dev/objects/$id');

try{    final response = await http.delete(url);
    if(response.statusCode == 200 )
    {
      print('Deleted Sucessfully ...');
    }
    else
    {
      print('Failed to delete ...');
    }
    }
    catch(e)
    {
      print('Error : $e');
    }

  }
}

