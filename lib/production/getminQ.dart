import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../constants.dart';
import 'file:///C:/Users/Akil/flutter/salha_mobile_femme/lib/production/api_min_s.dart';
import 'file:///C:/Users/Akil/flutter/salha_mobile_femme/lib/production/min_model.dart';
import 'package:salha_mobile_femme/production/bruillant.dart';


class getminQ extends StatefulWidget {
  final   String nom_P;

  const getminQ({Key key, @required this.nom_P}) : super(key: key);
  @override
  _getminQState createState() => _getminQState();
}

class _getminQState extends State<getminQ> {
  // ignore: non_constant_identifier_names
  MinRequestModel MinrequestModel;

  int selectQte;
  List data =List();

  int a;
  List<int> listArray = [];

    /*
    print("jjjj");
    MinrequestModel = new MinRequestModel();
    print("ccc");
    getData();
*/

 Future<dynamic>getData() async{
    MinrequestModel = new MinRequestModel();
  MinrequestModel.nom_P=widget.nom_P;
    APIService apiService = new APIService();
  apiService.FminQ(MinrequestModel).then((value){
  setState(() {
    for(var i =0; i < 50; i++) {
           a=value.nb_min+i;
      listArray.add(a);

    }
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
      DropdownButton(
             dropdownColor: Colors.grey[300],
      value: selectQte,
      hint: Text('choisir quantite', style: TextStyle(fontSize: 30, color:bacgroundV,  fontWeight: FontWeight.bold, backgroundColor: Colors.white),),
      items: listArray.map((int item) {
        return DropdownMenuItem(
          child:
          Text(item.toString(), style: TextStyle(fontSize: 30, color: Colors.black, ), ),
          value: item,
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          selectQte = value;
          savePrefP(selectQte);

        });
      },
    );

  }
}

savePrefP(int quantite) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setInt("quantite", quantite);

}