import 'package:flutter/material.dart';
import 'package:salha_mobile_femme/constants.dart';
import 'package:salha_mobile_femme/widget/auth_form.dart';
import 'package:salha_mobile_femme/widget/con_button.dart';




 
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bacgroundV,
      body: SingleChildScrollView(
         child:Column(
            children: <Widget>[
              
                   ClipRRect(
                    borderRadius: BorderRadius.only(
                    bottomLeft: const Radius.circular(150.0),
                    bottomRight: const Radius.circular(150.0),
                    ),
                    child: Image.asset('images/salha.jpg',
                         ),
                  ),
                  SizedBox(height:60),
                  AuthForm(),
                  //SizedBox(height:20),
                   //ConnexionButton()
                

            ],
               
          ),
   ),);  }
}