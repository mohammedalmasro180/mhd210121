import 'package:flutter/material.dart';

import 'dart:async';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
List<String> list = new List();

Map map;
int i=0;
var name;
void main() async {
  String username = 'DM1AC87PAGQSHGLDT71XMNWCYFZ4BRDE';
  String password = ':';
  String auth =
      'Basic ' + base64Encode(utf8.encode('$username:$password'));

  print(auth);


  http.Response response = await http.get(
      'https://tpowep.com/mhd/prestashop/api/categories/?display=full&output_format=JSON',
      headers: <String, String>{'authorization': auth,});
  map = json.decode(response.body);
  for (i = 0; i < 10; i++) {
    name = map['categories'][i]['name'][1]['value'];


    map.forEach((k, v) =>
        list.add(map['categories'][i]['name'][1]['value'].toString()));

    print(name);


    runApp(new MaterialApp(
      title: 'P3ly Store',
      home: new Scaffold(
          appBar: AppBar(
            title: new Text('P3ly'),
            backgroundColor: Colors.blue,
          ),
          body:
          ListView.builder(
              itemCount: i,

              itemBuilder: (context, index) {
                return Text(name.toString());
              })

      ),
    ),
    );
  }
}