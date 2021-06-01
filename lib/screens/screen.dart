import 'package:flutter/material.dart';
import 'package:salha_mobile_femme/screens/login_screen.dart';
class Screen extends StatelessWidget {
  static String id = 'Screen';

  @override
  Widget build(BuildContext context) {


    return Material(
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
              },
            child: Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset('images/salhaScreen.png',
                   ),
              ),),
          ),
        
    );
     /*Scaffold(
        body: Container(
            decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage('images/lion.jpg'),
        fit: BoxFit.cover,
        alignment: Alignment.center,
      ),

    )),); */
  }
}
