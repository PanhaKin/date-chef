class Product {
  final String name;
  final String photo;
  final double price;
  final String uid;

  Product({
    required this.name,
    required this.photo,
    required this.price,
    required this.uid,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'] ?? '',
      photo: json['photo'] ?? '',
      price: json['price'] ?? 0.0,
      uid: json['uid'] ?? '',
    );
  }
}

class Order {
  final bool complete;
  final List<Product> products;
  final int table;
  final String uid;

  Order({
    required this.complete,
    required this.products,
    required this.table,
    required this.uid,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    List<dynamic> productsJson = json['product'];
    List<Product> products = productsJson
        .map((productJson) => Product.fromJson(productJson))
        .toList();

    return Order(
      complete: json['complete'],
      products: products,
      table: json['table'],
      uid: json['uid'],
    );
  }
}
