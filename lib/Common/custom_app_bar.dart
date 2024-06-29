import 'package:fashion_app/Common/font.dart';
import 'package:fashion_app/Common/thems.dart';
import 'package:fashion_app/Features/Home/ViewModel/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

 customAppBarAuth (BuildContext context,bool needText,String text) {
  return AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor:Kcolors.bgColor,
        toolbarHeight: 50,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsets.only(left:2),
          child: Row(
            children: [
              InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Kcolors.bgColor,
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey
                      )
                    ]
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Icon(Icons.arrow_back_ios_new,color: Colors.black,),
                  ),
                ),
              ),
              SizedBox(width: 12,),
              needText?
              Text(text,style: getFonts(17, Colors.black),):SizedBox()
            ],
          ),
        ),
      );
}

appBarcategory (BuildContext context,String text,VoidCallback ontap) {
  return AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor:Kcolors.bgColor,
        toolbarHeight: 50,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsets.only(left:2),
          child: Row(
            children: [
              InkWell(
                onTap: ontap,
                child: Container(
                  decoration: BoxDecoration(
                    color: Kcolors.bgColor,
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey
                      )
                    ]
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Icon(Icons.arrow_back_ios_new,color: Colors.black,),
                  ),
                ),
              ),
              SizedBox(width: 12,),
              Text(text,style: getFonts(17, Colors.black),)           ],
          ),
        ),
      );
}

normalAppBar (BuildContext context,String text,) {
  return AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor:Kcolors.bgColor,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsets.only(left:2),
          child: Text(text,style: getFonts(17, Colors.black),),
        ),
      );
}

productDetailsAppBar (BuildContext context,String text, VoidCallback onTap) {
  final homeViewModel = Provider.of<HomeViewModel>(context,listen: false);
  return AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor:Kcolors.bgColor,
        toolbarHeight: 50,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsets.only(left:2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Kcolors.bgColor,
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey
                      )
                    ]
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Icon(Icons.arrow_back_ios_new,color: Colors.black,),
                  ),
                ),
              ),
              Text(text,style: getFonts(17, Colors.black),),
               CircleAvatar(
                         backgroundColor: Colors.white,
                         maxRadius: 17,
                         child: InkWell(
                          onTap: onTap,
                           child: homeViewModel.produtsresponse?.isWishlisted ==true ? Icon(
                             Icons.favorite,
                             color:  Colors.red,
                             size: 30, // Adjust the size of the heart icon as needed
                           ):Icon(Icons.favorite_border_sharp,size: 30,),
                         )
                       ),
            ],
          ),
        ),
      );
}

