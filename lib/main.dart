import 'package:flutter/material.dart';
import 'package:salha_mobile_femme/constants.dart';
import 'package:salha_mobile_femme/production/ajoutPROD.dart';
import 'package:salha_mobile_femme/production/bruillant.dart';
import 'package:salha_mobile_femme/screens/login_screen.dart';
import 'package:salha_mobile_femme/screens/screen.dart';
import 'package:salha_mobile_femme/widget/acceuil.dart';
import 'package:salha_mobile_femme/widget/contact.dart';
import 'package:shared_preferences/shared_preferences.dart';




class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        //debugShowCheckedModeBanner: false,

      theme:ThemeData(
       inputDecorationTheme:InputDecorationTheme(
         filled: true,
         fillColor: bacgroundV,
         enabledBorder: OutlineInputBorder(borderSide: BorderSide(
         color: Colors.grey[200]
       ),
       borderRadius: BorderRadius.circular(25),),
       disabledBorder: OutlineInputBorder(borderSide: BorderSide(
         color: Colors.grey[200]
       ),
       borderRadius: BorderRadius.circular(25),),
       
       focusedBorder: OutlineInputBorder(borderSide: BorderSide(
         color: Colors.grey[200]
       ),
       borderRadius: BorderRadius.circular(25),),


       ),
      ),
      
      //home:FromProdScreen(),
      //AjoutProd(),
      //Screen(),
    
    
    routes:
    {
      'LG':(context)=>LoginScreen(),
      'acceuil':(context)=>Acceuil(),
      //'login':(context)=>AuthForm(),
      'contacter':(context)=>Contact(),

    }
    
    );
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var email = prefs.getString('userNom');
  print(email);
  runApp(MaterialApp(
      debugShowCheckedModeBanner:false,
      home: email == null ? Screen() : Acceuil()));
}