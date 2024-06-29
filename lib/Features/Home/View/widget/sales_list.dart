import 'package:fashion_app/Common/font.dart';
import 'package:fashion_app/Common/thems.dart';
import 'package:fashion_app/Custom/loading.dart';
import 'package:fashion_app/Features/Cart/Viewmodel/cart_view_model.dart';
import 'package:fashion_app/Features/Home/View/widget/grid_views.dart';
import 'package:fashion_app/Features/Home/View/widget/top_pick_up_list.dart';
import 'package:fashion_app/Features/Home/ViewModel/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CurrentSalesList extends StatefulWidget {
  const CurrentSalesList({Key? key}) : super(key: key);

  @override
  State<CurrentSalesList> createState() => _CurrentSalesListState();
}

class _CurrentSalesListState extends State<CurrentSalesList> {
  int selectedIdx = -1;
  bool tapped = true;
  @override
  void initState() {
    super.initState();
    
  }
  
  @override
  Widget build(BuildContext context) {
    final salesViewModel = Provider.of<HomeViewModel>(context,listen: true);
    final cartViewmodel = Provider.of<CartViewmodel>(context,listen: true);
    return Column(
      children: [
        Container(
          height: 40,
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    salesViewModel.results.clear();
                     tapped = true;
                     selectedIdx = -1;
                   salesViewModel.currentPage = 1;
                   salesViewModel.results.clear();
                   salesViewModel.fetchProducts();
                   salesViewModel.fetchProductsFirstPage();
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Container(
                    decoration: BoxDecoration(
                      color: tapped ? Kcolors.btnColor : Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(width: 0.5, color: Colors.black),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Center(
                        child: Text(salesViewModel.sales[0], style: getFonts(10,tapped ? Colors.white : Colors.black)),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.separated(
                  itemCount:salesViewModel.sales.length - 1, // Exclude the fixed item
                  separatorBuilder: (context, index) {
                    return SizedBox(width: 12);
                  },
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: (){
                        setState(() {
                          setState(() {
                          selectedIdx = index;
                          switch(index){
                            case 0:
                            salesViewModel.currentPage = 1;
                            salesViewModel.onlyOne.clear();
                            salesViewModel.results.clear();
                            salesViewModel.fetchProductByGender(gender: 'men');   
                            break;
                            case 1: 
                            salesViewModel.currentPage = 1;
                            salesViewModel.onlyOne.clear();
                            salesViewModel.results.clear();
                            salesViewModel.fetchProductByGender(gender: 'women');
                            break;
                            default :
                            salesViewModel.currentPage = 1;
                            salesViewModel.onlyOne.clear();
                            salesViewModel.results.clear();
                                                  }
                          tapped = false;
                        });
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: selectedIdx == index ? Kcolors.btnColor: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(width: 0.5, color: Colors.black),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Center(
                            child: Text(salesViewModel.sales[index + 1], style: getFonts(10, selectedIdx == index ? Colors.white : Colors.black)),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
       //!grid
        SizedBox(height: 12,),
        salesViewModel.results.isNotEmpty ?
        selectedIdx == -1?
        Column(children: [
          salesViewModel.results.isNotEmpty && salesViewModel.onlyOne.isNotEmpty ?
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15,),
              GidItemsWidget( products: salesViewModel.onlyOne),
              Text(
                            "Top Pickup for you",
                            style: getFonts(15, Colors.black),
                          ),
                           SizedBox(height: 12,),
              Container(
                // color: Kcolors.btnColor,
                height: MediaQuery.of(context).size.width *.6,
              child: TopPickUpList(products: salesViewModel.results,),
              ),
              SizedBox(height: 12,),
              GidItemsWidget( products: salesViewModel.results),
            ],
          ) :
        Text("No product Found"),
        
        ],) :
        GidItemsWidget( products: salesViewModel.results) :
        Text("No product Found"),
         salesViewModel.isLoading ? 
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Center(child: spinKits(colors: Kcolors.btnColor)),
                          ):SizedBox()
      ],
    );
  }
}

