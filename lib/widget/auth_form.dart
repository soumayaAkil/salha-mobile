import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:salha_mobile_femme/model/login_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salha_mobile_femme/api/api_service.dart';
import 'package:salha_mobile_femme/screens/login_screen.dart';
import 'package:salha_mobile_femme/widget/acceuil.dart';
import 'package:salha_mobile_femme/widget/con_button.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AuthForm extends StatefulWidget {
  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {


  GlobalKey<FormState> _globalFormKey = new GlobalKey<FormState>();
  bool hidePassword = true;
  LoginRequestModel requestModel;
  bool isApiCallProcess = false;
  @override
  void initState() {
    super.initState();
    requestModel = new LoginRequestModel();
  }

/*
signIn(String email,String pass)async{
Uri url="http://localhost:" as Uri;
SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
Map body={"email":email,"password":pass};
var jsonResponse;
var res =await http.post(url, body:body);
//need to check the api status 
if(res.statusCode==200)
{
  jsonResponse= json.decode (res.body);
  print("Response status:${res.statusCode}");
   print("Response status:${res.body}");
   if(jsonResponse!=null){
     setState(() {
       _isLoading=false;
     });
     sharedPreferences.setString("token",jsonResponse['token']);
     Navigator.of(this.context).pushAndRemoveUntil(
       MaterialPageRoute(builder:(BuildContext context)=>Acceuil()),
       (Route<dynamic> route) => false)
       }
}else{
  setState((){
    _isLoading=false;
  });
  print("Response status: ${res.body}");}}
*/

  @override
  Widget build(BuildContext context) {

    return  Column(
      children: [
        Form(
            key: _globalFormKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 40),
                  TextFormField(

                    onSaved: (input) => {requestModel.cle = input},
                    //onChanged: (value)=>_password=value,
                    //coursier validator: (value)=>value.length <6 ? 'your must be larger6:'null
                    validator: (value){

                        if(value.isEmpty)
                          return 'Remplir cle ';


                          if(value.length!=9 )
                         return 'invalide taille cle';  
                         
                       if(value.indexOf('-')!=2 )
                         return 'cle forme ..-......';




                      String ch1=value.substring(0,2); 
                      String ch2=value.substring(3,9);
                      print(ch2);


                      if (int.tryParse(ch2)==null)
                      return 'cle sauf des chiffres';
                    return null;
                    },                
                    decoration: InputDecoration(
                        //labelText: 'mot de passe' ,
                        //  labelStyle: TextStyle(color:(Colors.white)),
                        prefixIcon: Icon(
                          Icons.lock_open,
                          color: Colors.white,
                        ),
                        suffixIcon: IconButton(
                    color:Colors.white,
                    onPressed: (){
                    setState((){
                      hidePassword=!hidePassword;
                    });
                  },
                  icon: Icon(hidePassword? Icons.visibility_off:Icons.visibility),
                  ),
                        hintText: '**********',
                        hintStyle: TextStyle(
                          color: Colors.white,
                        )),
                    style: TextStyle(color: Colors.white),
                    obscureText: hidePassword,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            )),
        SizedBox(height: 20),
        ConnexionButton(onPressed: () {
          if (validateAndSave()) {

            setState(() {
              isApiCallProcess = true;
           
            });
            APIService apiService = new APIService();
            apiService.login(requestModel).then((value){

              setState(() {
                isApiCallProcess = false;
              });
              if (value.token.isNotEmpty){

                savePref(value.image_F,value.userNom,value.userId);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Acceuil()),
                );
                  
              }else{
                
                Fluttertoast.showToast(  
        msg: 'Invalide mot de passe',
        toastLength: Toast.LENGTH_LONG,  
        gravity: ToastGravity.BOTTOM,  
       // timeInSecForIos: 1,  
        backgroundColor: Colors.red,  
        textColor: Colors.white 
    );  
              
              }
            }
            );

          }
 
        }
        ),
      ],

      );
 }


  bool validateAndSave() {
    final form = _globalFormKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

    savePref(String image_F,String userNom,int userId) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("image_F", image_F);
    preferences.setString("userNom", userNom);
    preferences.setInt("userId", userId);

    print(preferences.getString("image_F"));
    print(preferences.getString("userNom"));
    print(preferences.getInt("userId"));
  }

}
