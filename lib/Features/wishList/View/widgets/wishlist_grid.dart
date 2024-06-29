import 'package:animate_do/animate_do.dart';
import 'package:fashion_app/Common/custom_button.dart';
import 'package:fashion_app/Common/font.dart';
import 'package:fashion_app/Features/Home/View/product_details.dart';
import 'package:fashion_app/Features/Home/ViewModel/home_view_model.dart';
import 'package:fashion_app/Features/wishList/Model/wishlist_response.dart';
import 'package:fashion_app/Features/wishList/viewmodel/wishlist_view_model.dart';
import 'package:fashion_app/extention/path_extention.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GridWishList extends StatefulWidget {
  final List<WishlistItems> products;

  const GridWishList({Key? key, required this.products}) : super(key: key);

  @override
  _GridWishListState createState() => _GridWishListState();
}

class _GridWishListState extends State<GridWishList> {
  bool tapped = false;
  @override
  Widget build(BuildContext context) {
    final addToWishList = Provider.of<WishListViewmodel>(context,);
    final homeViewModel = Provider.of<HomeViewModel>(context,);
    return GridView.count(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: MediaQuery.of(context).size.height * 0.001,
      crossAxisSpacing: 18,
      mainAxisSpacing: 12,
      children: List.generate(widget.products.length, (index) {
        final product = widget.products[index];
        String? imageUrl = product.productImage ?? "";
        return FadeInUp(
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailsScreen(id: product.product ?? 0),
                ),
              );
            },
            child: Container(
             color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 150, // You can adjust this based on your content
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
                            setState(() {
                            product.isWishlisted = !(product.isWishlisted ?? false);
                            if(product.isWishlisted == true){
                             addToWishList.addToWishlist(productId: product.product ?? 0, context: context);
                            }else{
                              addToWishList.removeWishList(productId: product.product ?? 0, context: context);
                            }
                              });
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
                  SizedBox(height: MediaQuery.of(context).size.width * .01,),
                  Padding(
                    padding: const EdgeInsets.only(left: 12,right: 12),
                    child: SizedBox(height: MediaQuery.of(context).size.width *0.06,
                    child: customButtonNew("Out Of Stock", () {
          
                     }, context,10)
                    ),
                  )
                 
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
