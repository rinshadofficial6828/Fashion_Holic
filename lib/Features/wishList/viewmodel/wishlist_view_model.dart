import 'package:fashion_app/Common/alerts.dart';
import 'package:fashion_app/Features/wishList/Model/wishlist_response.dart';
import 'package:fashion_app/Features/wishList/Repository/wisglist_repository.dart';
import 'package:flutter/material.dart';

class WishListViewmodel extends ChangeNotifier {
  WishListrepository wishListRepo = WishListrepository();
  ScrollController scrollController = ScrollController();
  int currentPage = 1;
  List<WishlistItems> allWishList = [];
  List<WishlistItems> shimmerWidget = [];
  bool isLoading = false;
  bool ishimmerLoading = false;

  addToWishlist({required  productId,required BuildContext context})async{
    loadingPopUp(context);
    await wishListRepo.addToWishList(productId: productId).then((value){
      print("------------>${value?.status}");
      if(value?.status == true){
        closeLoadingPopUp(context);
        addToWishlistFlushBar(context, "Product Added Success", Colors.green, Icons.check);
        print(value?.message);
      }else{
        closeLoadingPopUp(context);
        addToWishlistFlushBar(context, "Product Alredy Wishlisted", Colors.green, Icons.check);
      }
    });
  }
  //remove
  removeWishList({required  productId,required BuildContext context})async{
    loadingPopUp(context);
    await wishListRepo.removeFromWishList(productId: productId).then((value){
      if(value?.status == true){
        closeLoadingPopUp(context);
        showFlushBar(context, "Product Removed Success", Colors.red);
      }else{
        closeLoadingPopUp(context);
      }
      notifyListeners();
    });
  }
  //get favorites
  getAllWishList() async {
    isLoading = true;
    await wishListRepo.getallWishList(page: currentPage).then((value) {
      isLoading = false;
      allWishList.addAll(value?.wishlistItems ?? []);
      notifyListeners();
    });
    notifyListeners();
  }
  void scrollListener() {
    if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent &&
        !isLoading) {
      currentPage++;
      getAllWishList();
    }
    notifyListeners();
  }

 // forLoading 
  getAllWishListLoading({required BuildContext context}) async {
    ishimmerLoading = true;
    await wishListRepo.getallWishList(page: 1).then((value) {
      if( value?.wishlistItems != null){
      ishimmerLoading = false;
      shimmerWidget = value?.wishlistItems ?? [];
      }else{
        ishimmerLoading = false;
      }
      notifyListeners();
    });
    notifyListeners();
  }
}