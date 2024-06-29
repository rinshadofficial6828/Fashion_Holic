import 'package:another_flushbar/flushbar.dart';
import 'package:fashion_app/Common/font.dart';
import 'package:fashion_app/Common/thems.dart';
import 'package:fashion_app/Custom/loading.dart';
import 'package:fashion_app/Hive/shared_preference.dart';
import 'package:flutter/material.dart';

   showFlushBar(context,String message,Color color) {
    return  Flushbar(
      animationDuration: Duration(milliseconds:1200 ),
                      flushbarPosition: FlushbarPosition.TOP,
                      margin: EdgeInsets.only(left: 12,right: 12,),
                      backgroundColor: color,
                      borderRadius: BorderRadius.circular(12),
  message: message,
  icon: Icon(
    Icons.info_outline,
    size: 28.0,
    color: Colors.white,
    ),
  duration: Duration(seconds: 3),
).show(context);
  }


 showAlertPopUp(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              Text("Logout?", style:getFonts(15, Colors.black,) ),Spacer(),
              InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Icon(Icons.close,color: Colors.red,))
            ],
          ),
          content: Text("Are You Sure To Logout?", style:getFonts(12, Colors.black,) ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
             customLogoutBtn("Ok",(){
              removeToken(context);
             }),
             SizedBox(width: 12,),
             customLogoutBtn("Cancel",(){
              Navigator.pop(context);
             })
            ],)
          ],
        );
      },
    );
  }

  customLogoutBtn(String text,VoidCallback ontap){
    return InkWell(
      onTap: ontap,
      child: Container(
                  height: 40,
                  width: 80,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
                color: Kcolors.btnColor,
                ),
                child: Center(child: Text(text,style: normalFonts(15, Colors.white),)),
                ),
    );
  }

  showFlushBarCart(context,String message,) {
    return  Flushbar(
                      flushbarPosition: FlushbarPosition.BOTTOM,
                      margin: EdgeInsets.only(left: 30,right: 30,),
                      backgroundColor: Kcolors.btnColor,
                      borderRadius: BorderRadius.circular(2),
  message: "Product Added To",
  duration: Duration(seconds: 2),
).show(context);
  }
 //loading 
loadingPopUp(BuildContext context) {
  return showDialog(
    barrierDismissible: false,
    barrierColor: Colors.transparent, // Set the barrierColor to transparent
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        content: spinKits(colors: Kcolors.btnColor),
      );
    },
  );
}
loadingPopUpLogin(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        content: spinKits(colors: Colors.white),
      );
    },
  );
}

  void closeLoadingPopUp(BuildContext context) {
  Navigator.of(context).pop();
}

 addToWishlistFlushBar(context,String message,Color color,IconData icon) {
    return  Flushbar(
      animationDuration: Duration(milliseconds:200 ),
                      flushbarPosition: FlushbarPosition.TOP,
                      margin: EdgeInsets.only(left: 12,right: 12,),
                      backgroundColor: color,
                      borderRadius: BorderRadius.circular(12),
  message: message,
  icon: Icon(
    icon,
    size: 28.0,
    color: Colors.white,
    ),
  duration: Duration(seconds: 3),
).show(context);
  }

//!not login Alert popup
