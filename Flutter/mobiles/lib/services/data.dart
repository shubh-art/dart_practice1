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

   Map<String,dynamic> toJson()
  {
    return{
      'name' : name,
      'data' : data,
    };
  }
}

class DataProvider extends ChangeNotifier{
   List<Data> _list = [];
  
  List<Data> get list => _list;

  var id = '';

  final _BASE_URL = Uri.parse('https://api.restful-api.dev/objects');

  Uri _getUrl(var id) => Uri.parse('https://api.restful-api.dev/objects/$id');


  Future<void> loadData() async{
    try{
      final response =await http.get(_BASE_URL);
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

  
  Future<void> delete(var id)async{
try{    
  final response = await http.delete(_getUrl(id));
    if(response.statusCode == 200 )
    {
      print('Deleted Sucessfully ...');
      loadData();
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


  Future<void> addNew( Data data )async{
  try{
    final response =await http.post(_BASE_URL,
  body: jsonEncode(data.toJson()));
  if(response.statusCode == 200)
  {
    print('New item added sucessfully...');
    loadData();
  }
  else{
    print('Failed to add ... ');
  }
  }
  catch(e){
    print('error : $e');
  }
  }


  Future<void> edit(var id , Map<String , dynamic> patchData)
  async{

try{    final response = await http.patch(
  _getUrl(id),
  headers: {"Content-Type" : "application/json"},
  body: jsonEncode(patchData));

    if( response.statusCode == 200 )
    {
      print('Patch Successful ... ');
      loadData();
    }
    else
    {
      print('Failed to patch');
    }}
    catch(e){
      print('error : $e');
    }
  }


  Future<void> update(var id , Data data)
  async{

    try{
      final response = await http.put(
        _getUrl(id),
        headers: {"Content-Type" : "application/json"},
        body: jsonEncode(data.toJson()));
      if( response.statusCode == 200 )
      {
        print('Update successfully ...');
        loadData();
      }
      else
      {
        print('Failed tp update');
      }
    }
    catch(e)
    {
      print(' error : $e');
    }
}

}

