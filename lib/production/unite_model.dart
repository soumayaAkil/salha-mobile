
import 'package:salha_mobile_femme/production/getunite.dart';

class UniteResponseModel{
  int id_unite;
  String nom_U;
  String image_U;



  UniteResponseModel({
    this.id_unite,this.nom_U,this.image_U
  });
  factory UniteResponseModel.formJson(Map<String, dynamic> json){

// {"produit":{"id_produit":1,"nb_min":4,"image_P":"","nom_P":"oeuf","id_unite":1}}
    return UniteResponseModel(
      id_unite: json["id_unite"] != null ? json["id_unite"]: 0,
      nom_U: json["nom_U"]!=null ? json["nom_U"] : "",
      image_U: json["image_U"] != null ? json["image_U"]: "",
    );




  }
}

class UniteRequestModel{

  String nom_P;

  UniteRequestModel({
    this.nom_P,

  });

  Map<String,dynamic> toJson(){
    Map<String,dynamic> map = {'nom_P':nom_P.trim(),
    };
    return map;
  }
}