import 'package:fashion_app/Common/Shimmer%20Widget/shimmer_colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CartShimmer extends StatelessWidget {
  const CartShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16,right: 16),
      child: Column(children: [
          SizedBox(height: 30,),
          ListView.separated(
            separatorBuilder: (context,index){
              return SizedBox(height: 12,);
            },
            shrinkWrap: true,
            itemCount: 9,
            itemBuilder: (context,index) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                 boxShadow: [
                  BoxShadow(color: baseColor,spreadRadius: 0.5,blurRadius: 1),
                 ],
                  borderRadius: BorderRadius.circular(12),
                ),
                height: 100,
                width: MediaQuery.of(context).size.width,
                child: Padding(padding: EdgeInsets.only(left: 12,right: 12,top: 10,bottom: 10),
                child: Row(children: [
                  Shimmer.fromColors(
                    baseColor: baseColor,
              highlightColor: highLightColor,
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                         color: baseColor,
                        borderRadius: BorderRadius.circular(8)
                      ),
                    ),
                  ),SizedBox(width: 17,),
                  Column(
                    children: [
                      SizedBox(height: 4,),
                      SizedBox(
                        height: MediaQuery.of(context).size.height *.08,
                        width: MediaQuery.of(context).size.width *0.6,
                        child: ListView.separated(
                          separatorBuilder: (context,index){
                            return SizedBox(height: 6,) ;
                          },
                          shrinkWrap: true,
                          itemCount: 4,
                          itemBuilder: (context,index){
                          return textShimmer(context: context);
                        }),
                      ),
                    ],
                  ),
                ],) ,
                ),
              );
            }
          ),
        ],),
    );
  }
}

textShimmer({required BuildContext context}){
  return Shimmer.fromColors(
                baseColor: baseColor,
          highlightColor: highLightColor,
                child: Container(
                  height: 10,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                     color:baseColor,
                    borderRadius: BorderRadius.circular(3)
                  ),
                ),
              );
}