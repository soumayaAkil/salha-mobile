import 'dart:convert';

import 'package:http/http.dart'as http;
import 'file:///C:/Users/Akil/flutter/salha_mobile_femme/lib/production/min_model.dart';





class APIService {
  Future<MinResponseModel> FminQ(MinRequestModel requestModel) async{

    String url ='http://10.0.2.2:3000/produit/min';


    final response = await http.post(url, body: json.encode(requestModel)  ,headers: {
      'Content-Type': 'application/json',
    },);
// requestModel.toJson());
   print(" retoure apimin" );
   print(response.body);
    if(response.statusCode==200 || response.statusCode==400|| response.statusCode==500){

      return
        MinResponseModel.formJson(json.decode(response.body));
    }

    else {

      throw Exception('Failed to load ');
    }
  }
}