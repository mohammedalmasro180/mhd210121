import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class screen {

 var address;

   Widget products() {
     get();
    return GridView.builder(
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return new Column(
          children: [
            /*Image.network(
                    //"https://p3ly.com/api//api/images/products/"+img.toString(),
                      width: 200,
                  height: 200,
                  ),*/
            SizedBox(
              height: 10,
            ),

            ListTile(title: Text("mymhd"),
              leading: Text(address.toString()),
            )
          ],
        );
      },

    );
  }

  Future<dynamic> get() async {
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
      print(address);
      return address;
    }
  }}
