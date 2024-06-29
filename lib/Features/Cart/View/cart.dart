import 'dart:async';

import 'package:fashion_app/Common/Shimmer%20Widget/shimmer_cart.dart';
import 'package:fashion_app/Common/custom_app_bar.dart';
import 'package:fashion_app/Features/Cart/View/widgets/cart_list.dart';
import 'package:fashion_app/Features/Cart/Viewmodel/cart_view_model.dart';
import 'package:fashion_app/Features/Home/View/widget/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool loading = true;
  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 1200), () {
      setState(() {
         loading = false;
      });
     });
    final cartViewModel = Provider.of<CartViewmodel>(context,listen: false);
    cartViewModel.showcart();
  }
  @override
  Widget build(BuildContext context) {
    final cartViewModel = Provider.of<CartViewmodel>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBarAuth(context, true, "My Cart"),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child:
        cartViewModel.isLoadingShimmer ? CartShimmer():
         Column(children: [
          SizedBox(height: 20,),
         CartListWidget( carts: cartViewModel.cartResponse),
         SizedBox(height: 100,)
        ],),
      ),
      bottomSheet:
      cartViewModel.totalPrice != 0 && !loading  ?
       checkoutBottomSheet(context: context, tapOnCart: (){}, text: "₹ ${cartViewModel.totalPrice.toString()}"):null
    );
  }
}