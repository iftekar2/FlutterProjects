import 'package:flutter/material.dart';
import 'package:shoping_app/model/product.dart';

class Shop extends ChangeNotifier {
  // Products for Sale
  final List<Product> _products = [
    Product(
      name: "Hoodie",
      price: 100.0,
      description: "A cozy hoodie",
      image: "library/images/Womens-Essential-Hoodie.jpg",
    ),
    Product(
      name: "Shoe",
      price: 99.0,
      description: "A cozy Shoe",
      image: "library/images/shoes.jpg",
    ),
    Product(
      name: "T-shirt",
      price: 100.0,
      description: "A cozy t-shirt",
      image: "library/images/t-shirt.jpg",
    ),
    Product(
      name: "Pants",
      price: 100.0,
      description: "A cozy pants",
      image: "library/images/pants.jpg",
    ),
    Product(
      name: "Sun glass",
      price: 100.0,
      description: "A cozy sun glass",
      image: "library/images/sunglass.jpg",
    ),
  ];

  // User Cart
  final List<Product> _cart = [];

  // Get product list
  List<Product> getProducts() => _products;

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
