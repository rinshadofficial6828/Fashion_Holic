import 'package:fashion_app/BottomBar/bottom_nav_bar.dart';
import 'package:fashion_app/Features/Authentication/View/sign.dart';
import 'package:fashion_app/Features/on_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> storeToken(String token) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('token', token);
}
Future<void> storeUser(int userId) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt('userId', userId );
}
Future<void> checkToken(context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('token');
  int? userId = prefs.getInt('userId');
  if (token != null && token.isNotEmpty || userId !=null) {
    print("user Id -------------?${userId}");
     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage()));
  } else {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OnboardingScreen()));
  }
}

Future<void> removeToken (context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('token');
  await prefs.remove('userId');
  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
builder: (context) => SignInScreen()), (Route route)=>false);
}