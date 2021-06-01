import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:salha_mobile_femme/production/unite_model.dart';





class APIService {
  Future<UniteResponseModel> PUnite(UniteRequestModel requestModel) async{

    String url ='http://10.0.2.2:3000/unite/findU';


    final response = await http.post(url, body: json.encode(requestModel)  ,headers: {
      'Content-Type': 'application/json',
    },);
// requestModel.toJson());
    print(response.body);
    if(response.statusCode==200 || response.statusCode==400|| response.statusCode==500){

      return
        UniteResponseModel.formJson(json.decode(response.body));
    }

    else {

      throw Exception('Failed to load ');
    }
  }
}