import 'package:flutter/material.dart';
import 'package:salha_mobile_femme/widget/con_button.dart';

import '../constants.dart';
import 'getminQ.dart';
import 'getunite.dart';


class FormProd extends StatefulWidget {
  final String nom;
  FormProd({Key key,  this.nom}) : super(key: key) ;

  @override
  _FormProdState createState() => _FormProdState();
}

class _FormProdState extends State<FormProd> {
  @override
  Widget build(BuildContext context) {
    var nom_P=widget.nom;
    print(widget.nom);
    var _formkey;
    var nameController;
    return  Scaffold(

        body:
        Center(
        child: SingleChildScrollView(

        child: Form(
        key: _formkey,
        child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top:40),
            width: 280,
            child: Center(child:
            Text(nom_P, style: TextStyle(fontSize: 30, color: Colors.black,),),
        ),
            decoration: BoxDecoration( borderRadius: BorderRadius.all(Radius.circular(15)),color: Colors.grey,),
            padding: EdgeInsets.only(left: 20),
          ),
          Container(
            margin: EdgeInsets.only(top:40),
            width: 280,
            height: 50,

            child:  Center(child:LUnite(),),
            decoration: BoxDecoration( borderRadius: BorderRadius.all(Radius.circular(15)),color: Colors.grey,),
            padding: EdgeInsets.only(left: 20),
          ),



          Container(
            margin: EdgeInsets.only(top:40),
            width: 280,
            decoration: BoxDecoration( borderRadius: BorderRadius.all(Radius.circular(15)),color: Colors.grey,),
            padding: EdgeInsets.only(left: 20),
            child:TextFormField(controller: nameController,autocorrect: true,
              decoration: InputDecoration(border: InputBorder.none,hintText: " Name",prefixIcon: Icon(Icons.person)),
              validator: (String value){
                if(value.isEmpty)
                {
                  return 'Please Enter Name';
                }
                return null;
              },),),
        //SizedBox(height: 50),
        Container(
          margin: EdgeInsets.only(top:40),
          width: 180,
          decoration: BoxDecoration( borderRadius: BorderRadius.all(Radius.circular(15)),color: Colors.grey,),

            child:getminQ(),

        ),
          SizedBox(height: 50),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal:70),
              child: SizedBox(
                height:40,
                width: double.infinity,
                child: RaisedButton(
                  color:bCon,
                 onPressed:() {},

                  // Navigator.of(context).pushNamed('acceuil');

                  shape: RoundedRectangleBorder(
                    borderRadius:BorderRadius.circular(25),
                  ),
                  child: Text(
                    "ajouter production",
                    style:TextStyle(
                        color: Colors.white,fontSize: 25

                    ),
                  ),
                ),
              ),
            ),




  ]),),),)

    );
  }
}