import 'dart:ui' as prefix0;

import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart';




class DescriptionActivite extends StatelessWidget {

  final String name;
  final String adress;
  final String categorie;
  final String city;
  final String postalCode;
  DescriptionActivite({Key key, @required this.name,@required this.adress,@required this.city,@required this.postalCode,@required this.categorie }) : super(key: key);
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
                  adress!=null?adress:'Default Value',
                  style: new TextStyle(fontSize: 18,
                      color: Colors.black),
                  textAlign: TextAlign.left,
                ),
                new Text(
                  city!=null?city:'Default Value',
                  style: new TextStyle(fontSize: 18,
                      color: Colors.black),
                  textAlign: TextAlign.left,
                ),
                new Text(
                  postalCode!=null?postalCode:'Default Value',
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
