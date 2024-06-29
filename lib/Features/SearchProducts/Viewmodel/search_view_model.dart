import 'package:fashion_app/Features/Home/Model/home_model.dart';
import 'package:fashion_app/Features/SearchProducts/Repository/search_products_repository.dart';
import 'package:fashion_app/Features/SearchProducts/model/search_product_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Searchviewmodel extends ChangeNotifier {
  Searchrepository searchrepository = Searchrepository();
  ScrollController scrollController = ScrollController();
  bool isLoading = false;
  String filterType = "";
  String search = "";
  List<SearchResults> searchedproducts = [];
  List<Results> filteredProducts = [];
  int currentPage = 1;
  getSearchResults ({required dynamic searchProducts}) async {
    isLoading = true;
  await searchrepository.searchProducts(searchItems: searchProducts, page: currentPage).then((value){
  if(value?.results != null) {
    isLoading = false;
  searchedproducts.addAll(value?.results ?? []);
  }
  });
  notifyListeners();
  }
   
  //!filtered products
  filterResults ({required String product}) async {
    isLoading = true;
  await searchrepository.filterProducts(sortType: product, page: currentPage).then((value){
  if(value?.results != null) {
    isLoading = false;
  filteredProducts.addAll(value?.results ?? []);
  }
  });
  notifyListeners();
  }
  void scrollListners () {
    if(scrollController.position.pixels == scrollController.position.maxScrollExtent && !isLoading) 
    {
      currentPage ++;
      filterResults(product: filterType);
      getSearchResults(searchProducts: search);
     
    }
    notifyListeners();
  }
}