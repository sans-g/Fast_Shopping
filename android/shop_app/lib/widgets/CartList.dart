import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/Provider/Cart.dart';

// ignore: must_be_immutable
class CartList extends StatelessWidget {
  String title;
  String productId;
  double price;
  String id;
  int quantity;
  CartList({this.id, this.productId, this.title, this.quantity, this.price});
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(productId),
      background: Container(
        color: Theme.of(context).errorColor,
        child: Align(
          child: Icon(
            Icons.delete,
            size: 40,
          ),
          alignment: Alignment.centerRight,
        ),
        margin: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(productId);
      },
      confirmDismiss: (direction) {
        return showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
                  title: Text("Are you sure?"),
                  content: Text("Do you want to delete it"),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("No"),
                      onPressed: () {
                        Navigator.of(ctx).pop(false);
                      },
                    ),
                    FlatButton(
                      child: Text("Yes"),
                      onPressed: () {
                        Navigator.of(ctx).pop(true);
                      },
                    )
                  ],
                ));
      },
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
        child: ListTile(
          leading: CircleAvatar(
            child: FittedBox(child: Text("\$$price")),
          ),
          title: Text(title),
          subtitle: Text("Total:\$${quantity * price}"),
          trailing: Text("$quantity x"),
        ),
      ),
    );
  }
}
