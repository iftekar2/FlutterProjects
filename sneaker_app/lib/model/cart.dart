import 'package:flutter/material.dart';
import 'package:sneaker_app/model/shoe.dart';

class Cart extends ChangeNotifier {
  // List of Shoes for sale
  List<Shoe> shoesForSale = [
    Shoe(
      name: "Air Jordan 1",
      price: "185",
      description: "Men's Shoes",
      image: 'lib/image/Air-Jordan-1.png',
    ),

    Shoe(
      name: "Air Jordan 12",
      price: "205",
      description: "Men's Shoes",
      image: 'lib/image/AIR-JORDAN-12-RETRO.png',
    ),

    Shoe(
      name: "Nike Dunk Low N7",
      price: "135",
      description: "Men's Shoes",
      image: "lib/image/NIKE-DUNK-LOW-NN-N7.png",
    ),

    Shoe(
      name: "Nike Pegasus",
      price: "220",
      description: "Men's Shoes",
      image: "lib/image/NIKE-PEGASUS-PREMIUM-RUN.png",
    ),
  ];

  // List of Shoes in the cart
  List<Shoe> shoesInCart = [];

  // Get list of shoes for sale
  List<Shoe> getShoesForSale() {
    return shoesForSale;
  }

  // Get list of shoes in the cart
  List<Shoe> getShoesForSaleInCart() {
    return shoesInCart;
  }

  // Add a shoe to the cart
  void addShoeToCart(Shoe shoe) {
    if (!shoesInCart.contains(shoe)) {
      shoesInCart.add(shoe);
    }
    // Notify listeners to update the UI
    notifyListeners();
  }

  // Remove a shoe from the cart
  void removeShoeFromCart(Shoe shoe) {
    if (shoesInCart.contains(shoe)) {
      shoesInCart.remove(shoe);
    }
    // Notify listeners to update the UI
    notifyListeners();
  }
}
