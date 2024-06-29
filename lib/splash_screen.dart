import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:fashion_app/Common/font.dart';
import 'package:fashion_app/Common/thems.dart';
import 'package:fashion_app/Hive/shared_preference.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() =>
      _SplashPageState(); //create and initial state for the screen
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    Timer(const Duration(seconds: 5), () {
     checkToken(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FadeInLeft(
                  duration: Duration(milliseconds: 400),
                  child: CircleAvatar(
                    backgroundColor: Kcolors.btnColor,
                    maxRadius: 30,
                    child: Text("F",style: splashFont(40, Colors.white),),
                  ),
                ), SizedBox(width: 12,),
                DefaultTextStyle(
                  style:splashFont(25, Colors.black),
                  child: AnimatedTextKit(
                    totalRepeatCount: 1, 
                    animatedTexts: [
                      TypewriterAnimatedText('fashion',speed: Duration(milliseconds: 200),),
                    ],
                  ),
                )
              ],
            )
          ],
        )
    );
  }
}