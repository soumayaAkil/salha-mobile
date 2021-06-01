import 'package:flutter/material.dart';
import 'package:salha_mobile_femme/production/ajoutPROD.dart';
import 'package:salha_mobile_femme/production/ajouter_Prod.dart';
import 'package:salha_mobile_femme/production/bruillant.dart';
import 'package:salha_mobile_femme/production/getListeProduit.dart';
import 'package:salha_mobile_femme/production/listProd.dart';
import 'package:salha_mobile_femme/widget/contact.dart';

import '../constants.dart';

class ABody extends StatefulWidget {
  @override
  _ABodyState createState() => _ABodyState();
}

class _ABodyState extends State<ABody> {
  @override
  Widget build(BuildContext context) {
    return
      GridView.count(

        primary: false,
        padding: const EdgeInsets.only(top: 150, right: 60, left: 60),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: <Widget>[

          Container(
            padding: const EdgeInsets.all(8),
            child: Column(
            children: [
            InkWell(
            onTap: () {
            Navigator.push(
            context, MaterialPageRoute(builder: (context) => LProduit()),
            );
            },  child: Container(
              child:ClipRRect(
                    borderRadius: BorderRadius.circular(30.30),
                    child: Image.asset('images/production.png', width: 200,),
    ),

    ),
    ),
                  Center(child: Text("Production", style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    decoration: TextDecoration.none,),)),

            ]
            ),
            color: Colors.grey[200],
          ),

          Container(
            padding: const EdgeInsets.all(8),
            child: Column(
                children: [
                InkWell(
                onTap: () {
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LProduit()),
                );
                },  child: Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.30),
                    child: Image.asset('images/besoin.png', width: 200,),
                  ),
    ),),
                  Center(child: Text("Besoin", style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    decoration: TextDecoration.none,),)),

                ]
            ),


            color: Colors.grey[200],
          ),
          Container(
              height: double.infinity,
              color: Colors.grey[200],
              child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30.30),
                      child: Image.asset('images/gestion.png', width: 200,),
                    ),
                    Center(child: Text("Gestion", style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      decoration: TextDecoration.none,),)),

                  ]
              )

          ),
          Container(
              padding: const EdgeInsets.all(8),

              color: Colors.grey[200],
              child: Material(
                color: Colors.grey[200],
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Contact()),
                        );
                      },
                      child: Container(
                          child: Icon(Icons.phone_in_talk,color: bacgroundV,size: 95,)
                      ),
                    ),
                    //color: Colors.grey[200],

                    Center(child: Text("Contacter", style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      decoration: TextDecoration.none,),)),

                  ],
                ),
              )


          ),

        ],
      );
  }
}