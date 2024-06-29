import 'package:fashion_app/Features/Home/Model/get_products_response_model.dart';
import 'package:fashion_app/Features/Home/Model/home_model.dart';
import 'package:fashion_app/Features/Home/Repository/home_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeViewModel extends ChangeNotifier {
  bool initialPage = false;
  List<String> sales = ["All", "Men", "Women", "Boy", "Girl", "Trends"];
   ScrollController scrollController = ScrollController();
   ScrollController scrollController1 = ScrollController();
  int currentPage = 1;
  int categoryPage = 1;
  int offlinePages = 1;
  bool productIsLoading = false;
  bool isLoading = false;
  bool isCategoryloading = false;
 HomeRepository homeRepository =HomeRepository();
 ProductsResponseModel? allProducts;
 List<Results> results = [];
 List<Results> onlyOne = [];
 List<Results> categoryList = [];
 GetprodutsByIdResponse? produtsresponse;
 String? token;
 int? userId;
 int? shimmerId;

 checkTokenAndId() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  token = prefs.getString('token');
  userId = prefs.getInt('userId');
  notifyListeners();
 }

 fetchProducts() async {
      isLoading = true;
     await homeRepository.showallProducts(page: currentPage+1).then((value) {
        isLoading = false;
        results.addAll(value?.results ?? []);
        print(value?.next ?? "nothing you got");
      });
      notifyListeners();
  }
  fetchProductsFirstPage() async {
      isLoading = true;
     await homeRepository.showallProducts(page: 1).then((value) {
        isLoading = false;
        onlyOne.addAll(value?.results ?? []);
        print(value?.next ?? "nothing you got");
      });
      notifyListeners();
  }

  fetchProductByGender({required String gender})async {
    isLoading = true;
    await homeRepository.showProductByGender(pages: currentPage, gender: gender).then((value){
    isLoading =  false;
    results.addAll(value?.results ?? []);
    });
    notifyListeners();
  }

  void scrollListener() {
    if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent &&
        !isLoading) {
      currentPage++;
      fetchProducts();
      fetchProductByGender(gender: '');
    }
    notifyListeners();
  }
  //!category
  getCategory({required String categories}) async {
      isCategoryloading = true;
    await homeRepository.getcategoryProducts(page: categoryPage,category: categories).then((value) {
        isCategoryloading = false;
        categoryList.addAll(value?.results ?? []);
        print(value?.next ?? "nothing you got");
      });
      notifyListeners();
  }

  //!productDetails
  getProductsById({required int id})async{
    productIsLoading = true;
    await homeRepository.productById(productId: id).then((value) {
      if(value?.description != null){
        productIsLoading = false;
      produtsresponse = value;
      }
      else{
        productIsLoading = false;
      }
    });
    notifyListeners();
  }

  //!fake
  getShimmerId () async{
  await homeRepository.showallProducts(page: 1).then((value) {
    print(value?.results?.length);
    shimmerId = value?.results?.first.id;
  });
  notifyListeners();
  }
}