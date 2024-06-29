import 'package:fashion_app/Common/font.dart';
import 'package:fashion_app/Common/thems.dart';
import 'package:fashion_app/Features/Home/View/category_list.dart';
import 'package:fashion_app/extention/path_extention.dart';
import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  @override
  State<Category> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Category> {
  final List<Image> items = [
    Image.asset(
      'shirt.png'.imagePath,
    ),
    Image.asset(
      'womens.png'.imagePath,
    ),
    Image.asset(
      'tshirt.png'.imagePath,
    ),
    Image.asset(
      'watch.png'.imagePath,
    ),
    Image.asset(
      'shoes.png'.imagePath,
    ),
    Image.asset(
      'hoodies.png'.imagePath,
    ),
  ];
  final List<String> names = [
    "Shirts",
    "Pants",
    "Accessories",
    "Watches",
    "Shoes",
    "Hoodies"
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: ListView.builder(
        scrollDirection: Axis.horizontal, // Set scroll direction to horizontal
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      print(names[index]);
                      Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      CategoryPage(categories: names[index].toLowerCase())));
                    });
                  },
                  child: CircleAvatar(
                      backgroundColor: Kcolors.themeLite,
                      radius: 30,
                      child: SizedBox(
                        height: 25,
                        child: items[index],
                      ) // You can replace this with your own avatar logic
                      ),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(names[index], style: normalFonts(10, Colors.black))
              ],
            ),
          );
        },
      ),
    );
  }
}
