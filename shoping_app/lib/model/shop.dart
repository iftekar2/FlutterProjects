import 'package:shoping_app/model/shopping_items.dart';

class Shop {
  // Products for Sale
  final List<ShoppingItems> _products = [
    ShoppingItems(
      name: "Hoodie",
      price: 100.0,
      description: "A cozy hoodie",
      image: "library/images/Womens-Essential-Hoodie.jpg",
    ),
    ShoppingItems(
      name: "Shoe",
      price: 99.0,
      description: "A cozy Shoe",
      image: "library/images/shoes.jpg",
    ),
    ShoppingItems(
      name: "T-shirt",
      price: 100.0,
      description: "A cozy t-shirt",
      image: "library/images/t-shirt.jpg",
    ),
    ShoppingItems(
      name: "Pants",
      price: 100.0,
      description: "A cozy pants",
      image: "library/images/pants.jpg",
    ),
    ShoppingItems(
      name: "Sun glass",
      price: 100.0,
      description: "A cozy sun glass",
      image: "library/images/sunglass.jpg",
    ),
  ];

  // User Cart
  final List<ShoppingItems> _cart = [];

  // Get product list
  List<ShoppingItems> getProducts() => _products;

  // Get cart list
  List<ShoppingItems> getCart() => _cart;

  // Adding product to cart
  void addToCart(ShoppingItems product) {
    _cart.add(product);
  }

  // Remove product from cart
  void removeFromCart(ShoppingItems product) {
    _cart.remove(product);
  }
}
