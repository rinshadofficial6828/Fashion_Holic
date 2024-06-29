import 'package:dio/dio.dart';
import 'package:fashion_app/Custom/urls.dart';
import 'package:fashion_app/Features/Home/Model/home_model.dart';
import 'package:fashion_app/Features/SearchProducts/model/search_product_response.dart';
import 'package:flutter_svprogresshud/flutter_svprogresshud.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Searchrepository {
  Future <searchProductResponse?>searchProducts ({required String searchItems,required dynamic page}) async {
    SVProgressHUD.show();
    try{
     var dio = Dio();
var response = await dio.request(
  '${Urls.baseUrl}search/?search_query=$searchItems&page=$page',
  options: Options(
    method: 'GET',
  ),
);

if (response.statusCode == 200) {
  SVProgressHUD.dismiss();
  return searchProductResponse.fromJson(response.data);
}
else {
  SVProgressHUD.dismiss();
  print(response.statusMessage);
}
    }catch(e){
      SVProgressHUD.dismiss();
    }
  }

  Future <ProductsResponseModel?>filterProducts ({required String sortType,required int page}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? userId = prefs.getInt('userId');
    SVProgressHUD.show();
    try{
     var dio = Dio();
var response = await dio.request(
  '${Urls.baseUrl}products/$sortType/$userId/?page=$page',
  options: Options(
    method: 'GET',
  ),
);

if (response.statusCode == 200) {
  SVProgressHUD.dismiss();
  return ProductsResponseModel.fromJson(response.data);
}
else {
  SVProgressHUD.dismiss();
  print(response.statusMessage);
}
    }catch(e){
      SVProgressHUD.dismiss();
    }
  }
}