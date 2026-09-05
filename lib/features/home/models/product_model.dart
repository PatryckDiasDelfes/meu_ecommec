class Product {
  final String brand;
  final String name;
  final String imageUrl;
  final String description;
  final double price;
  final String category;

  Product({
    required this.brand,
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.price,
    required this.category,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      brand: json['brand'],
      name: json['name'],
      imageUrl: json['imageUrl'],
      description: json['description'],
      price: json['price'],
      category: json['category'],
    );
  }
}
