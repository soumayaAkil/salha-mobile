import 'package:flutter/material.dart';
import 'package:salha_mobile_femme/constants.dart';

class ConnexionButton extends StatelessWidget {
  final VoidCallback onPressed;

          
  const ConnexionButton({ Key key, this.onPressed}) : super(key: key);
  
    @override
  Widget build(BuildContext context) {
    return 
    
    Padding(
      padding: const EdgeInsets.symmetric(horizontal:70),
      child: SizedBox(
        height:40,
        width: double.infinity,
        child: RaisedButton(
          color:bCon,
         onPressed:
           onPressed,
           // Navigator.of(context).pushNamed('acceuil');
          
          shape: RoundedRectangleBorder(
            borderRadius:BorderRadius.circular(25),
          ),
          child: Text(
            "Connexion",
          style:TextStyle(
            color: Colors.white,fontSize: 25

          ),
          ),
          ),
        ),
    );
   
  }
}