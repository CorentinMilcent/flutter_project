import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project/DescriptionActivite.dart';
import 'package:flutter_project/env.dart';


import 'package:http/http.dart' as http;
import 'dart:convert' show json;
import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';



void main() {
  runApp(new MaterialApp(
      home: new HomePage()
  ));
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}


class HomePageState extends State<HomePage> {

 static ClientApi client =new ClientApi();

  String client_id=client.CLIENT_ID;
  String client_secret=client.CLIENT_SECRET;
  final ville = TextEditingController();
  final activite = TextEditingController();



  List data;


  Future<String> getData() async {

    var response = await http.get(
        Uri.encodeFull("https://api.foursquare.com/v2/venues/explore?client_id="+client_id+"&client_secret="+client_secret+"&v=20180323&near="+ville.text+"&query="+activite.text),
        headers: {
          "Accept": "application/json"
        }
    );

    this.setState(() {

      data = json.decode(response.body)["response"]["groups"][0]["items"];

    });

    print(data[0]["venue"]["name"]);

    return "Success!";
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    activite.dispose();
    ville.dispose();
    super.dispose();
  }
 ClampingScrollPhysics clampingScrollPhysics =
 new ClampingScrollPhysics ();

 @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Fetch Data Example',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Recherche d\'activité'),
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child:Center(
              child:new SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(


                  children: <Widget>[
                  Text(
                    "Entrer la ville souhaité",
                  ),
                  TextField(
                    controller: ville,
                  ),

                  Text(
                    'Entrer l\'activité souhaité',
                  ),
                  TextField(
                    controller: activite,
                  ),
                  RaisedButton(

                    color: Color(0xFF00BCD4),
                    onPressed: (){
                    setState(() {
                      if(data!=null) {
                        data.clear();
                      }
                       getData();
                    });
                   }
                       , child: Row(
                        children: <Widget>[
                          Text('Rechercher', style: TextStyle(color: Colors.black),),
                          Icon(Icons.search, color: Colors.white,),
                        ],
                      ),
                      ),
                 ListView.builder(
                  itemCount: data == null ? 0 : data.length,
                  physics: clampingScrollPhysics,
                   scrollDirection: Axis.vertical,
                  shrinkWrap: true,

                  itemBuilder: (BuildContext context, int index){
                    return new GestureDetector( //You need to make my child interactive
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DescriptionActivite(name: data[index]["venue"]["name"],adress:data[index]["venue"]["location"]["formattedAddress"],categorie:data[index]["venue"]["categories"][0]["name"] )),
                      ),
                      child: new Card( //I am the clickable child
                        child: new Column(

                          children: <Widget>[
                            //new Image.network(video[index]),
                            new Padding(padding: new EdgeInsets.all(16.0)),
                            new  Text(data[index]["venue"]["name"],
                              style: new TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 22.0,
                                  color: Colors.black),
                            ),
                          ],
                        ),),
                    );
                  },
                ),
                ],
              ),
            ),
          ),
          ),
        ),
      );
    }
}









