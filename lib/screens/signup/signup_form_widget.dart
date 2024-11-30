import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newapp/controllers/signup_controller.dart';
import 'package:newapp/models/user_model.dart';
import 'package:newapp/widgets/common/main_button.dart';

class SignupFormWidget extends StatelessWidget {
  const SignupFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    final _formKey = GlobalKey<FormState>();
    return Container(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return "fill_the_field".tr;
                }
              },
              controller: controller.email,
              decoration: InputDecoration(
                label: Text("email".tr),
                prefixIcon: Icon(Icons.email),
              ),
            ),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return "fill_the_field".tr;
                }
              },
              controller: controller.username,
              decoration: InputDecoration(
                label: Text("username".tr),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return "fill_the_field".tr;
                }
              },
              obscureText: true,
              controller: controller.password,
              decoration: InputDecoration(
                label: Text("password".tr),
                prefixIcon: Icon(Icons.password),
              ),
            ),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return "fill_the_field".tr;
                }
              },
              controller: controller.phone,
              decoration: InputDecoration(
                label: Text("signup".tr),
                prefixIcon: Icon(Icons.phone),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            MainButton(
              color: const Color.fromARGB(255, 48, 173, 165),
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  final user = UserModel(
                      email: controller.email.text.trim(),
                      password: controller.password.text.trim(),
                      phone: controller.phone.text.trim(),
                      fullname: controller.username.text.trim());
                  SignupController.instance.registerUserData(
                     user);
                }
              },
              child: Center(
                child: Text(
                  "signup".tr,
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
