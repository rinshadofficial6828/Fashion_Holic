import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:fashion_app/Common/thems.dart';
import 'package:fashion_app/Offers/View/offersPage.dart';
import 'package:flutter/material.dart';
class CaroselSliderPage extends StatefulWidget {
  const CaroselSliderPage({super.key});

  @override
  State<CaroselSliderPage> createState() => _CaroselSliderPageState();
}

class _CaroselSliderPageState extends State<CaroselSliderPage> {
  final items = [
    Image.asset('assets/images/c1.jpg',fit: BoxFit.fill,),
    Image.asset('assets/images/c2.jpg',fit: BoxFit.fill,),
    Image.asset('assets/images/c3.jpg',fit: BoxFit.fill,),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> CaroselOffersScreen()));
        },
        child: Container(
          height: 160,
          width: MediaQuery.of(context).size.width,
          child: CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    aspectRatio: 2.0,
                    enlargeCenterPage: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                      currentIndex = index;
                      });
                    },
                  ),
                  items: items,
                ),
        ),
      ),
      SizedBox(height: 5,),
            DotsIndicator(
              decorator: DotsDecorator(activeColor: Kcolors.btnColor),
              dotsCount: items.length,
              position: currentIndex,
            )
    ],);
  }
}
