import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newapp/reposotory/auth_reposotory/authentication_reposotory.dart';
import 'package:newapp/reposotory/user_reposetory.dart';
import 'package:newapp/models/user_model.dart';
class SignupController extends GetxController {

static  SignupController get instance => Get.find();

final email =TextEditingController();
final username =TextEditingController();
final password =TextEditingController();
final phone =TextEditingController();
 final userRep =Get.put(UserReposetory());




void registerUserData(UserModel user) async{
  await userRep.createUser(user);
  registerUser(user.email,user.password);
}

void registerUser(String email,String password){
AuthenticationReposotory.instance.createUserWithEmailAndPassword(email, password);
}

}