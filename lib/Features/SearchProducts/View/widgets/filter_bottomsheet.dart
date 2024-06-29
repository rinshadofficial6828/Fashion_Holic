import 'package:fashion_app/Features/SearchProducts/Viewmodel/search_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void filterBottomsheet(BuildContext context,) {
  final filterProductViewmodel = Provider.of<Searchviewmodel>(context, listen: false);
  List<String> categories = ['Men', 'Women', 'Girl', 'Boy'];
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              title: Text('Sort by:'),
            ),
            ListTile(
              leading: Icon(Icons.arrow_upward),
              title: Text('Ascending'),
              onTap: () {
                filterProductViewmodel.filteredProducts.clear();
                filterProductViewmodel.searchedproducts.clear();
                filterProductViewmodel.currentPage  = 1;
                filterProductViewmodel.filterResults(product: 'ascending');
                filterProductViewmodel.filterType = 'ascending';
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.arrow_downward),
              title: Text('Descending'),
              onTap: () {
                filterProductViewmodel.filteredProducts.clear();
                filterProductViewmodel.searchedproducts.clear();
                filterProductViewmodel.currentPage  = 1;
                filterProductViewmodel.filterResults(product: 'descending');
                filterProductViewmodel.filterType = 'descending';
                Navigator.pop(context);
              },
            ),
            Divider(),
            Text(
              'Category:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: categories.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(categories[index]),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      );
    },
  );
}
