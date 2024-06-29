import 'package:dio/dio.dart';
import 'package:fashion_app/Custom/urls.dart';
import 'package:fashion_app/Features/Home/Model/get_products_response_model.dart';
import 'package:fashion_app/Features/Home/Model/home_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeRepository {
  Future<ProductsResponseModel?> showallProducts({page}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? id = prefs.getInt('userId') ?? 0;
    try {
      var dio = Dio();
      var response = await dio.request(
        '${Urls.baseUrl}user-products/$id/?page= $page',
        options: Options(
          method: 'GET',
        ),
      );

      if (response.statusCode == 200) {
        return ProductsResponseModel.fromJson(response.data);
      } else {
        print(response.statusMessage);
      }
    } catch (e) {}
  }

  //!categoryproducts
  Future<ProductsResponseModel?> getcategoryProducts({page, category}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? userId = prefs.getInt('userId') ?? 0;
    try {
      var dio = Dio();
      var response = await dio.request(
        '${Urls.baseUrl}category-filter/$userId/?category=$category&page=$page',
        options: Options(
          method: 'GET',
        ),
      );

      if (response.statusCode == 200) {
        print(response.data);
        return ProductsResponseModel.fromJson(response.data);
      } else {
        print(response.statusMessage);
      }
    } catch (e) {}
  }

  //getcart by id
  Future<GetprodutsByIdResponse?> productById({required int productId}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? userId = prefs.getInt('userId') ?? 0;
    try {
      var dio = Dio();
      var response = await dio.request(
        '${Urls.baseUrl}user-singleproducts/$userId/$productId/',
        options: Options(
          method: 'GET',
        ),
      );

      if (response.statusCode == 200) {
        return GetprodutsByIdResponse.fromJson(response.data);
      } else {
        print(response.statusMessage);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<ProductsResponseModel?> showProductByGender(
      {required dynamic pages, required String gender}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? userId = prefs.getInt('userId') ?? 0;
    try {
      var dio = Dio();
      var response = await dio.request(
        '${Urls.baseUrl}gender-filter/$userId/?gender=$gender&page=$pages',
        options: Options(
          method: 'GET',
        ),
      );

      if (response.statusCode == 200) {
        return ProductsResponseModel.fromJson(response.data);
      } else {
        print(response.statusMessage);
      }
    } catch (e) {}
  }

  Future<ProductsResponseModel?> getProductByGenderOffline(
      {required String gender}) async {
    try {
      var dio = Dio();
      var response = await dio.request(
        '${Urls.baseUrl}products-gender/?gender=$gender&page=1',
        options: Options(
          method: 'GET',
        ),
      );

      if (response.statusCode == 200) {
        print(response.statusMessage);
        return ProductsResponseModel.fromJson(response.data);
      } else {
        print(response.statusMessage);
      }
    } catch (e) {
      print(e);
    }
  }
}
