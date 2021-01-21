import 'package:flutter/material.dart';

import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/rendering.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:listprestashop/dt.dart';
import 'package:listprestashop/myctrl.dart';
import 'package:listprestashop/widges.dart';
var address;
String route;
screen myscreen=new screen();
var price;
var id;
void main() async {
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

      'https://p3ly.com/api/products/?display=full&output_format=JSON',
      headers: <String, String>{'authorization': auth,});
  map = json.decode(response.body);

  List<String> list = new List();
  List<String> pricelist = new List();
  List<String> idlist = new List();

  for (i = 0; i < 10; i++) {
    address = map['products'][i]['link_rewrite'][1]['value'];
    img = map['products'][i]['id_default_image'];
    id = map['products'][i]['id'];
    price = map['products'][i]['price'];
    map.forEach((k, v) =>
        list.add(map['products'][i]['link_rewrite'][1]['value'].toString()));
    map.forEach((k, v) =>
        pricelist.add( map['products'][i]['price'].toString()));
    map.forEach((k, v) =>
        idlist.add( map['products'][i]['id'].toString()));

    print(address);
route=idlist.toString();


    runApp(new MaterialApp(
        title: 'P3ly Store',
        home: new Scaffold(
            appBar: AppBar(
              title: new Text('Yes-shop'),
              backgroundColor: Colors.red,
            ),
            body:  ListView.builder(

            itemCount: i,
            //scrollDirection: Axis.horizontal,

            itemBuilder: (context, index) {
              return Padding(padding: EdgeInsets.all(10),
              child:AppBar(

                backgroundColor: Colors.white,
                title:Row(children: [

                  Padding(padding: EdgeInsets.all(20),
                  child: Image.network("https://s7d2.scene7.com/is/image/dksfed/19soccer_package_red_black",
                    //"http://tpowep.com/mhd/prestashop/api/images/products/1/1",
                    //"https://tpowep.com/mhd/prestashop/api/images/products/[${idlist[index].toString()}]/",
                    width: 100,
                    height: 100,),),
                  InkWell(onTap:() {

              var route = new MaterialPageRoute(
              builder: (BuildContext context) =>
              new ProductDetails(value:idlist[index].toString()),
              );
              Navigator.of(context).push(route);



                  },
                    child: Text(

                      list[index].toString(),
                      style: TextStyle(color: Colors.black),
                    ),),
                ],),

                actions: [Padding(padding: EdgeInsets.all(15),
                child: Text(pricelist[index].toString(),

                    style: TextStyle(color: Colors.black)),)],
              ));
            })
        )
    )
    );
  }
}
  Future<void> getdata() async {


  }
