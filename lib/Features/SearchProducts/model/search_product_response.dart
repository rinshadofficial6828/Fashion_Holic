class searchProductResponse {
  List<SearchResults>? results;
  int? count;
  dynamic nextPage;
  dynamic previousPage;

  searchProductResponse({this.results, this.count, this.nextPage, this.previousPage});

  searchProductResponse.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <SearchResults>[];
      json['results'].forEach((v) {
        results!.add(new SearchResults.fromJson(v));
      });
    }
    count = json['count'];
    nextPage = json['next_page'];
    previousPage = json['previous_page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    data['count'] = this.count;
    data['next_page'] = this.nextPage;
    data['previous_page'] = this.previousPage;
    return data;
  }
}

class SearchResults {
  dynamic id;
  dynamic productName;
  dynamic description;
  dynamic gender;
  dynamic category;
  dynamic price;
  dynamic offerPrice;
  dynamic color;
  dynamic isWishlisted;
  List<String>? productImages;
  List<String>? sizes;

  SearchResults({
    this.id,
    this.productName,
    this.description,
    this.gender,
    this.category,
    this.price,
    this.offerPrice,
    this.color,
    this.isWishlisted,
    this.productImages,
    this.sizes,
  });

  SearchResults.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productName = json['Product_Name'];
    description = json['Description'];
    gender = json['Gender'];
    category = json['Category'];
    price = json['Price'];
    offerPrice = json['Offer_Price'];
    color = json['Color'];
    isWishlisted = json['is_wishlisted'];
    productImages = json['product_images'].cast<String>();
    sizes = json['sizes'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Product_Name'] = this.productName;
    data['Description'] = this.description;
    data['Gender'] = this.gender;
    data['Category'] = this.category;
    data['Price'] = this.price;
    data['Offer_Price'] = this.offerPrice;
    data['Color'] = this.color;
    data['is_wishlisted'] = this.isWishlisted;
    data['product_images'] = this.productImages;
    data['sizes'] = this.sizes;
    return data;
  }

  @override
  String toString() {
    return 'SearchResults(id: $id, productName: $productName, description: $description, gender: $gender, category: $category, price: $price, offerPrice: $offerPrice, color: $color, isWishlisted: $isWishlisted, productImages: $productImages, sizes: $sizes)';
  }
}