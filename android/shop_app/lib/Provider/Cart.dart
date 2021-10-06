import 'package:flutter/cupertino.dart';

class CartItem {
  String id;
  String title;
  double price;
  int quantity;
  String description;

  CartItem({this.id, this.title, this.price, this.quantity, this.description});
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};
  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items == null ? 0 : _items.length;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void addItem(String productId, String title, double price, int quantity) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (existingCartItem) => CartItem(
                title: existingCartItem.title,
                price: existingCartItem.price,
                id: existingCartItem.id,
                quantity: existingCartItem.quantity + 1,
              ));
    } else {
      _items.putIfAbsent(
          productId,
          () => CartItem(
                id: DateTime.now().toIso8601String(),
                price: price,
                title: title,
                quantity: 1,
              ));
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void removeSingleItem(String productId) {
    if (!_items.containsKey(productId)) {
      return;
    }
    if (_items[productId].quantity > 1) {
      _items.update(
          productId,
          (existingCartItem) => CartItem(
              title: existingCartItem.title,
              price: existingCartItem.price,
              id: existingCartItem.id,
              quantity: existingCartItem.quantity - 1));
    }else{
      _items.remove(productId);
    }
    notifyListeners();
  }
  void clear(){
   _items={};
   notifyListeners();
  }
}
