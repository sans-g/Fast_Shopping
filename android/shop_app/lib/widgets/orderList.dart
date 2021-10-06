import 'package:flutter/material.dart';
import 'package:shopapp/Provider/ordersProvider.dart';

class OrderList extends StatelessWidget {
  final OrderItems order;
  OrderList({this.order});
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text("\$${order.total}"),
              subtitle: Text(order.dateTime.toIso8601String()),

            )
          ],
        ));
  }
}
