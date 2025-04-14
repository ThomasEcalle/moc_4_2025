final class Product {
  final int? id;
  final String? title;
  final double? price;

  const Product({
    this.id,
    this.title,
    this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int?,
      title: json['title'] as String?,
      price: json['price'] as double?,
    );
  }
}
