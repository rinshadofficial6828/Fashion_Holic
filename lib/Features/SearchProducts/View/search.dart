import 'package:fashion_app/Common/custom_app_bar.dart';
import 'package:fashion_app/Common/text_field_decoration.dart';
import 'package:fashion_app/Common/thems.dart';
import 'package:fashion_app/Features/SearchProducts/View/widgets/filter_bottomsheet.dart';
import 'package:fashion_app/Features/SearchProducts/View/widgets/search_grid.dart';
import 'package:fashion_app/Features/SearchProducts/Viewmodel/search_view_model.dart';
import 'package:fashion_app/extention/path_extention.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchControllers = TextEditingController(); 
  @override
  void initState() {
    super.initState();
    final searchViewmodel =
        Provider.of<Searchviewmodel>(context, listen: false);
        searchViewmodel.searchedproducts.clear();
                          searchViewmodel.filteredProducts.clear();
                          searchViewmodel.currentPage = 1;
    searchViewmodel.getSearchResults(searchProducts: '');
    searchViewmodel.filterResults(product: '');
    searchViewmodel.scrollController
        .addListener(searchViewmodel.scrollListners);
  }

  @override
  Widget build(BuildContext context) {
    final searchViewmodel = Provider.of<Searchviewmodel>(context);
    return Scaffold(
      appBar: customAppBarAuth(context, true, "search or filter to get products"),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        controller: searchViewmodel.scrollController,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: SizedBox(
               height: 50,
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: searchControllers,
                        onChanged: (value) async {
                          searchViewmodel.search = value;
                          searchViewmodel.searchedproducts.clear();
                          searchViewmodel.filteredProducts.clear();
                          searchViewmodel.currentPage = 1;
                          searchViewmodel.getSearchResults(searchProducts: value);
                        },
                        decoration: searchField(Icon(Icons.search), "Search"),
                      ),
                    ),
                    SizedBox(
                                    width: 4,
                                  ),
                                  InkWell(
                                    onTap: (){
                                     filterBottomsheet(context);
                                    },
                                    child: Container(
                                        decoration: BoxDecoration(
                                            color: Kcolors.btnColor,
                                            borderRadius: BorderRadius.circular(5)),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10,
                                              bottom: 10,
                                              left: 10,
                                              right: 10),
                                          child: Icon(
                                            Icons.filter_alt,
                                            color: Colors.white,
                                          ),
                                        )),
                                  )
                  ],
                ),
              ),
            ),
          SizedBox(height: 20,),
          searchControllers.text.isEmpty && searchViewmodel.filteredProducts.isEmpty && searchViewmodel.searchedproducts.isEmpty ?
          Center(
            child: Text("Please search or filter  to get product"),
          ):
           searchViewmodel.filteredProducts.isNotEmpty && searchViewmodel.searchedproducts.isEmpty ?
           Container(
                    margin: EdgeInsets.only(left: 15, right: 15),
                    child: GridSearchItems(
                        products: searchViewmodel.filteredProducts)):
            searchControllers.text.isNotEmpty  && searchViewmodel.searchedproducts.isEmpty ?
          Padding(padding: EdgeInsets.only(top: 200),
          child: Image.asset('searchEmpty.png'.imagePath,height: 100,width: 300,),
          ) :
             Container(
                    margin: EdgeInsets.only(left: 15, right: 15),
                    child: GridSearchItems(
                        products: searchViewmodel.searchedproducts)),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}



