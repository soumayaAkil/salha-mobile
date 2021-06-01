import 'package:flutter/material.dart';
import 'package:salha_mobile_femme/constants.dart';
import 'package:url_launcher/url_launcher.dart';


Future<void>makeCall(String url)async{
  if(await canLaunch(url)){
    await launch(url);
  }else{
    throw"nous ne pouvons pas lancer l'appel au $url";

  }
}

class Contact extends StatelessWidget {
  const Contact({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return       Scaffold(
      appBar: AppBar(
        backgroundColor: bacgroundV,
      ),
      /*Container(
      color: Colors.white,
      */
      //drawer: MyDrawerr(),
      body:

      GridView.count(

          primary: false,

          padding: const EdgeInsets.only(top: 250,right: 60,left: 60),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: <Widget>[
/*
    Container(
      padding: const EdgeInsets.all(8),
      child:
      */ Column(
              children: [
                Container(
                    padding: const EdgeInsets.all(8),

                    color: Colors.grey[200],
                    child: Material(
                      child:Column(
                        children: [
                          InkWell(
                            onTap: () {makeCall('tel:71200679');},
                            child: Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30.30),
                                child: Image.asset('images/contacter.png', width: 200,),
                              ),

                            ),
                          ),
                          //color: Colors.grey[200],

                          Center(child: Text("RH",style: TextStyle(fontSize: 18,color: Colors.black,decoration: TextDecoration.none,) ,)),

                        ],
                      ),
                    )
                ),
              ],)
            ,
            Column(
              children: [
                Container(
                    padding: const EdgeInsets.all(8),

                    color: Colors.grey[200],
                    child: Material(
                      child:Column(
                        children: [
                          InkWell(
                            onTap: () {makeCall('tel:71279679');},
                            child: Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30.30),
                                child: Image.asset('images/finance.png',width: 200,),
                              ),

                            ),
                          ),
                          //color: Colors.grey[200],

                          Center(child: Text("Finance",style: TextStyle(fontSize: 18,color: Colors.black,decoration: TextDecoration.none,) ,)),

                        ],
                      ),
                    )
                ),
              ],)


            ,]
      ),
    );



    /*



    Material(
       child:Row(
                children: [

                 Container(
         child: InkWell(
            onTap: () {Navigator.of(context).pushNamed('contacter');},
            child: Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.30),
                child: Image.asset('images/contacter.png',width: 200,),
              Text("Contacter",style: TextStyle(fontSize: 18,color: Colors.black,decoration: TextDecoration.none,) ,),
              ),

              ),
               Text("Contacter",style: TextStyle(fontSize: 18,color: Colors.black,decoration: TextDecoration.none,) ,),
          ),



                 ),



                InkWell(
          onTap: () {Navigator.of(context).pushNamed('contacter');},
          child: Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30.30),
              child: Image.asset('images/contacter.png',width: 200,),
            ),

            ),
        ),

                ]

       ),
 */

  }
}