import 'package:flutter/material.dart';
import 'package:shopapp/Provider/Cart.dart';

class OrderItems {
  String id;
  List<CartItem> products;
  double total;
  DateTime dateTime;
  OrderItems({this.id, this.total, this.products, this.dateTime});
}

class Orders with ChangeNotifier {
  List<OrderItems> _orders = [];
  List<OrderItems> get orders {
    return [..._orders];
  }

  void addOrders(List<CartItem> cartproducts, double total) {
    _orders.insert(
        0,
        OrderItems(
            id: DateTime.now().toIso8601String(),
            total: total,
            dateTime: DateTime.now(),
            products: cartproducts));
    notifyListeners();
  }
}
