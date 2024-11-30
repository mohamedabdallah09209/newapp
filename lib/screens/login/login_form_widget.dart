import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newapp/controllers/login_controller.dart';
import 'package:newapp/widgets/common/main_button.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    final _formKey = GlobalKey<FormState>();
    return Container(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              validator: (value){
                if(value!.isEmpty){
                  return "fill_the_field".tr;
                }
              },
              controller: controller.email,
              decoration:  InputDecoration(
                label: Text("email".tr),
                prefixIcon: Icon(Icons.email),
              ),
            ),
            TextFormField(
              validator: (value){
                if(value!.isEmpty){
                  return "fill_the_field".tr;
                }
              },
              obscureText: true,
              controller: controller.password,
              decoration:  InputDecoration(
                label: Text("password".tr),
                prefixIcon: Icon(Icons.password),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            MainButton(
              color: const Color.fromARGB(255, 48, 173, 165),
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  LoginController.instance.loginUser(
                      controller.email.text.trim(),
                      controller.password.text.trim());
                }
              },
              child: Center(
                child: Text(
                  "login".tr,
                  style: TextStyle(
                      color: Get.isDarkMode
                          ? Colors.white
                          : Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
