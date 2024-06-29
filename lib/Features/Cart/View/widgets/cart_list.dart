import 'dart:async';

import 'package:dotted_border/dotted_border.dart';
import 'package:fashion_app/Common/font.dart';
import 'package:fashion_app/Common/thems.dart';
import 'package:fashion_app/Features/Cart/View/widgets/pop_up_delete.dart';
import 'package:fashion_app/Features/Cart/Viewmodel/cart_view_model.dart';
import 'package:fashion_app/Features/Cart/model/my_cart_response.dart';
import 'package:fashion_app/Features/wishList/viewmodel/wishlist_view_model.dart';
import 'package:fashion_app/extention/path_extention.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartListWidget extends StatefulWidget {
  final List<CartItems> carts;

  const CartListWidget({Key? key, required this.carts}) : super(key: key);

  @override
  _CartListWidgetState createState() => _CartListWidgetState();
}

class _CartListWidgetState extends State<CartListWidget> {
  @override
  Widget build(BuildContext context) {
    final cartViewmodel = Provider.of<CartViewmodel>(context);
    final wishlistViewModel = Provider.of<WishListViewmodel>(context);
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) {
        return SizedBox(height: 16,);
      },
      itemCount: widget.carts.length,
      itemBuilder: (context, index) {
        final cart = widget.carts[index];
        int quantity = cart.quantity ?? 0;
        void updateQuantity(int index, int quantity) {
        setState(() {
     widget.carts[index].quantity = quantity;
        });
      }
      void updatedPrice(int index, int price) {
        setState(() {
    widget.carts[index].quantity = quantity;
        });
      }
        return Container(
          margin: EdgeInsets.only(left: 12,right: 12),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
            boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 4)],
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      children: [
                       Container(
  height: 80,
  width: 80,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(8),
  ),
  child: ClipRRect(
    borderRadius: BorderRadius.circular(20),
    child: FadeInImage.assetNetwork(
      placeholder: "boy1.png".imagePath,
      image: cart.productImages?.first ?? "",
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      fit: BoxFit.fill,
    ),
  ),
),

                        SizedBox(width: 12,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        Text(cart.productName ??" no name",style: getFonts(12, Colors.black), ),
                        SizedBox(height: 6,),
                        Text("Size : ${cart.selectedSize?.toUpperCase()}",style: getFonts(12, Colors.grey), ),
                        SizedBox(height: 6,),
                        Text("₹ ${cart.totalPrice}",style: getFonts(12, Colors.black),)
                        ],),
                        Spacer(),
                        addButton(icon: Icons.remove, ontap: () {
                          setState(() {
                            if (quantity > 1) {
                              quantity--;
                              updateQuantity(index, quantity);
                              cartViewmodel.updatecart(quantity: quantity, productId: cart.id);
                            }
                          });
                        },color1: Colors.grey,color2: Colors.black),
                        SizedBox(width: 6),
                        Text(quantity.toString()),
                        SizedBox(width: 6),
                        addButton(icon: Icons.add, ontap: () {
                          setState(() {
                            if (quantity < 5) {
                              quantity++;
                              updateQuantity(index, quantity);
                              cartViewmodel.updatecart(quantity: quantity, productId: cart.id);
                            }
                          });
                          
                        }, color1: Kcolors.btnColor,color2: Colors.white),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                 Expanded(child: 
                 removeFromCart(text: "Add  To WishList", color: Colors.black, ontap: (){
                  print(cart.productId);
                  wishlistViewModel.addToWishlist(productId: cart.productId ??0, context: context);
                  Timer(Duration(milliseconds: 1200), () {
                   cartViewmodel.deleteCart(cartId: cart.id, context: context);
                   });
                  
                 }, icon: Icons.add, color1: Colors.black)
                 ),
                  Expanded(child:
                 removeFromCart(text: "Delete", color: Colors.red, ontap: (){
                  showAlertDelete(context: context, cartResponse: widget.carts, index: index);
                 },icon: Icons.delete, color1: Colors.red)
                 )
                ],
              )
            ],
          ),
        );
      },
    );
  }

  Widget addButton({required IconData icon, required VoidCallback ontap,required Color color1,required Color color2}) {
    return InkWell(
      onTap: ontap,
      child: CircleAvatar(
        backgroundColor: color1,
        maxRadius: 15,
        child: Icon(
          icon,
          color: color2,
        ),
      ),
    );
  }
}

removeFromCart({required String text,required Color color,required VoidCallback ontap,required IconData icon,required Color color1}){
  return InkWell(
    onTap: ontap,
    child: DottedBorder(
      color: Colors.grey,
      radius: Radius.circular(10),
      child: Padding(
        padding: const EdgeInsets.only(top: 8,bottom: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon,color: color1,),SizedBox(width: 5,),
            Text(text,style: getFonts(12, color,))
          ],
        ),
      ),
    ),
  );
}
