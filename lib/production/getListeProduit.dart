import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:salha_mobile_femme/constants.dart';
import 'package:salha_mobile_femme/production/bruillant.dart';
import 'package:salha_mobile_femme/production/formProd.dart';

import 'ajouter_Prod.dart';
class LProduit extends StatefulWidget {
  @override
  _LProduitState createState() => _LProduitState();
}

class _LProduitState extends State<LProduit> {
  String selectProduit;
  List data = List();
  Future myFuture;
  String nomP='poulet' ;
  List l = List();
  String nom;
  Future<List<produit>> getData() async {
    var url = 'http://10.0.2.2:3000/produit/';
    var response = await http.get(url);
    var items = json.decode(response.body);

    setState(() {
      data = items;
    });
   // print(json.decode(responsebody));
    print(items.length);
    List<produit> lists= items.map<produit>((json){
      return produit.formJson(json);
    }).toList();
return lists;

  }

  @override
  void initState() {
    super.initState();
   getData();
  }

  @override
  Widget build(BuildContext context) {
    data.map((item) {print(item['nom_P']);}).toList();
    print(data.length);
      var item;      return Scaffold(
        appBar: AppBar(
          backgroundColor: bacgroundV,
          title: Text('liste produit'),
        ),
        body:   Column(
            children: <Widget>[
              Expanded(
        child: ListView.builder(
    padding: const EdgeInsets.all(8),
    itemCount: data.length,
    itemBuilder: (BuildContext context, int index) {

      print(data[index]);
      print("${data[index]['image_P']}");
    return
            Container(
              height: 300,

              //    color: Colors.white,
              child:
              Row(
                  children: [
                    SizedBox(width: 10,),
                    InkWell(
                      onTap: () {

                      },
                      child: Container(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30.30),

                              child:
                          Image.network("http://10.0.2.2:3000/uploads/${data[index]['image_P']}",
                            fit: BoxFit.cover,
                            width: 250,
                            height: 200,),


                        ),
                      ),
                    ),
     Flexible(
     child:

                    Column(
                     // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 100, width: 100,),
                          ElevatedButton(

                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  bCon),
                            ),
                            onPressed: () {
                              nom=data[index]['nom_P'];
                              print(nom);
                              var image=data[index]['image_P'];
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>FormProduit(nom:nom,image_P:image,id_produit: data[index]['id_produit'],) ),
                              );

                            },
                            child: Text('choisir'),
                          ),
                          SizedBox(height: 20,),
                          Expanded(
                           child:

                          Text('${data[index]['nom_P']}',
                            style: TextStyle(fontSize: 18, color: Colors.black,

                            ),

                          ),
                          ),






                         // padding: EdgeInsets.only( right:10),
                        ],)

     )

            ,]),
      );
  }),
              ),])
        )
    //,)
      ;}

}
class produit {
  int id_P;
  int nb_min;
  String nom_P;
  String image_P;
  int id_unite;

  produit(this.id_P, this.nb_min, this.nom_P, this.image_P, this.id_unite);

  produit.formJson(Map<String, dynamic> json){
    id_P = json['id_P'];
    nb_min = json['nb_min'];
    nom_P = json['nom_P'];
    image_P = json['image_P'];
    id_unite = json['id_unite'];
  }
}
/*
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
);
  }
}
/*
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
*/
*/