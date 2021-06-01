import 'dart:convert';
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../constants.dart';
import 'file:///C:/Users/Akil/flutter/salha_mobile_femme/lib/production/api_min_s.dart';
import 'file:///C:/Users/Akil/flutter/salha_mobile_femme/lib/production/min_model.dart';


class getPrixP extends StatefulWidget {
  final   String nom_P;

  const getPrixP({Key key, @required this.nom_P}) : super(key: key);
  @override
  _getminQState createState() => _getminQState();
}

class _getminQState extends State<getPrixP> {
  // ignore: non_constant_identifier_names
  MinRequestModel MinrequestModel;
  double a;


  Future<dynamic>getData() async{
    MinrequestModel = new MinRequestModel();
    MinrequestModel.nom_P=widget.nom_P;
    APIService apiService = new APIService();
    apiService.FminQ(MinrequestModel).then((value){

     print(value.prix_P);

     a=value.prix_P ;
      setState(() {
        a=value.prix_P;


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
    return
      Text(a.toString(),style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),)
     ;

  }
}