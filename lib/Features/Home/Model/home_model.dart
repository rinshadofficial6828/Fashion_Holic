class ProductsResponseModel {
  int? count;
  dynamic next;
  dynamic previous;
  List<Results>? results;

  ProductsResponseModel({this.count, this.next, this.previous, this.results});

  ProductsResponseModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['next'] = this.next;
    data['previous'] = this.previous;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  int? id;
  String? productName;
  String? description;
  String? gender;
  String? category;
  String? price;
  String? offerPrice;
  String? color;
  bool? isWishlisted;
  List<String>? productImages;
  List<String>? sizes;

  Results(
      {this.id,
      this.productName,
      this.description,
      this.gender,
      this.category,
      this.price,
      this.offerPrice,
      this.color,
      this.isWishlisted,
      this.productImages,
      this.sizes});

  Results.fromJson(Map<String, dynamic> json) {
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
}
