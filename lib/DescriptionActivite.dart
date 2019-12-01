import 'dart:ui' as prefix0;

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




class DescriptionActivite extends StatelessWidget {

  final String name;
  final List adress;
  final String categorie;
  DescriptionActivite({Key key, @required this.name,@required this.adress,@required this.categorie }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name!=null?name:'Default Value'),
      ),
     body:Padding(

        padding: const EdgeInsets.only(top: 8.0),
       child:Column(

         children: <Widget>[
         new Container(

            alignment: Alignment.centerLeft,
             padding: new EdgeInsets.only(top: 16.0),

          child: new Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,

            children: <Widget>[

                 new Text(

                name!=null?name:'Default Value', style: new TextStyle(fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
                textAlign: TextAlign.center,
          ),
          ],
              ),
           ),
         new Padding(

           padding: const EdgeInsets.only(top: 30.0),
            child:Wrap(
            spacing: 10,
              runSpacing: 20,


              children: <Widget>[

                  new Text(
                  'Adresse :', style: new TextStyle(fontSize: 18,
                    color: Colors.black),
                  textAlign: TextAlign.left,
                ),


                new Text(
                  adress!=null?adress[0]:'Default Value',
                  style: new TextStyle(fontSize: 18,
                      color: Colors.black),
                  textAlign: TextAlign.left,
                ),

                new Text(
                  adress!=null?adress[1]:'Default Value',
                  style: new TextStyle(fontSize: 18,
                      color: Colors.black),
                  textAlign: TextAlign.left,
                ),

                new Text(
                  'Categorie : ', style: new TextStyle(fontSize: 18,
                    color: Colors.black),
                  textAlign: TextAlign.left,
                ),
                new Text(
                  categorie!=null?categorie:'Default Value', style: new TextStyle(fontSize: 18,
                    color: Colors.black),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
         ),

        ],
        ),

     ),
    );

  }
}
