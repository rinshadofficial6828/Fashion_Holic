import 'package:animate_do/animate_do.dart';
import 'package:fashion_app/Common/bottomSheet.dart';
import 'package:fashion_app/Common/font.dart';
import 'package:fashion_app/Features/Home/Model/home_model.dart';
import 'package:fashion_app/Features/Home/View/product_details.dart';
import 'package:fashion_app/Features/Home/ViewModel/home_view_model.dart';
import 'package:fashion_app/Features/wishList/viewmodel/wishlist_view_model.dart';
import 'package:fashion_app/extention/path_extention.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TopPickUpList extends StatefulWidget {
  final List<Results> products;
  const TopPickUpList({super.key, required this.products});

  @override
  State<TopPickUpList> createState() => _TopPickUpListState();
}

class _TopPickUpListState extends State<TopPickUpList> {
  @override
  Widget build(BuildContext context) {
    final addToWishList = Provider.of<WishListViewmodel>(context,);
    final homeViewModel = Provider.of<HomeViewModel>(context,);
    return ListView.separated(
      separatorBuilder: (context,index){
        return SizedBox(width: 10,);
      },
      physics: AlwaysScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: widget.products.length,
      itemBuilder: (context,index){
        final product = widget.products[index];
        String? imageUrl = product.productImages?[0] ?? "";
      return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailsScreen(id: product.id ?? 0),
              ),
            );
          },
          child: FadeInRight(
            child: Container(
            margin: EdgeInsets.only(top: 10,bottom: 10,left: 10,right: 10),
              width: MediaQuery.of(context).size.width * 0.5,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(color: Colors.grey,spreadRadius: 1,blurRadius: 2)
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width ,
                      height: MediaQuery.of(context).size.width * .3, // You can adjust this based on your content
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(6),
                          topRight: Radius.circular(6),
                        ),
                      ),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(6),
                              topRight: Radius.circular(6),
                              bottomLeft: Radius.circular(6),
                              bottomRight: Radius.circular(6),
                            ),
                            child: FadeInImage.assetNetwork(
                              fadeInCurve: Curves.decelerate,
                              fadeOutCurve: Curves.decelerate,
                              placeholder: 'girl1.png'.imagePath,
                              image: imageUrl,
                              fit: BoxFit.contain,
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width,
                            ),
                          ),
                          Positioned(
                            top: 8,
                            right: 10,
                            child: InkWell(
                              onTap: () {
                                if(homeViewModel.token == null || homeViewModel.token == ""){
                                    notLoginPopUp(context);
                                  } else{
                                setState(() {
                                  product.isWishlisted = !(product.isWishlisted ?? false);
                                  if(product.isWishlisted == true){
                                    addToWishList.addToWishlist(productId: product.id ?? 0, context: context);
                                  } else {
                                    addToWishList.removeWishList(productId: product.id ?? 0, context: context);
                                  }
                                });
                              }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(100),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      spreadRadius: 0.5,
                                      blurRadius: 1
                                    )
                                  ]
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Icon(
                                    product.isWishlisted == true ? Icons.favorite : Icons.favorite_border,
                                    color: product.isWishlisted == true ? Colors.red : Colors.black,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12,),
                    Center(child: Text(product.productName ?? "", style: getFonts(12, Colors.black))),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                      child: Row(
                        children: [
                          Text(
                            product.price.toString(),
                            style: styledFont(12, Colors.green, TextDecoration.lineThrough),
                          ),
                          Spacer(),
                          Text(
                            (product.offerPrice ?? "0").toString(),
                            style: styledFont(12, Colors.red, null),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
    });
  }
}