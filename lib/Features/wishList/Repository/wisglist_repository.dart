import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fashion_app/Custom/urls.dart';
import 'package:fashion_app/Features/wishList/Model/wishlist_response.dart';
import 'package:fashion_app/Features/wishList/Model/wishlist_response_model.dart';
import 'package:flutter_svprogresshud/flutter_svprogresshud.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WishListrepository {

  Future <WishlistResponseModel?> getallWishList({required  page})async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String?token = prefs.getString('token');
  int?userId = prefs.getInt('userId');
  try{
    var headers = {
  'Cookie': 'jwt=b'"$token"};
var dio = Dio();
var response = await dio.request(
  '${Urls.baseUrl}view-wishlist/$userId/?page=$page',
  options: Options(
    method: 'GET',
    headers: headers,
  ),
);

if (response.statusCode == 200) {
  return WishlistResponseModel.fromJson(response.data);
}
else {
  print(response.statusMessage);
}

  }catch(e){
    SVProgressHUD.dismiss();
  print(e);
  }
  }

  Future<AddWishListResponse?> addToWishList({required  productId}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? id = prefs.getInt('userId');
    try{
      var dio = Dio();
var response = await dio.request(
  '${Urls.baseUrl}add-to-wishlist/$id/$productId/',
  options: Options(
    method: 'POST',
  ),
);

if (response.statusCode == 201) {
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

  Future<AddWishListResponse?> removeFromWishList({required  productId}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? id = prefs.getInt('userId');
    try{
      var dio = Dio();
var response = await dio.request(
  '${Urls.baseUrl}remove-from-wishlist/$id/$productId/',
  options: Options(
    method: 'DELETE',
  ),
);

if (response.statusCode == 200) {
  print("-------->${id}");
  print("------>${productId}");
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
}