
import 'package:flutter/material.dart';
import 'package:salha_mobile_femme/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {

  var email;
  var userNom;
  bool isSignIn = false;
  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    email = preferences.getString("email");
    userNom = preferences.getString("userNom");
    if (userNom != null) {
      setState(() {
        email = preferences.getString("email");
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
    return
Drawer(

child:ListView(
children: <Widget>[
UserAccountsDrawerHeader(
accountName:isSignIn ? Text(userNom):Text("kkk"),
currentAccountPicture: CircleAvatar(child: Icon(Icons.person)),
decoration: BoxDecoration(
color: bCon,
),
),
ListTile(
title: Text("home"),
leading: Icon(Icons.home),
onTap: (){
Navigator.of(context).pushNamed('contact');
},
),
isSignIn ?
ListTile(
title: Text("Déconnexion"),
leading: Icon(Icons.logout),
onTap: () async {
SharedPreferences preferences = await SharedPreferences.getInstance();
preferences.remove("username");
preferences.remove("email");
Navigator.of(context).pushNamed('LG');
},
): null

],


),
);
  }
}
