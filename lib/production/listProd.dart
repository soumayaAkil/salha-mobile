import 'package:flutter/material.dart';
import 'package:salha_mobile_femme/constants.dart';


class listprod extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String nomP='poulet' ;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: bacgroundV,
          title: Text('liste produit'),
        ),
        body: ListView(

          children: <Widget>[
            Container(
              height: 300,
          //    color: Colors.white,
          child: Row(

                children: [
                  SizedBox(width: 10,),
                InkWell(
                  onTap: () {},
                  child: Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.30),
                    child: Image.asset('images/poulet.png', fit:BoxFit.cover, width: 200,height: 200,),
                  ),
                ),
                ),
                Column(
                  children:[
                    SizedBox(height: 100,width: 200,),
                    Text('', style: TextStyle(fontSize: 18, color: Colors.black ,

                    ),),
                    SizedBox(height: 20,),
                ElevatedButton(

                  style: ButtonStyle(
                    backgroundColor:MaterialStateProperty.all<Color>(bCon),
                  ),
                  onPressed: () { },
                  child: Text('choisir'),
                ),
                ]),
            ]),
            ), Container(

              height: 300,
                        child: Row(
                  children: [
                    SizedBox(width: 10,),

                    InkWell(
                      onTap: () {},
                      child: Container(

                          child:    ClipRRect(
                          borderRadius: BorderRadius.circular(30.30),
                          child: Image.asset('images/ouefs.png', fit:BoxFit.cover, width: 200,height: 200,),
                        ),
                      ),
                    ),
                    Column(
                        children:[
                          SizedBox(height: 100,width: 200,),
                          Text('poulet', style: TextStyle(fontSize: 18, color: Colors.black),),
                          SizedBox(height: 20,),
                          ElevatedButton(

                            style: ButtonStyle(
                              backgroundColor:MaterialStateProperty.all<Color>(bCon),
                            ),
                            onPressed: () { },
                            child: Text('choisir'),
                          ),
                        ]),
                  ]),
            ),
            Container(
              height: 300,
              //    color: Colors.white,
              child: Row(
                  children: [
                    SizedBox(width: 10,),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30.30),
                          child: Image.asset('images/salha.jpg', fit:BoxFit.cover, width: 200,height: 200,),
                        ),
                      ),
                    ),
                    Column(
                        children:[
                          SizedBox(height: 100,width: 200,),
                          Text('Item 1', style: TextStyle(fontSize: 18, color: Colors.black),),
                          SizedBox(height: 20,),
                          ElevatedButton(

                            style: ButtonStyle(
                              backgroundColor:MaterialStateProperty.all<Color>(bCon),
                            ),
                            onPressed: () { },
                            child: Text('choisir'),
                          ),
                        ]),
                  ]),
            ),


          ],
        ),
      ),
    );
  }
}








