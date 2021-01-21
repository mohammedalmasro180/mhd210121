import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class myctrl{
  var name;
  var address;

  List list;
  int i;
  Future <dynamic>chr(){
    name="0940071446";
  }
  Future<List> gitdatacat() async {
    Map map;
    String username = 'DM1AC87PAGQSHGLDT71XMNWCYFZ4BRDE';
    String password = ':';
    String auth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));

    http.Response response = await http.get(
        'https://tpowep.com/mhd/prestashop/api/categories/?display=full&output_format=JSON',
        headers: <String, String>{'authorization': auth,});

    map = json.decode(response.body);
    for (i = 0; i < 10; i++) {
      name = map['categories'][i]['name'][1]['value'];

      map.forEach((k, v) =>
          list.add(map['categories'][i]['name'][1]['value'].toString()));
      print(list);
    }
    print("nam");

    return list;


  }
  Future<void> getproduct() async {
    Map map;
    int i = 0;
    //name;
    var img;
    String username = 'DM1AC87PAGQSHGLDT71XMNWCYFZ4BRDE';
    String password = ':';
    String auth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));

    print(auth);
    http.Response response = await http.get(
        'https://tpowep.com/mhd/prestashop/api/products/?display=full&output_format=JSON',
        headers: <String, String>{'authorization': auth,});
    map = json.decode(response.body);

    List<String> list = new List();

    for (i = 0; i < 10; i++) {
      address = map['products'][i]['manufacturer_name'];
      img = map['products'][i]['id_default_image'];
      map.forEach((k, v) =>
          list.add(map['products'][i]['manufacturer_name'].toString()));
      //print(address);
    }
  }
}