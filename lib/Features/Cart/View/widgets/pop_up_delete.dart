import 'package:fashion_app/Common/alerts.dart';
import 'package:fashion_app/Common/font.dart';
import 'package:fashion_app/Features/Cart/Viewmodel/cart_view_model.dart';
import 'package:fashion_app/Features/Cart/model/my_cart_response.dart';
import 'package:fashion_app/extention/path_extention.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

showAlertDelete({
  required BuildContext context,
  required List<CartItems?> cartResponse,
  required int index,
}) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      final cartViewModel = Provider.of<CartViewmodel>(context,listen: false);
      final cart = cartResponse[index];
      return AlertDialog(
        title: Row(
          children: [
            Text("Delete this cart?", style: getFonts(15, Colors.black)),
            Spacer(),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.close, color: Colors.red),
            )
          ],
        ),
        content: IntrinsicHeight(
          child: Row(
            children: [
              SizedBox(
                height: 80,
                width: 80,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: FadeInImage.assetNetwork(
                    placeholder: 'boy1.png'.imagePath,
                    fit: BoxFit.fill,
                    image: cart?.productImages?.first ?? "",
                  ),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cart?.productName ?? "",
                      style: getFonts(12, Colors.black),
                    ),
                    SizedBox(height: 12),
                    Text(
                      cart?.selectedSize ?? "",
                      style: getFonts(12, Colors.black),
                    ),
                    Text(
                      (cart?.price ?? "").toString(),
                      style: getFonts(12, Colors.red),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              customLogoutBtn("Ok", () {
                 cartViewModel.deleteCart(cartId: cart?.id ?? 0, context: context);
              }),
              SizedBox(width: 12),
              customLogoutBtn("Cancel", () {
                Navigator.pop(context);
              })
            ],
          )
        ],
      );
    },
  );
}