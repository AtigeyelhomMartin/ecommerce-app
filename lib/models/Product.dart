class Product {
  String id;
  String name;
  double price;
  int quantity;
  String image;

  // Constructor
  Product({required this.id, required this.name, required this.price, required this.quantity, required this.image});

  // Factory method to create a Product instance from a map
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      price: json['price'].toDouble(),
      quantity: json['quantity'],
      image: json['image'], // Add this line
    );
  }

  // Convert the Product instance to a map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'quantity': quantity,
      'image': image, // Add this line
    };
  }
}
