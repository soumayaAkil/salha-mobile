import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:salha_mobile_femme/model/login_model.dart';




class APIService {
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async{

String url ='http://10.0.2.2:3000/femmes/login';


final response = await http.post(url, body: json.encode(requestModel)  ,headers: {
        'Content-Type': 'application/json',
      },);
// requestModel.toJson());

if(response.statusCode==200 || response.statusCode==400|| response.statusCode==500){
    
  return 
  LoginResponseModel.formJson(json.decode(response.body));
}

else {

  throw Exception('Failed to load ');
}
}
}