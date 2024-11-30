import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newapp/screens/login/login_form_widget.dart';
import '../../configs/themes/app_colors.dart';
import '../../widgets/common/main_button.dart';

class LoginScreen extends GetView {
  const LoginScreen({super.key});

  static const String routeName = "/login";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        alignment: Alignment.center,
        decoration: BoxDecoration(gradient: mainGradient()),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/app_splash_logo1.png",
              width: 200,
              height: 200,
            ),
            
            LoginFormWidget(),

            MainButton(
              onTap: () {
                Get.toNamed("/signup");
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
            )
          ],
        ),
      ),
    );
  }
}
