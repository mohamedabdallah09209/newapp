import 'package:flutter/material.dart';
import 'package:newapp/configs/themes/custom_text_style.dart';

class CountDownTimer extends StatelessWidget {
  final Color? color;
  final String time;

  const CountDownTimer({super.key, this.color, required this.time});

  @override
  Widget build(BuildContext context) {
    return Row(
      children:[
        Icon(Icons.timer,color:color??Theme.of(context).primaryColor),
       const SizedBox(width: 5,),
        Text(time,style: countDownTimerTs().copyWith(
          color: color
        ),),
      ]
    );
  }
}
