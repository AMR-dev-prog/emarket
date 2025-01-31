class Prodect {
  String name;
  double price;
  final String id;
  String description;
  String imagePath;
  double quantity; 
  double rating; // Added quantity property

  Prodect({
    required this.name,
    required this.id,
    required this.price,
    required this.description,
    required this.imagePath,
    required this.rating,
    this.quantity = 1.0,  // Default quantity to 1
  });
  
  double get totalPrice => price * quantity;
}