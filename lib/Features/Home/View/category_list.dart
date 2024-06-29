import 'package:fashion_app/Common/custom_app_bar.dart';
import 'package:fashion_app/Common/thems.dart';
import 'package:fashion_app/Features/Home/View/widget/grid_views.dart';
import 'package:fashion_app/Features/Home/ViewModel/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatefulWidget {
  final String categories;

  const CategoryPage({Key? key, required this.categories}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {

  @override
  void initState() {
    super.initState();
    final categoryViewModel = Provider.of<HomeViewModel>(context, listen: false);
    categoryViewModel.getCategory(categories: widget.categories);
    categoryViewModel.scrollController1.addListener(scrollListener);
  }

  void scrollListener() {
    final categoryViewModel = Provider.of<HomeViewModel>(context, listen: false);
    if (categoryViewModel.scrollController1.position.pixels ==
            categoryViewModel.scrollController1.position.maxScrollExtent &&
        !categoryViewModel.isCategoryloading) {
      categoryViewModel.categoryPage++;
      categoryViewModel.getCategory(categories: widget.categories);
    }
  }

  @override
  Widget build(BuildContext context) {
    final categoryViewModel = Provider.of<HomeViewModel>(context,);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarcategory(context, widget.categories, () { 
      categoryViewModel.categoryList.clear();
      categoryViewModel.categoryPage = 1;
      Navigator.pop(context);
      }),
      body: PopScope(
        onPopInvoked: (didPop) {
          categoryViewModel.categoryList.clear();
      categoryViewModel.categoryPage = 1;
        },
        child: RefreshIndicator(
          color: Colors.white,
          backgroundColor: Kcolors.btnColor,
          onRefresh: () async {
            await Future.delayed(Duration(milliseconds: 1200));
            categoryViewModel.getCategory(categories: "");
          },
          child:
              SingleChildScrollView(
                controller: categoryViewModel.scrollController1,
                physics: AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(height: 30),
                    categoryViewModel.categoryList.isEmpty
                        ? Center(child: Text("No Data"))
                        : Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: GidItemsWidget(products: categoryViewModel.categoryList,),
                          ),
                    SizedBox(height: 20),
                  ],
                ),
              )
        ),
      ),
    );
  }
}
