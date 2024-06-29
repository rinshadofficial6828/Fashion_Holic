import 'package:fashion_app/Common/custom_button.dart';
import 'package:fashion_app/Common/font.dart';
import 'package:flutter/material.dart';

customBottomSheets ({required BuildContext context,required VoidCallback tapOnCart,required String text}) {
  return Container(
        height: MediaQuery.of(context).size.width *.2,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 2,
              spreadRadius: 2

            )
          ],
          borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10))
        ),
        child: Padding(padding: EdgeInsets.only(top: 15,bottom: 10, left: 20,right: 20),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text("Total price",style: getFonts(12, Colors.grey),),
              Text(text,style: getFonts(15, Colors.black),)
            ],),Spacer(),
            SizedBox(
              width: MediaQuery.of(context).size.width * .6,
              child: addToCartButton("Add To cart", tapOnCart, context) ,
            )
            
          ],
        ),
        ),
      );
}


checkoutBottomSheet ({required BuildContext context,required VoidCallback tapOnCart,required String text}) {
  return Container(
        height: MediaQuery.of(context).size.width *.2,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 2,
              spreadRadius: 2

            )
          ],
          borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10))
        ),
        child: Padding(padding: EdgeInsets.only(top: 15,bottom: 10, left: 20,right: 20),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text("Total price",style: getFonts(12, Colors.grey),),
              Text(text,style: getFonts(15, Colors.black),)
            ],),Spacer(),
            SizedBox(
              width: MediaQuery.of(context).size.width * .6,
              child: customButton("Checkout", tapOnCart, context) ,
            )
            
          ],
        ),
        ),
      );
}