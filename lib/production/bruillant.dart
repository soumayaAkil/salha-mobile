import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:salha_mobile_femme/production/getListeProduit.dart';
import 'file:///C:/Users/Akil/flutter/salha_mobile_femme/lib/production/getminQ.dart';
import 'package:salha_mobile_femme/production/getunite.dart';
class FromProdScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return FromPScreenState ();
  }

}

class FromPScreenState extends State<FromProdScreen> {
  String selectProduit;
  List data = List();
  Future myFuture;
int _shelter;

  String dropdownvalueNB = '1';
  var itemsNB =  ['1','2','3','4','5'];
  final GlobalKey<FormState>  _formKey = GlobalKey<FormState>();
  Widget _buildShelter() {
    return
      Column(
        children: [
      TextFormField(
      decoration: InputDecoration(labelText: 'shelter'),
      validator: (String value) {
        if (value.isEmpty) {
          return ' is Required';
        }
        return null;
      },
      onSaved: (String value) {
        _shelter = value as int;
      },
    ),
          DropdownButton(
            value: dropdownvalueNB,
            icon: Icon(Icons.keyboard_arrow_down),
            items:itemsNB.map((String items) {
              return DropdownMenuItem(
                  value: items,
                  child: Text(items)
              );
            }
            ).toList(),
            onChanged: (String newValue){
              setState(() {
                dropdownvalueNB = newValue;
                print(dropdownvalueNB);
              });
            },
          ),
        ],);
  }



  Widget _buildRegion(){

  }

  final regionSelected = TextEditingController();

  @override
  Widget build(BuildContext context) {
    myFuture;
    return Scaffold(
        appBar: AppBar(title: Text("Ajouter production"),
          centerTitle: true,
        ),
        body: Container(
          margin: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                _buildShelter(),
                getminQ(),
                LUnite(),


              ],

            ),
          ),
        ));
  }
}

  /*
  import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class FromScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return FromScreenState ();
  }

}
class produit {
  int id_P;
  int nb_min;
  String nom_P;
  String image_P;
  int id_unite;
  produit(this.id_P,this.nb_min,this.nom_P,this.image_P,this.id_unite);
  produit.formJson(Map<String,dynamic> json){
    id_P = json['id_P'];
    nb_min = json['nb_min'];
    nom_P= json['nom_P'];
    image_P = json['image_P'];
    id_unite = json['id_unite'];



  }

}

class FromScreenState extends State<FromScreen> {
  String selectProduit;
  int _shelter;

  List<produit> _Reg = <produit>[];
  List data = List();
  Future myFuture;
  Future<dynamic> getData() async{
    var url='http://10.0.2.2:3000/produit/';
    var response = await http.get(url);
    var responsebody= json.decode(response.body);
    setState(() {
      data = responsebody;
    });

    print(responsebody);
    print('Loaded Successfully');

    return "Loaded Successfully";
  }

  String dropdownvalueNB = '1';
  var itemsNB =  ['1','2','3','4','5'];
  final GlobalKey<FormState>  _formKey = GlobalKey<FormState>();
  Widget _buildShelter() {
    return
      Column(
        children: [
      TextFormField(
      decoration: InputDecoration(labelText: 'shelter'),
      validator: (String value) {
        if (value.isEmpty) {
          return ' is Required';
        }
        return null;
      },
      onSaved: (String value) {
        _shelter = value as int;
      },
    ),
          DropdownButton(
            value: dropdownvalueNB,
            icon: Icon(Icons.keyboard_arrow_down),
            items:itemsNB.map((String items) {
              return DropdownMenuItem(
                  value: items,
                  child: Text(items)
              );
            }
            ).toList(),
            onChanged: (String newValue){
              setState(() {
                dropdownvalueNB = newValue;
              });
            },
          ),
        ],);
  }

  @override
  void initState() {
    super.initState();
    getData();

  }


  Widget _buildRegion(){

  }

  final regionSelected = TextEditingController();

  @override
  Widget build(BuildContext context) {
    myFuture;
    return Scaffold(
        appBar: AppBar(title: Text("Ajouter production"),
          centerTitle: true,
        ),
        body: Container(
          margin: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildShelter(),
                //LProduit
                DropdownButton(
                  value: selectProduit,
                  hint: Text('select Produit'),
                  items: data.map((item) {
                    return DropdownMenuItem(
                      child: Text(item['nom_P']),
                      value: item['nom_P'],
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectProduit = value;
                      print(value);
                    });
                  },
                ),


              ],

            ),
          ),
        ));
  }}
   */