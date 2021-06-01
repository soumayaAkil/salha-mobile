import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:salha_mobile_femme/production/api_unite_s.dart';
import 'package:salha_mobile_femme/production/unite_model.dart';
class LUniteI extends StatefulWidget {
  final  String nom_P;

  const LUniteI({Key key,@required this.nom_P}) : super(key: key);
  @override
  _LUniteState createState() => _LUniteState();
}

class _LUniteState extends State<LUniteI> {
  String selectUnite;
  UniteRequestModel UniterequestModel;
  List data = List();

  String a,b;
  Future myFuture;

  Future<dynamic> getData() async {
    UniterequestModel = new UniteRequestModel();
    UniterequestModel.nom_P = widget.nom_P;
    APIService apiService = new APIService();
    apiService.PUnite(UniterequestModel).then((value) {
      b=value.image_U;

      setState(() {

        b=value.image_U;
           });
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    print("image  +${b}");
    return
      Container(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30.30),

          child:

          Image.network("http://10.0.2.2:3000/uploads/${b}",
            // Image.asset("images/7.jpg",
            //Image.network("http://10.0.2.2:3000/uploads/${data[index]['image_P']}",
            fit: BoxFit.cover,
            width: 130,
            height: 130,),


        ),
      );}
}
/*
class unite {
  int id_unite;
  String nom_U;
  String image_U;
  unite(this.id_unite,this.nom_U,this.image_U);
  unite.formJson(Map<String,dynamic> json){
    id_unite = json['id_unite'];
    nom_U = json['nom_U'];
    image_U = json['image_U'];




  }

}
*/
