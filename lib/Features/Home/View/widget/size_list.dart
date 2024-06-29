import 'package:fashion_app/Common/font.dart';
import 'package:fashion_app/Common/thems.dart';
import 'package:fashion_app/Features/Cart/Viewmodel/cart_view_model.dart';
import 'package:fashion_app/Features/Home/ViewModel/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectedSize extends StatefulWidget {
  const SelectedSize({super.key,});

  @override
  State<SelectedSize> createState() => _SelectedSizeState();
}

class _SelectedSizeState extends State<SelectedSize> {
  int selectedSize = 0;
  @override
  void initState() {
    super.initState();
    final sizeViewmodel = Provider.of<HomeViewModel>(context,listen: false);
    final cartViewModel = Provider.of<CartViewmodel>(context,listen: false);
    cartViewModel.selectedSize = sizeViewmodel.produtsresponse?.sizes?.first.toUpperCase();
  }
  @override
  Widget build(BuildContext context) {
    final sizeViewmodel = Provider.of<HomeViewModel>(context);
    final cartViewModel = Provider.of<CartViewmodel>(context);
    return ListView.separated(
                      separatorBuilder: (context, index) {
                        return SizedBox(width: 5,);
                      },
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: sizeViewmodel.produtsresponse?.sizes?.length ?? 0,
                      itemBuilder: (context,index){
                      final sizes = sizeViewmodel.produtsresponse?.sizes?[index];
                      return InkWell(
                        onTap: (){
                          setState(() {
                            selectedSize = index;
                            cartViewModel.selectedSize = sizes?.toUpperCase();
                            print(cartViewModel.selectedSize);
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: selectedSize == index?   Kcolors.btnColor : Colors.white,
                            border: Border.all(width: 2,color: selectedSize == index?   Colors.red : Kcolors.btnColor)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12,right: 12,),
                            child: Center(child: Text(sizes ?? "",style: getFonts(12, selectedSize == index?Colors.white : Colors.black),)),
                          ),
                                            
                        ),
                      );
                    });
  }
}