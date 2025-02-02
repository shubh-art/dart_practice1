import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main()async{
  final Response = await http.get(Uri.parse('https://api.restful-api.dev/objects'));
  print(jsonDecode(Response.body));
}