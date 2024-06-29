class WishlistResponseModel {
  List<WishlistItems>? wishlistItems;
  int? next;
  int? previous;

  WishlistResponseModel({this.wishlistItems, this.next, this.previous});

  WishlistResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['wishlist_items'] != null) {
      wishlistItems = <WishlistItems>[];
      json['wishlist_items'].forEach((v) {
        wishlistItems!.add(new WishlistItems.fromJson(v));
      });
    }
    next = json['next'];
    previous = json['previous'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.wishlistItems != null) {
      data['wishlist_items'] =
          this.wishlistItems!.map((v) => v.toJson()).toList();
    }
    data['next'] = this.next;
    data['previous'] = this.previous;
    return data;
  }
}

class WishlistItems {
  int? id;
  int? user;
  int? product;
  String? productName;
  String? productImage;
  bool? isWishlisted;

  WishlistItems(
      {this.id,
      this.user,
      this.product,
      this.productName,
      this.productImage,
      this.isWishlisted});

  WishlistItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'];
    product = json['product'];
    productName = json['product_name'];
    productImage = json['product_image'];
    isWishlisted = json['is_wishlisted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user'] = this.user;
    data['product'] = this.product;
    data['product_name'] = this.productName;
    data['product_image'] = this.productImage;
    data['is_wishlisted'] = this.isWishlisted;
    return data;
  }
}
