class AddToCart {
  int? id;
  int? userId;
  int? product;
  int? quantity;
  List<String>? productImages;
  String? selectedSize;
  dynamic price;
  dynamic totalPrice;

  AddToCart(
      {this.id,
      this.userId,
      this.product,
      this.quantity,
      this.productImages,
      this.selectedSize,
      this.price,
      this.totalPrice});

  AddToCart.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    product = json['product'];
    quantity = json['quantity'];
    productImages = json['product_images'].cast<String>();
    selectedSize = json['selected_size'];
    price = json['price'];
    totalPrice = json['total_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['product'] = this.product;
    data['quantity'] = this.quantity;
    data['product_images'] = this.productImages;
    data['selected_size'] = this.selectedSize;
    data['price'] = this.price;
    data['total_price'] = this.totalPrice;
    return data;
  }
}
