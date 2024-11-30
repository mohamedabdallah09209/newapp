
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newapp/screens/signup/signup_form_widget.dart';
import '../../configs/themes/app_colors.dart';
import '../../widgets/common/main_button.dart';


class SignupScreen extends GetView {
  const SignupScreen({super.key});

    static const String routeName = "/signup";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        alignment: Alignment.center,
        decoration: BoxDecoration(gradient: mainGradient()),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/app_splash_logo1.png",
                width: 200,
                height: 200,
              ),
              
              SignupFormWidget(),
          
              MainButton(
                onTap: () {
                  Get.toNamed("/login");
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
