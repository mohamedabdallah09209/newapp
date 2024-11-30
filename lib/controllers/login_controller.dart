import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newapp/reposotory/auth_reposotory/authentication_reposotory.dart';

class LoginController extends GetxController {

static  LoginController get instance => Get.find();

final email =TextEditingController();
final password =TextEditingController();

void loginUser(String email,String password){
AuthenticationReposotory.instance.signInWithEmailAndPassword(email, password);
}

}