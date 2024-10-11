import 'package:flutter/material.dart';

import '../models/item.dart';

class CartProvider with ChangeNotifier {
  List<Item> _itemsInCart = [];

  List<Item> get itemsInCart => _itemsInCart;

  void addItemToCart(Item item) {
    _itemsInCart.add(item);
    notifyListeners(); // Notify listeners to rebuild any widgets that depend on this data
  }

  void removeItemFromCart(Item item) {
    _itemsInCart.remove(item);
    notifyListeners();
  }

  void clearCart() {
    _itemsInCart.clear();
    notifyListeners();
  }

  double tps = 0.05;
  double tvq = 0.09975;
  double discount = 0.0;

  // Calculate subtotal
  double get subtotal => _itemsInCart.fold(0, (sum, item) => sum + item.price);

  // Calculate taxes
  double get provincialTax => subtotal * tps;
  double get federalTax => subtotal * tvq;

  // If you have tax, you can calculate the total
  double get total => subtotal - discount + (subtotal * tps) + (subtotal * tvq);
}
