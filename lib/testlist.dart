import 'package:flutter/material.dart';

import 'dart:async';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
List<String> list = new List();

Map map;
Map Product;
var Productsn;
int i=0;
int c=0;

var name;
void main() async {
  String username = 'DM1AC87PAGQSHGLDT71XMNWCYFZ4BRDE';
  String password = ':';
  String auth =
      'Basic ' + base64Encode(utf8.encode('$username:$password'));

  print(auth);

  http.Response Products = await http.get(
      'http://p3ly.com/api/products/?display=full&output_format=JSON',
      headers: <String, String>{'authorization': auth,});
  Product= json.decode(Products.body);  http.Response response = await http.get(

      'https://tpowep.com/mhd/prestashop/api/products/?display=full&output_format=JSON',
      headers: <String, String>{'authorization': auth,});
  map = json.decode(response.body);

  List<String> list = new List();

  for(i=0;i<10;i++) {
    Productsn = map['products'][i]['manufacturer_name'];
//    img =+ map['products'][i]['id_default_image'];
    map.forEach((k, v) =>
        list.add(map['products'][i]['manufacturer_name'].toString()));

  }



  print(Productsn);

/*  http.Response response = await http.get(
      'https://tpowep.com/mhd/prestashop/api/categories/?display=full&output_format=JSON',
      headers: <String, String>{'authorization': auth,});
  map = json.decode(response.body);
  for (i = 0; i < 10; i++) {
    name = map['categories'][i]['name'][1]['value'];


    map.forEach((k, v) =>
        list.add(map['categories'][i]['name'][1]['value'].toString()));

    print(name);

*/
    runApp(new MaterialApp(
      title: 'P3ly Store',
      home: new Scaffold(
          appBar: AppBar(
            title: new Text('P3ly'),
            backgroundColor: Colors.blue,
          ),
          body:listproduct()

          )


      ),

    );
  }


Widget listproduct(){
  return GridView.builder(
    gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2),
    itemBuilder: (BuildContext context, int index) {
      return new  Column(
        children: [
          /*Image.network(
                    //"https://p3ly.com/api//api/images/products/"+img.toString(),
                      width: 200,
                  height: 200,
                  ),*/
          SizedBox(
            height: 10,
          ),

          ListTile(title: Text("price"),
            leading: Text(Productsn.toString()),
          )
        ],
      );
    },

  );
}
Widget listcat(){
  return ListView.builder(
      itemCount: i,
      scrollDirection: Axis.horizontal,

      itemBuilder: (context, index) {
        return Padding(padding: EdgeInsets.all(15),
          child: Text(list[index].toString(),style: TextStyle(backgroundColor: Colors.pinkAccent),),);
      });
}