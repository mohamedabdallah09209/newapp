import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newapp/configs/themes/app_colors.dart';

class MainButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  // ignore: prefer_typing_uninitialized_variables
  final enabled;
  final Widget? child;
  final Color? color;

  const MainButton({super.key,  this.title='',
   required this.onTap,  this.enabled=true, 
   this.color, this.child});

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child:SizedBox(
        height: 55,
        child: InkWell(
          onTap: enabled==false?null:onTap,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: color??Theme.of(context).cardColor
            ),
            width: double.maxFinite,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: child??Center(
                child: Text(title,style:  TextStyle(
                fontWeight: FontWeight.bold,
                color: Get.isDarkMode?onSurfaceTextColor:Theme.of(context).primaryColor,
              ), ),
              ),
            ),
          )
        ),
      )
    );
  }
}
