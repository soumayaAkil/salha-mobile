
import 'dart:ffi';

class MinResponseModel{

  int id_produit;
  int nb_min;
  String nom_P;
  String image_P;
  double prix_P;
  int id_unite;


  MinResponseModel({
this.id_produit,this.nb_min,this.nom_P,this.image_P,this.prix_P,this.id_unite
  });
  factory MinResponseModel.formJson(Map<String, dynamic> json){

// {"produit":{"id_produit":1,"nb_min":4,"image_P":"","nom_P":"oeuf","id_unite":1}}
    return MinResponseModel(
      id_produit: json["id_produit"]!=null ? json["id_produit"] : 0,
      nb_min: json["nb_min"] != null ? json["nb_min"]: 0,
      nom_P: json["nom_P"]!=null ? json["nom_P"] : "",
      image_P: json["image_P"] != null ? json["image_P"]: "",
      prix_P: json["prix_P"] != null ? json["prix_P"]:0,
      id_unite: json["id_unite"] != null ? json["id_unite"]: 0,
    );




  }
}

class MinRequestModel{

  String nom_P;

  MinRequestModel({
    this.nom_P,

  });

  Map<String,dynamic> toJson(){
    Map<String,dynamic> map = {'nom_P':nom_P.trim(),
    };
    return map;
  }
}