class CartResponse {
  String? message;
  List<CartItems>? cartItems;
  dynamic totalCartPrice;

  CartResponse({this.message, this.cartItems, this.totalCartPrice});

  CartResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['cart_items'] != null) {
      cartItems = <CartItems>[];
      json['cart_items'].forEach((v) {
        cartItems!.add(new CartItems.fromJson(v));
      });
    }
    totalCartPrice = json['total_cart_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.cartItems != null) {
      data['cart_items'] = this.cartItems!.map((v) => v.toJson()).toList();
    }
    data['total_cart_price'] = this.totalCartPrice;
    return data;
  }
}

class CartItems {
  int? id;
  dynamic productId;
  int? userId;
  String? productName;
  int? quantity;
  List<String>? productImages;
  String? selectedSize;
  dynamic price;
  dynamic totalPrice;

  CartItems(
      {this.id,
      this.productId,
      this.userId,
      this.productName,
      this.quantity,
      this.productImages,
      this.selectedSize,
      this.price,
      this.totalPrice});

  CartItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    userId = json['user_id'];
    productName = json['product_name'];
    quantity = json['quantity'];
    productImages = json['product_images'].cast<String>();
    selectedSize = json['selected_size'];
    price = json['price'];
    totalPrice = json['total_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.id;
    data['user_id'] = this.userId;
    data['product_name'] = this.productName;
    data['quantity'] = this.quantity;
    data['product_images'] = this.productImages;
    data['selected_size'] = this.selectedSize;
    data['price'] = this.price;
    data['total_price'] = this.totalPrice;
    return data;
  }
}
