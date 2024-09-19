class Product {
  final int id;
  final String title;
  final double price;
  final String description;
  final String image;
  final String category;
  int quantity;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.image,
    required this.category,
    this.quantity = 1,
  });

  // Factory constructor to create a Product object from JSON data
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: json['price'].toDouble(),
      description: json['description'],
      image: json['image'],
      category: json['category'],
      quantity: json.containsKey('quantity')
          ? json['quantity']
          : 1, // Handle missing quantity
    );
  }
}
