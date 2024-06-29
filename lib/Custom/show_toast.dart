import 'package:another_flushbar/flushbar.dart';
import 'package:fashion_app/Common/thems.dart';
import 'package:flutter/material.dart';



showCustomToast(context,) {
    return  Flushbar(
                      flushbarPosition: FlushbarPosition.BOTTOM,
                      forwardAnimationCurve: Curves.easeIn,
                      margin: EdgeInsets.only(left: 12,right: 12,bottom: 100),
                      backgroundColor: Kcolors.btnColor,
                      borderRadius: BorderRadius.circular(12),
  message: "Product Added To Cart",
  icon: Icon(
    Icons.check_circle_outline_outlined,
    size: 28.0,
    color: Colors.white,
    ),
  duration: Duration(seconds: 3),
).show(context);
  }