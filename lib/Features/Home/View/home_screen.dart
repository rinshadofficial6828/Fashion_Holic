import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:badges/badges.dart' as badges;
import 'package:fashion_app/Common/Shimmer%20Widget/shimmer_home.dart';
import 'package:fashion_app/Common/font.dart';
import 'package:fashion_app/Common/text_field_decoration.dart';
import 'package:fashion_app/Common/thems.dart';
import 'package:fashion_app/Features/Cart/View/cart.dart';
import 'package:fashion_app/Features/Cart/Viewmodel/cart_view_model.dart';
import 'package:fashion_app/Features/Home/View/widget/carosel_slider.dart';
import 'package:fashion_app/Features/Home/View/widget/category_list.dart';
import 'package:fashion_app/Features/Home/View/widget/sales_list.dart';
import 'package:fashion_app/Features/Home/ViewModel/home_view_model.dart';
import 'package:fashion_app/Features/SearchProducts/View/search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String search = "Search";
  final String category = "Category";
  final String newSales = "New Sales";
  @override
  void initState() {
    super.initState();
     final homeviewModel = Provider.of<HomeViewModel>(context,listen: false);
     homeviewModel.initialPage = true;
    print(homeviewModel.initialPage);
     homeviewModel.getShimmerId();
     homeviewModel.checkTokenAndId();
     getData();
  }
  void getData() async {
    final homeviewModel = Provider.of<HomeViewModel>(context, listen: false);
    await homeviewModel.checkTokenAndId();
    homeviewModel.results.clear();
    homeviewModel.currentPage = 1;
    homeviewModel.fetchProducts();
    homeviewModel.fetchProductsFirstPage();
    homeviewModel.scrollController.addListener(homeviewModel.scrollListener);
  }


  @override
  Widget build(BuildContext context) {
    final homeviewModel = Provider.of<HomeViewModel>(context,listen: true);
    final cartViewModel = Provider.of<CartViewmodel>(context,listen: true);
    return homeviewModel.shimmerId == null ? HomeShimmerScreen():
     Scaffold(
      backgroundColor: Colors.white,
            appBar:  PreferredSize(
        preferredSize: Size.fromHeight(120), // Adjust the height as needed
        child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.white,
              scrolledUnderElevation: 0,
              automaticallyImplyLeading: false,
              toolbarHeight: 60,
              title: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Kcolors.btnColor,
                    maxRadius: 20,
                    child: Text(
                      "F",
                      style: splashFont(15, Colors.white),
                    ),
                  ),
                  SizedBox(width: 6),
                  DefaultTextStyle(
                    style: splashFont(15, Colors.black),
                    child: AnimatedTextKit(
                      repeatForever: true,
                      animatedTexts: [
                        RotateAnimatedText('Fashon'),
                        RotateAnimatedText('OPTIMISTIC'),
                        RotateAnimatedText('DIFFERENT'),
                      ],
                    ),
                  ),
                ],
              ),
              actions: [
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CartPage()));
                  },
                  child: badges.Badge(
                    position: badges.BadgePosition.topEnd(),
                    badgeStyle: badges.BadgeStyle(
                        padding: EdgeInsets.all(8),
                        badgeColor: cartViewModel.cartResponse.isNotEmpty
                            ? Kcolors.btnColor
                            : Colors.transparent),
                    badgeContent: cartViewModel.cartResponse.isNotEmpty
                        ? Text(
                            cartViewModel.cartResponse.length.toString(),
                            style: getFonts(12, Colors.white),
                          )
                        : null,
                    child: CircleAvatar(
                      radius: 25,
                      child: Icon(
                        Icons.shopping_cart,
                        color: Kcolors.btnColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: CircleAvatar(
                    radius: 25,
                    child: Icon(
                      Icons.notifications,
                      color: Kcolors.btnColor,
                    ),
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 12,right: 12),
              height: 50,
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SearchScreen()));
                },
                child: Row(
                  children: [
                    Flexible(
                      child: TextFormField(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => SearchScreen()));
                        },
                        readOnly: true,
                        decoration: searchField(Icon(Icons.search), search),
                      ),
                    ),
                    SizedBox(width: 4),
                    Container(
                      decoration: BoxDecoration(
                          color: Kcolors.btnColor,
                          borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 10, bottom: 10, left: 10, right: 10),
                        child: Icon(
                          Icons.filter_alt,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
            body: RefreshIndicator(
              color: Colors.white,
              backgroundColor: Kcolors.btnColor,
              onRefresh: () async {
                await Future.delayed(Duration(milliseconds: 1200));
                homeviewModel.fetchProducts();
              },
              child: SingleChildScrollView(
                controller: homeviewModel.scrollController,
                physics: AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20,top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //!end
                          SizedBox(
                            height: 16,
                          ),
                          //!corosel slider start
                          CaroselSliderPage(),
                          //!end
                          SizedBox(
                            height: 16,
                          ),
                          //!categories
                          Row(
                            children: [
                              Text(
                                category,
                                style: getFonts(15, Colors.black),
                              ),
                              Spacer(),
                              Text(
                                "see all",
                                style: getFonts(10, Colors.grey.shade800),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Category(),
                          //!end
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            newSales,
                            style: getFonts(15, Colors.black),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CurrentSalesList(),
                          SizedBox(
                            height: 120,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
