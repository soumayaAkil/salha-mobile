import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:salha_mobile_femme/constants.dart';
import 'package:salha_mobile_femme/production/bruillant.dart';
import 'package:salha_mobile_femme/production/formProd.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';


import 'getImageU.dart';
import 'getPrixP.dart';
import 'getminQ.dart';
import 'getunite.dart';
class FormProduit extends StatefulWidget {
  final String nom;
final String image_P;
final int id_produit;

  const FormProduit({Key key,@required this.nom,@required this.image_P, @required this.id_produit}) : super(key: key);
  @override
  _LProduitState createState() => _LProduitState();
}

class _LProduitState extends State<FormProduit> {
  int quantite;
  bool isSelectIn = false;
  String selectProduit;
  List data = List();
  Future myFuture;
  List l = List();

  /*
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
*/
  @override
  Widget build(BuildContext context)  {
    data.map((item) {print(item['nom_P']);}).toList();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: bacgroundV,
          title: Text('ajouter produit'),
        ),
        body: SingleChildScrollView(
        child:Column(
            children: <Widget>[
              SizedBox(height: 5,),
                                      Container(
                          height: 200,

                              width:double.infinity,
                               child:
                                   //Center(child:ç_r0
                                InkWell(
                                  child: Container(
                                    padding: EdgeInsets.only(top:10),
                                    height: 170,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(30.30),

                                      child:

                                          //Image.asset("images/salha.jpg",
                                      Image.network("http://10.0.2.2:3000/uploads/${widget.image_P}",
                                        fit: BoxFit.cover,
                                        height: 170,
                                        ),
                                    ),
                                  ),
                                ),
   // ),

                        ),

/*
  Container(
                          height: 200,
                           child:
                          Row(
                              children: [
                                SizedBox(width: 10,),
                                InkWell(
                                  child: Container(

                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(30.30),
                                      child:

                                          //Image.asset("images/salha.jpg",
                                      Image.network("http://10.0.2.2:3000/uploads/${widget.image_P}",
                                        fit: BoxFit.cover,
                                        width: 180,
                                        height: 180,),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 50, width: 50,),
                                Flexible(

                                          child:
                                          Text(widget.nom,style: TextStyle(fontSize: 18, color: Colors.black,),),

                                       ),
                              ]),
                        ),
 */
              Container(
                height: 200,
                child:
                Row(
                    children: [
                      SizedBox(width: 100,),
                      InkWell(
                         child: LUniteI(nom_P: widget.nom,),
                      ),


                        Column(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 50, width: 100,),
                        Expanded(
                          child:   Center(child:
                          getPrixP(nom_P: widget.nom,),

                          ),),
                            Expanded(
                              child:   Center(child:LUnite(nom_P: widget.nom,),),
                       //       Text('4 ouef',
                         //       style: TextStyle(fontSize: 18, color: Colors.black,),),
                            ),
                          ],),
                      //),
                      ]),
              ),






              Container(
                height: 100,
              child:
                Center(
              child:
              getminQ( nom_P: widget.nom,),
              ),

              ),
SizedBox(height: 50,),
Container(
  padding: EdgeInsets.only(bottom:10),
    child: SizedBox(

      child: RaisedButton(
        color:bCon,

        onPressed:() async {
          //getprefQ() async{

            SharedPreferences preferences = await SharedPreferences.getInstance();
            quantite = preferences.getInt("quantite");

            if (quantite != 0) {
              setState(() {
                quantite = preferences.getInt("quantite");
                isSelectIn = true;
              });
            }
            DateTime today = new DateTime.now();
print(today);


            DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
            print("eee");
            var x= dateFormat.format(DateTime.now());
            print(dateFormat.format(DateTime.now()));
            print(dateFormat.parse(x));
          print(widget.id_produit);

          print(quantite);
            SharedPreferences preff = await SharedPreferences.getInstance();
            int  id_femme = preferences.getInt("userId");
            print(id_femme);
            saveProd(x,quantite,widget.id_produit,id_femme);
        },




    // Navigator.of(context).pushNamed('acceuil');

        shape: RoundedRectangleBorder(
          borderRadius:BorderRadius.circular(25),
        ),
       child:
        Text(
          "ajouter production",
          style:TextStyle(
              color: Colors.white,fontSize: 25

          ),
        ),
      

      ),
/*
   ElevatedButton(

        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
              bCon),
        ),
        onPressed: () {
          nom="gg";
          print(nom);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>FormProd(nom:nom) ),
          );

        },
        child: Text('choisir'),
      ), */

  ),
),








              ]),
    ),
    );
  }

  Future<dynamic> saveProd( String a, int b,int c,int id) async{
    setState(() {
      var visble=true;
    });

    var url='http://10.0.2.2:3000/production/post';
    var data=   {
      "date":a.toString(),
      "quantite_prod":b,
      "id_produit":c,
      "id":id
    } ;
    var response = await http.post(url,body: json.encode(data),headers: {
      'Content-Type': 'application/json',
    },);
    var message= jsonDecode(response.body);
    print(message);
    print('bnj');
  }


  }



