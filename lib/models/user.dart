import 'dart:convert';

class User {
  int id;
  String name, image, email;
  User({this.id, this.name, this.image, this.email});
  User.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.email = json['email'];
    this.name = "${json['first_name']} ${json['last_name']}";
    this.image = json['avatar'];
  }
}
DataModel dataModelFromJson(String str) => DataModel.fromJson(json.decode(str));

class DataModel{

 DataModel({
   this.name,
   this.job,
   this.id,this.createdAt,
});
 String name;
 String job;
 String id;
 String createdAt;

 factory DataModel.fromJson(Map<String, dynamic> json)=> DataModel(
   name:json["name"],
   job:json["job"],
   id:json["id"],
   createdAt: json["createdAt"],
 );

 Map<String,dynamic> toJson()=>{
   "name":name,
   "job":job,
   "id":id,
   "createdAt":createdAt,
 };

}
