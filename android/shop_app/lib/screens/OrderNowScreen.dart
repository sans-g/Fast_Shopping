import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/Provider/ordersProvider.dart';
import 'package:shopapp/widgets/orderList.dart';

class OrderNowscreen extends StatelessWidget {
  @override
  static const routename = "/OrderNowScreen";
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("ORDERS"),
      ),
      body: ListView.builder(
          itemCount: orderData.orders.length,
          itemBuilder: (context,i) => OrderList( order: orderData.orders[i],)),
    );
  }
}
