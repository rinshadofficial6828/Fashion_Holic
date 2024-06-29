import 'package:fashion_app/Common/alerts.dart';
import 'package:fashion_app/Common/bottomSheet.dart';
import 'package:fashion_app/Custom/show_toast.dart';
import 'package:fashion_app/Features/Cart/Repository/cart_repository.dart';
import 'package:fashion_app/Features/Cart/model/my_cart_response.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartViewmodel extends ChangeNotifier {
  Cartrepository cartrepo = Cartrepository();
  List<CartItems> cartResponse = [];
  String? selectedSize;
  dynamic totalPrice;
  bool isLoadingShimmer = false;

  addTocart({required dynamic productId,required BuildContext context,required String size})async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? userId = prefs.getInt('userId');
    String? token = prefs.getString('token');
    await cartrepo.addTocart(productId: productId, size: size).then((value) {
      if(userId == null && token == null){
        notLoginPopUp(context);
      }
      print("--------------------------------->${value?.id}");
    if(value?.id != null){
      print("Success");
      showCustomToast(context);
      showcart();
    }else{
    showFlushBar(context, "Produt Adding faild", Colors.red);
    }
    });
    notifyListeners();
  }

  showcart() async {
    isLoadingShimmer = true;
    await cartrepo.showCart().then((value) {
      isLoadingShimmer = false;
      if(value?.cartItems != null){
      totalPrice = value?.totalCartPrice ?? 0;
      cartResponse = value?.cartItems ?? [];
      print(value?.cartItems?.length);
      }else{
      isLoadingShimmer = false;
      }
    });
    notifyListeners();
  }
  
  updatecart ({required quantity,required productId}) async {
    await cartrepo.updateCart(quantity: quantity , productId: productId).then((value) {
      if(value?.status == true){
        showcart();
      }
    });
    notifyListeners();
  }

  //delete cart
  deleteCart ({required cartId,required BuildContext context}) async {
    await cartrepo.removeCart(cartId: cartId).then((value) {
      if (value?.status == true){
        Navigator.pop(context);
       showFlushBar(context, "Cart Deleted Success", Colors.red);
       showcart();
      }else{
         showFlushBar(context, "Something went wrong", Colors.red);
      }
    },);
    notifyListeners();
  }

}