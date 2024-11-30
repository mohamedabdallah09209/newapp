import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {

final String? id;
final String fullname;
final String email;
final String phone;
final String password;

const UserModel({
this.id,
required this.email,
required this.password,
 required this.fullname,
required this.phone,});
 
 toJson(){
  return{
    "fullname":fullname,
    "email":email,
    "password":password,
    "phone":phone
  };
 }

factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
final data= document.data()!;
return UserModel(
id: document.id,
email: data["email"],
password: data["password"],
fullname: data["fullname"],
phone: data["phone"],);}
 }