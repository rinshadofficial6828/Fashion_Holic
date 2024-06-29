import 'package:fashion_app/Common/custom_app_bar.dart';
import 'package:fashion_app/Common/font.dart';
import 'package:fashion_app/Common/thems.dart';
import 'package:fashion_app/Custom/loading.dart';
import 'package:fashion_app/Features/Cart/Viewmodel/cart_view_model.dart';
import 'package:fashion_app/Features/Home/View/widget/bottom_sheet.dart';
import 'package:fashion_app/Features/Home/View/widget/size_list.dart';
import 'package:fashion_app/Features/Home/ViewModel/home_view_model.dart';
import 'package:fashion_app/Features/wishList/viewmodel/wishlist_view_model.dart';
import 'package:fashion_app/extention/path_extention.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreen extends StatefulWidget {
  final int id;
  const ProductDetailsScreen({super.key, required this.id});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final String  productsDetails = "Product details";
  final String selectedSizeText =  "Selected Size";
  final PageController _pageController = PageController();

  bool tappedText = false;
  String? selectedImages;
  int selectedIndex = 0;
  int selectedSize = 1;
  @override
  void initState() {
    super.initState();
    final productDetailsViewmodel =
        Provider.of<HomeViewModel>(context, listen: false);
    productDetailsViewmodel.getProductsById(id: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    final productDetailsViewmodel = Provider.of<HomeViewModel>(context);
    final cartViewModel = Provider.of<CartViewmodel>(context);
    final wishlistViewModel = Provider.of<WishListViewmodel>(context);
    return productDetailsViewmodel.productIsLoading
        ? Scaffold(
            body: Center(
              child: spinKits(colors: Kcolors.btnColor),
            ),
          )
        : Scaffold(
            backgroundColor: Colors.white,
            appBar: productDetailsAppBar(context, "About Products", () {
              productDetailsViewmodel.produtsresponse?.isWishlisted =
                  !((productDetailsViewmodel.produtsresponse?.isWishlisted ??
                      false));
              if (productDetailsViewmodel.produtsresponse?.isWishlisted ==
                  true) {
                wishlistViewModel.addToWishlist(
                    productId: productDetailsViewmodel.produtsresponse?.id,
                    context: context);
              } else {
                wishlistViewModel.removeWishList(
                    productId: productDetailsViewmodel.produtsresponse?.id,
                    context: context);
              }
            }),
            body: SingleChildScrollView(
              physics: ScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  productDetailsViewmodel.produtsresponse == null
                      ? Center(
                          child: Text("No products Found"),
                        )
                      : Center(
                          child: Stack(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.4,
                                child: PageView.builder(
                                  itemCount: productDetailsViewmodel
                                          .produtsresponse
                                          ?.productImages
                                          ?.length ??
                                      0,
                                  controller: _pageController,
                                  onPageChanged: (index) {
                                    setState(() {
                                      selectedIndex = index;
                                      selectedImages = productDetailsViewmodel
                                          .produtsresponse
                                          ?.productImages?[index];
                                    });
                                  },
                                  itemBuilder: (context, index) {
                                    return Image.network(
                                      productDetailsViewmodel.produtsresponse
                                              ?.productImages?[index] ??
                                          "",
                                      fit: BoxFit.contain,
                                      width: MediaQuery.of(context).size.width,
                                    );
                                  },
                                ),
                              ),
                              Positioned(
                                bottom: 2,
                                left: MediaQuery.of(context).size.width * 0.19,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(6),
                                    border: Border.all(
                                        width: 1, color: Colors.white),
                                  ),
                                  height: 60,
                                  width: MediaQuery.of(context).size.width * .6,
                                  child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: productDetailsViewmodel
                                            .produtsresponse
                                            ?.productImages
                                            ?.length ??
                                        0,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          setState(() {
                                            selectedIndex = index;
                                            selectedImages =
                                                productDetailsViewmodel
                                                    .produtsresponse
                                                    ?.productImages?[index];
                                          });
                                          // Update page view index when tapping an image in the list
                                          _pageController.animateToPage(
                                            index,
                                            duration:
                                                Duration(milliseconds: 500),
                                            curve: Curves.easeInOut,
                                          );
                                        },
                                        child: Container(
                                          height: MediaQuery.of(context)
                                              .size
                                              .height,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              1 /
                                              8,
                                          decoration: BoxDecoration(
                                            color: selectedIndex == index
                                                ? Kcolors.btnColor
                                                : Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(3),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                              child: FadeInImage.assetNetwork(
                                                placeholder:
                                                    "defaultImg.png".imagePath,
                                                image: productDetailsViewmodel
                                                            .produtsresponse
                                                            ?.productImages?[
                                                        index] ??
                                                    "",
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    separatorBuilder:
                                        (BuildContext context, int index) {
                                      return Container(color: Colors.white);
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                  SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          productDetailsViewmodel
                                  ?.produtsresponse?.productName ??
                              "",
                          style: getFonts(15, Colors.black),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          productsDetails,
                          style: getFonts(15, Colors.black),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          "Name : ${productDetailsViewmodel.produtsresponse?.productName ?? ""}",
                          style: getFonts(15, Colors.black54),
                        ),
                        Text(
                          "Color : ${productDetailsViewmodel.produtsresponse?.color ?? ""}",
                          style: getFonts(15, Colors.black54),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            productDetailsViewmodel
                                    .produtsresponse?.description ??
                                "No Discription",
                            style: getFonts(15, Colors.black54),
                            maxLines: tappedText ? null : 2,
                          ),
                        ),
                        InkWell(
                            onTap: () {
                              setState(() {
                                tappedText = !tappedText;
                              });
                            },
                            child: Text(
                              tappedText ? "Show Less" : "Show More",
                              textAlign: TextAlign.end,
                              style: normalFonts(12, Kcolors.btnColor),
                            )),
                        customDiv(),
                        Text(
                          "Product details",
                          style: getFonts(15, Colors.black),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * .04,
                            width: MediaQuery.of(context).size.width,
                            child: SelectedSize()),
                        SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            Text(
                              "Select Color :",
                              style: getFonts(15, Colors.black),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Text(
                              productDetailsViewmodel.produtsresponse?.color ??
                                  "",
                              style: getFonts(15, Colors.grey),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: [
                            Text(
                              "Price :",
                              style: getFonts(15, Colors.black),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Text(
                                productDetailsViewmodel
                                        .produtsresponse?.price ??
                                    "",
                                style: styledFont(
                                  15,
                                  Colors.red,
                                  TextDecoration.lineThrough,
                                )),
                            SizedBox(
                              width: 12,
                            ),
                            Text(
                                productDetailsViewmodel
                                        .produtsresponse?.offerPrice ??
                                    "",
                                style: styledFont(15, Colors.black, null))
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  )
                ],
              ),
            ),
            bottomSheet: customBottomSheets(
                context: context,
                tapOnCart: () {
                  cartViewModel.addTocart(
                      productId: productDetailsViewmodel.produtsresponse?.id,
                      context: context,
                      size: cartViewModel.selectedSize ?? "");
                },
                text:
                    ("₹ ${productDetailsViewmodel.produtsresponse?.price ?? "00"}")));
  }
}

customDiv() {
  return Divider(
    thickness: 1,
    endIndent: 0,
    indent: 0,
    color: Kcolors.btnColor,
  );
}
