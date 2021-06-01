
class LoginResponseModel{
final String token;
final int userId;
final String userNom;
final String image_F;
LoginResponseModel({
  this.token,
  this.userId,
  this.userNom,
  this.image_F,
});
factory LoginResponseModel.formJson(Map<String, dynamic> json){


  return LoginResponseModel(token: json["token"] != null ? json["token"]: "",userId: json["userId"]!=null ? json["userId"] : 0,
      userNom: json["userNom"] != null ? json["userNom"]: "",image_F: json["userImage"] != null ? json["userImage"]: "");
   


}
}

class LoginRequestModel{

  String cle;

  LoginRequestModel({
    this.cle,
  
  });

Map<String,dynamic> toJson(){
  Map<String,dynamic> map = {'cle':cle.trim(), 
  };
return map;
}
}