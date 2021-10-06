import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/Provider/Cart.dart';
import 'package:shopapp/Provider/ordersProvider.dart';
import 'package:shopapp/screens/OrderNowScreen.dart';
import 'package:shopapp/widgets/CartList.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cartScreen';
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final orderNow = Provider.of<Orders>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Cart"),
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  Spacer(),
                  Chip(
                    label: Text(cart.totalAmount.toString()),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  FlatButton(
                      child: Text("Order now"),
                      onPressed: () {
                        Navigator.pushNamed(
                            (context), OrderNowscreen.routename);
                        orderNow.addOrders(
                            cart.items.values.toList(), cart.totalAmount);
                        cart.clear();
                      },
                      textColor: Theme.of(context).accentColor)
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: cart.items.length,
                itemBuilder: (context, i) => CartList(
                      productId: cart.items.keys.toList()[i],
                      title: cart.items.values.toList()[i].title,
                      price: cart.items.values.toList()[i].price,
                      id: cart.items.values.toList()[i].id,
                      quantity: cart.items.values.toList()[i].quantity,
                    )),
          )
        ],
      ),
    );
  }
}
