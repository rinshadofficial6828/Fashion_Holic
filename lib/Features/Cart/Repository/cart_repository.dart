import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fashion_app/Custom/urls.dart';
import 'package:fashion_app/Features/Cart/model/add_to_cart.dart';
import 'package:fashion_app/Features/Cart/model/my_cart_response.dart';
import 'package:fashion_app/Features/wishList/Model/wishlist_response_model.dart';
import 'package:flutter_svprogresshud/flutter_svprogresshud.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Cartrepository {
  Future<AddToCart?> addTocart ({required dynamic productId,required String size}) async {
    SVProgressHUD.show();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    int?id = prefs.getInt('userId');
    try{
      var headers = {
  'Cookie': 'jwt=b''$token'
};
var dio = Dio();
var response = await dio.request(
  '${Urls.baseUrl}add-to-cart/$id/$productId/$size/',
  options: Options(
    method: 'POST',
    headers: headers,
  ),
);

if (response.statusCode == 201) {
  SVProgressHUD.dismiss();
  return AddToCart.fromJson(response.data);
}
else {
  SVProgressHUD.dismiss();
  print(response.statusMessage);
}
    }catch(e){
      SVProgressHUD.dismiss();
      print(e);
    }
  }

  //show carts
  Future<CartResponse?> showCart()async {
    try{
       SVProgressHUD.show();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    int?id = prefs.getInt('userId');
      var headers = {
  'Cookie': 'jwt=b''$token'
};
var dio = Dio();
var response = await dio.request(
  '${Urls.baseUrl}view-cart/$id/',
  options: Options(
    method: 'GET',
    headers: headers,
  ),
);

if (response.statusCode == 200) {
  SVProgressHUD.dismiss();
  return CartResponse.fromJson(response.data);
}
else {
  SVProgressHUD.dismiss();
  print(response.statusMessage);
}
    }catch(e){
      SVProgressHUD.dismiss();
      print(e);
    }
  }

  //!update cart

  Future <AddWishListResponse?> updateCart({required  quantity,required productId})async{
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int? userid = prefs.getInt('userId');
      var headers = {
  'Content-Type': 'application/x-www-form-urlencoded'
};
var data = {
  'quantity': '$quantity'
};
var dio = Dio();
var response = await dio.request(
  '${Urls.baseUrl}update-cart/$userid/$productId/',
  options: Options(
    method: 'PUT',
    headers: headers,
  ),
  data: data,
);

if (response.statusCode == 200) {
  print(json.encode(response.data));
  return AddWishListResponse.fromJson(response.data);
}
else {
  print(response.statusMessage);
}
    }catch(e){
    print(e);
    }
  }

  //remove cart

  Future <AddWishListResponse?>removeCart({required cartId}) async {
    SVProgressHUD.show();
    SharedPreferences prefs = await SharedPreferences.getInstance();
      int? userid = prefs.getInt('userId');
    try{
      var dio = Dio();
var response = await dio.request(
  '${Urls.baseUrl}delete-cart-item/$userid/$cartId/',
  options: Options(
    method: 'DELETE',
  ),
);

if (response.statusCode == 200) {
  SVProgressHUD.dismiss();
  print(json.encode(response.data));
  return AddWishListResponse.fromJson(response.data);
}
else {
  SVProgressHUD.dismiss();
  print(response.statusMessage);
}

    }catch(e){
      SVProgressHUD.dismiss();
      print(e);
    }
  }
}