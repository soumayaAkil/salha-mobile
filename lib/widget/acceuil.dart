import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:salha_mobile_femme/constants.dart';
import 'package:salha_mobile_femme/pages/myDrawer.dart';
import 'package:salha_mobile_femme/screens/login_screen.dart';
import 'package:salha_mobile_femme/widget/acceuilBody.dart';
import 'package:salha_mobile_femme/widget/contact.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class Acceuil extends StatefulWidget {
  Acceuil({Key key}) : super(key: key);

  @override
  _AcceuilState createState() => _AcceuilState();
}

class _AcceuilState extends State<Acceuil> {
  var image_F;
  var userNom;
  bool isSignIn = false;
  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    image_F = preferences.getString("image_F");
    userNom = preferences.getString("userNom");
    if (image_F != null) {
      setState(() {
        image_F = preferences.getString("image_F");
        userNom = preferences.getString("userNom");
        isSignIn = true;
      });
    }
  }

  @override
  void initState() {
    getPref();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        child: Scaffold(

          appBar: AppBar(
          backgroundColor: bacgroundV,
          ),
         drawer:   Drawer(

           child:ListView(
             children: <Widget>[
               UserAccountsDrawerHeader(
                 accountName:isSignIn ? Text(userNom):Text("pas de connexion"),
                 currentAccountPicture:isSignIn ? ClipRRect(
                   borderRadius: BorderRadius.circular(20.0),
                   child: CircleAvatar(backgroundImage:NetworkImage("http://10.0.2.2:3000/uploads/${image_F} "), backgroundColor: Colors.transparent, ),):
                   //Image.network("http://10.0.2.2:3000/Salha-Backend/images/${image_F}" ,fit: BoxFit.cover,width: 100,height: 100, ), ):
                 CircleAvatar(child:Image.asset("images/ic.jpg" ,fit: BoxFit.cover ), backgroundColor: Colors.transparent, ),
          //,fit:BoxFit.cover
                 decoration: BoxDecoration(
                   color: bCon,
                 ),
               ),
               ListTile(
                 title: Text("home"),
                 leading: Icon(Icons.home),
                 onTap: (){
                   Navigator.push(
                     context,
                     MaterialPageRoute(builder: (context) => Contact()),
                   );
                 },
               ),
               isSignIn ?
               ListTile(
                 title: Text("Déconnexion"),
                 leading: Icon(Icons.logout),
                 onTap: () async {
                   SharedPreferences preferences = await SharedPreferences.getInstance();
                   preferences.remove("userNom");
                   preferences.remove("image_F");
                   Navigator.push(
                     context,
                     MaterialPageRoute(builder: (context) => LoginScreen()),
                   );

                 },
               ): null

             ],


           ),
         ),

         body:ABody()

         ),
      ),
    );
  }
}