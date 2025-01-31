import 'package:flutter/material.dart';
import 'package:untitled2/mode/prodect.dart';

class Shop extends ChangeNotifier {
  final List<Prodect> _shop = [
    Prodect(
      name: "product",
      price: 20.99,
      description: "item description",
      imagePath: 'lib/assets/potato-table.jpg',
      quantity: 1,
      id: '2',
      rating: 0.5

    ),
    Prodect(
      name: "product",
      price: 13.99,
      description: "item description",
      imagePath: 'lib/assets/fresh-organic-mint-garden.jpg',
      quantity: 1,
      id: '3',
      rating: 1

    ),
      Prodect(
      name: "product",
      price: 63.99,
      description: "item description",
      imagePath: 'lib/assets/potato-table.jpg',
      quantity: 1,
      id: '4',
      rating: 2
      
    ),
    Prodect(
      name: "product",
      price: 10.99,
      description: "item description",
      imagePath: 'lib/assets/fresh-organic-mint-garden.jpg',
      quantity: 1,
      id: '5',
      rating: 3.5

    ),
      Prodect(
      name: "product",
      price: 21.99,
      description: "item description",
      imagePath: 'lib/assets/potato-table.jpg',
      quantity: 1,
      id: '6',
      rating: 4

    ),
    Prodect(
      name: "product",
      price: 33.99,
      description: "item description",
      imagePath: 'lib/assets/fresh-organic-mint-garden.jpg',
      quantity: 1,
      id: '7',
      rating: 2.5
    ),
      Prodect(
      name: "product",
      price: 52.99,
      description: "item description",
      imagePath: 'lib/assets/potato-table.jpg',
      quantity: 1,
      id: '8',
      rating: 3.5

    ),
    Prodect(
      name: "product",
      price: 12.99,
      description: "item description",
      imagePath: 'lib/assets/fresh-organic-mint-garden.jpg',
      quantity: 1,
      id: '9',
      rating: 1.5
    ),
    // Add more products as needed
  ];

  final List<Prodect> _cart = [];

  // Getters for accessing the shop and cart items
  List<Prodect> get shop => _shop;

  List<Prodect> get cart => _cart;

  // Method to add a product to the cart



  void addToCart(Prodect product, double quantity) {
    // Check if the product already exists in the cart
    int index = cart.indexWhere((item) => item.id == product.id);

    if (index != -1) {
      // Product exists in the cart, update the quantity
      cart[index].quantity += quantity; // Increase the quantity
    } else {
      // Product does not exist in the cart, add it
      product.quantity = quantity; // Set the initial quantity
      cart.add(product);
    }

    notifyListeners(); // Notify listeners to update the UI
  }

  // Method to remove a product from the cart
  void removeFromCart(Prodect product) {
    _cart.remove(product);
    notifyListeners();
  }

  // Method to update quantity of a product in the cart
  void updateQuantity(Prodect product, double newQuantity) {
    final index = _cart.indexOf(product);
    if (index != -1) {
      _cart[index].quantity = newQuantity;
      notifyListeners();  // Trigger a rebuild of the UI
    }
  }

  // Method to clear the cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }
}
