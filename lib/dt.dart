
import 'dart:async';
import 'dart:async';
import 'dart:convert';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart' as http;

class ProductDetails extends StatefulWidget {

  final String value;

  ProductDetails({Key key, this.value}) : super(key: key);


  @override



  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {

  var name;
  var price;
  var description;
  Map data;
  List userData;
  int id;
  int i;
  var quantity;
  String text;


  Future getData(BuildContext context) async {
    String username = 'BC779QASLN6E5BSVU7RX962UW6U6QF6C';
    String password = ':';
    String auth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));

    print(auth);

    http.Response response = await http.get(
        'https://p3ly.com/api/products/${widget.value.toString()}?output_format=JSON',
        headers: <String, String>{'authorization': auth,});
    data = json.decode(response.body);
//    print(data);
    name = data['product']['link_rewrite'][1]['value'];
    price = data['product']["price"];
    quantity = data['product']["quantity"];
    description=data['product']["description"];





    setState(() {
      userData = data["data"];
    });
  }

  @override
  void initState() {
    super.initState();
    getData(context);
  }

  @override
  Widget build(BuildContext context) {
    //id = ModalRoute.of(context).settings.arguments;
    String route=id.toString();
    return Scaffold(
      appBar: AppBar(
        title: InkWell(onTap: (){
          //Navigator.push(context, MaterialPageRoute(builder: (context)=> new HomePage()));
        },
          child: Text("TPOMarket"),),

        backgroundColor: Colors.red,
        actions: <Widget>[

          new IconButton(icon: Icon(Icons.search,color: Colors.white,), onPressed: null),
          new IconButton(icon: Icon(Icons.shopping_cart,color: Colors.white,), onPressed: null)

        ],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(accountName: Text("Mohammed Almasri")
              , accountEmail: Text("mohammedalmasri@gmail.com"),
              currentAccountPicture: GestureDetector(
                child: new CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person,color: Colors.white,),
                ),
              ),
              decoration: new BoxDecoration(
                  color: Colors.red
              ),
            ),
            InkWell(onTap: (){},
              child:
              ListTile(
                title: Text('Home Page'),
                leading: Icon(Icons.home),
              ),
            ),
            InkWell(onTap: (){},
              child:
              ListTile(
                title: Text('My acount'),
                leading: Icon(Icons.person),
              ),
            ),
            InkWell(onTap: (){},
              child:
              ListTile(
                title: Text('My Orders'),
                leading: Icon(Icons.shopping_basket),
              ),
            ),
            InkWell(onTap: (){},
              child:
              ListTile(
                title: Text('Ctaloges'),
                leading: Icon(Icons.dashboard),
              ),
            ),
            InkWell(onTap: (){},
              child:
              ListTile(
                title: Text('Likes'),
                leading: Icon(Icons.favorite),
              ),
            ),
            Divider(),
            InkWell(onTap: (){},
              child:
              ListTile(
                title: Text('About'),
                leading: Icon(Icons.help,color: Colors.indigo,),
              ),
            ),
            InkWell(onTap: (){},
              child:
              ListTile(
                title: Text('settings'),
                leading: Icon(Icons.settings),
              ),
            ),



          ],
        ),
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            height: 300,
            color: Colors.white,
            child: Image.network("https://i0.wp.com/florana.org/wp-content/uploads/2019/11/%D8%A7%D9%84%D9%85%D9%86%D8%B5%D9%88%D8%B1%D8%A9%D8%8C-%D9%85%D8%AD%D9%84-%D9%88%D8%B1%D8%AF-%D8%B7%D8%A8%D9%8A%D8%B9%D9%8A-%D9%88%D8%B5%D9%86%D8%A7%D8%B9%D9%8A-%D8%A8%D8%A7%D9%84%D9%85%D9%86%D8%B5%D9%88%D8%B1%D8%A9%D8%8C-%D8%A8%D9%88%D9%83%D9%8A%D9%87%D8%A7%D8%AA-%D9%88%D8%B1%D8%AF-%D8%B7%D8%A8%D9%8A%D8%B9%D9%8A-%D9%88%D8%B5%D9%86%D8%A7%D8%B9%D9%8A-%D9%81%D9%84%D9%88%D8%B1%D8%A7%D9%86%D8%A7-%D8%A7%D9%84%D9%85%D9%86%D8%B5%D9%88%D8%B1%D8%A9%D8%8C-%D9%81%D9%84%D9%88%D8%B1%D8%A7%D9%86%D8%A7%D8%8C-%D9%83%D9%88%D8%B4%D8%A9%D8%8C-%D8%AA%D9%86%D8%B8%D9%8A%D9%85-%D8%AD%D9%81%D9%84%D8%A7%D8%AA%D8%8C-%D8%AE%D8%B7%D9%88%D8%A8%D8%A9%D8%8C-%D8%A3%D8%B9%D9%8A%D8%A7%D8%AF-%D9%85%D9%8A%D9%84%D8%A7%D8%AF-27.jpg?fit=2633%2C3209&ssl=1"),

          ),
          new Container(
            color: Colors.white70,
            child: ListTile(
              leading: new Text(name.toString(),style: TextStyle(fontWeight: FontWeight.bold),),

              title: Row(
                children: <Widget>[
                  Expanded(
                    child: new Text(price.toString()),


                  ),Expanded(
                    child: new Text("Quantity   "+widget.value.toString()),


                  ),
                ],
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(child: MaterialButton(onPressed: (){},
                color: Colors.white,
                textColor:  Colors.grey,
                elevation: 0.2,
                child: Row(
                  children: <Widget>[
                    Expanded(child: new Text("Size")),
                    Expanded(child: new Icon(Icons.arrow_drop_down))
                  ],
                ),)),
              Expanded(child: MaterialButton(onPressed: (){
                showDialog(context: context,
                    builder: (context){
                      return new AlertDialog(
                        title: new Text("size"),
                        content: new Text("Chose the size"),
                        actions: <Widget>[
                          new MaterialButton(onPressed: (){
                            Navigator.of(context).pop(context);
                          },
                            child: new Text("Close"),
                          )
                        ],
                      );
                    });
              },
                color: Colors.white,
                textColor:  Colors.grey,
                elevation: 0.2,
                child: Row(
                  children: <Widget>[
                    Expanded(child: new Text("Color")),
                    Expanded(child: new Icon(Icons.arrow_drop_down))
                  ],
                ),)),
              Expanded(child: MaterialButton(onPressed: (){},
                color: Colors.white,
                textColor:  Colors.grey,
                elevation: 0.2,
                child: Row(
                  children: <Widget>[
                    Expanded(child: new Text("Qty")),
                    Expanded(child: new Icon(Icons.arrow_drop_down))
                  ],
                ),)),

            ],
          ),
          Row(
            children: <Widget>[
              Expanded(child: MaterialButton(onPressed: (){},
                  color: Colors.red,
                  textColor:  Colors.white,
                  elevation: 0.2,
                  child: new Text("Bay now")
              )),
              new IconButton(icon: Icon(Icons.shopping_cart,color: Colors.cyan,), onPressed: (){}),
              new IconButton(icon: Icon(Icons.favorite_border,color: Colors.cyan,), onPressed: (){}),



            ],
          ),
          new ListTile(
            title: new Text("Product detali"),
            subtitle: new Text(description.toString().substring(115,190)),
          ),
          Padding(padding: EdgeInsets.only(bottom: 30),
            child: Text("",style: TextStyle( fontSize: 18),),),
          Container(
            height: 360,


          )

        ],
      ),

    );
  }

}
