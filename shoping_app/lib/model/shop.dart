import 'package:flutter/material.dart';
import 'package:shoping_app/model/product.dart';

class Shop extends ChangeNotifier {
  // Products for Sale
  final List<Product> _shop = [
    Product(
      name: "Hoodie",
      price: 100.0,
      description: "A cozy hoodie",
      image: "lib/images/Womens-Essential-Hoodie.jpg",
    ),
    Product(
      name: "Shoe",
      price: 99.0,
      description: "A cozy Shoe",
      image: "lib/images/shoes.jpg",
    ),
    Product(
      name: "T-shirt",
      price: 100.0,
      description: "A cozy t-shirt",
      image: "lib/images/t-shirt.jpg",
    ),
    Product(
      name: "Pants",
      price: 100.0,
      description: "A cozy pants",
      image: "lib/images/pants.jpg",
    ),
    Product(
      name: "Sun glass",
      price: 100.0,
      description: "A cozy sun glass",
      image: "lib/images/sunglass.jpg",
    ),
  ];

  // User Cart
  final List<Product> _cart = [];

  // Get product list
  List<Product> getProducts() => _shop;

  // Get cart list
  List<Product> getCart() => _cart;

  // Adding product to cart
  void addToCart(Product product) {
    _cart.add(product);
    notifyListeners();
  }

  // Remove product from cart
  void removeFromCart(Product product) {
    _cart.remove(product);
    notifyListeners();
  }
}
