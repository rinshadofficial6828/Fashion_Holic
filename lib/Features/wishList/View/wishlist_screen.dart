import 'package:fashion_app/Common/custom_app_bar.dart';
import 'package:fashion_app/Common/thems.dart';
import 'package:fashion_app/Custom/loading.dart';
import 'package:fashion_app/Features/wishList/View/widgets/wishlist_grid.dart';
import 'package:fashion_app/Features/wishList/viewmodel/wishlist_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WishListPage extends StatefulWidget {
  const WishListPage({super.key});

  @override
  State<WishListPage> createState() => _WishListPageState();
}

class _WishListPageState extends State<WishListPage> {
  @override
  void initState() {
    super.initState();
    final wishListviewmodel = Provider.of<WishListViewmodel>(context, listen: false);
    wishListviewmodel.getAllWishListLoading(context: context);
    wishListviewmodel.allWishList.clear();
    wishListviewmodel.currentPage = 1;
    wishListviewmodel.getAllWishList();
    wishListviewmodel.scrollController.addListener(wishListviewmodel.scrollListener);
  }
  loadData()async {
    final wishListviewmodel = Provider.of<WishListViewmodel>(context, listen: false);
    wishListviewmodel.allWishList.clear();
    wishListviewmodel.currentPage = 1;
    wishListviewmodel.getAllWishList();
    wishListviewmodel.scrollController.addListener(wishListviewmodel.scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    final wishListviewmodel = Provider.of<WishListViewmodel>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: normalAppBar(context, "My WishList"),
      body:
      wishListviewmodel.ishimmerLoading ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: spinKits(colors: Colors.black)),
            ],
          ):
       RefreshIndicator(
        onRefresh: () async {
          Future.delayed(Duration(milliseconds: 1200));
        await loadData();
        },
        child: SingleChildScrollView(
          controller: wishListviewmodel.scrollController,
          physics: AlwaysScrollableScrollPhysics(),
          child:  Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16,top: 20,bottom: 50),
                child: GridWishList(products: wishListviewmodel.allWishList),
              ),
              wishListviewmodel.isLoading ? Padding(
                padding: const EdgeInsets.only(bottom: 100),
                child: spinKits(colors: Kcolors.btnColor),
              ):SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
