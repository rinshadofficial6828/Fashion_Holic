import 'package:fashion_app/Common/Shimmer%20Widget/shimmer_colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomeShimmerScreen extends StatefulWidget {
  const HomeShimmerScreen({Key? key});

  @override
  State<HomeShimmerScreen> createState() => _HomeShimmerScreenState();
}

class _HomeShimmerScreenState extends State<HomeShimmerScreen> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16,left: 16),
      child: SingleChildScrollView(
        physics:  ScrollPhysics(),
        child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50),
                  Shimmer.fromColors(
                    baseColor: baseColor,
                    highlightColor: highLightColor,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: baseColor
                      ),
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                    )
                  ),
                  SizedBox(height: 16,),
                  Shimmer.fromColors(
                    baseColor: baseColor,
                    highlightColor: highLightColor,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: baseColor
                      ),
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                    )
                  ),
                  SizedBox(height: 16,),
                  Shimmer.fromColors(
                    baseColor: baseColor,
                    highlightColor: highLightColor,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey
                      ),
                      height: 20,
                      width: 100,
                    )
                  ),
                  SizedBox(height: 20,),
                  Shimmer.fromColors(
                    baseColor: baseColor,
                    highlightColor: highLightColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: baseColor
                      ),
                      height: 50,
                      width: 50,
                    ),
                     Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: baseColor
                      ),
                      height: 50,
                      width: 50,
                    ),
                     Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: baseColor,
                      ),
                      height: 50,
                      width: 50,
                    ),
                     Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: baseColor
                      ),
                      height: 50,
                      width: 50,
                    )
                      ],
                    )
                  ),
                  SizedBox(height: 20,),
                    Shimmer.fromColors(
                    baseColor:baseColor,
                    highlightColor: highLightColor,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: baseColor
                      ),
                      height: 20,
                      width: 100,
                    )
                  ),
                  SizedBox(height: 12,),
                  
                  SizedBox(height: 16,),
                  //!the shimmer grid(future modification)
                 GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  shrinkWrap: true,
            crossAxisCount: 2,
            children: List.generate(
              4,
              (index) => Shimmer.fromColors(
                baseColor: baseColor,
                highlightColor: highLightColor,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: baseColor,
                  ),
                  height: 20,
                  width: 50,
                ),
              ),
            ),
                )
                ],
              ),
      ),
    );
  }
}

shimmerGrid(){
  return GridView.count(
              physics: NeverScrollableScrollPhysics(),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              shrinkWrap: true,
        crossAxisCount: 2,
        children: List.generate(
          4,
          (index) => Shimmer.fromColors(
            baseColor: Colors.grey,
            highlightColor: Colors.grey.shade600,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey,
              ),
              height: 20,
              width: 50,
            ),
          ),
        ),
            );
}

shimmerListItemsHome(){
  return Shimmer.fromColors(
                baseColor: Colors.grey,
                highlightColor: Colors.grey.shade600,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.grey
                  ),
                  height: 30,
                  width: 60,
                ),
                 Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.grey
                  ),
                  height: 30,
                  width: 60,
                ),
                 Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.grey
                  ),
                  height: 30,
                  width: 60,
                ),
                 Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.grey
                  ),
                  height: 30,
                  width: 60,
                )
                  ],
                )
              );
}
