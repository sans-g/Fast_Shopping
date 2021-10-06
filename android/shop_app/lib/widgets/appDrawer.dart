import 'package:flutter/material.dart';
import 'package:shopapp/screens/OrderNowScreen.dart';
import 'package:shopapp/screens/ProductDetailScreen.dart';
import 'package:shopapp/screens/ProductsOverviewScreen.dart';
import 'package:shopapp/screens/UserProductScreen.dart';
import 'package:shopapp/screens/cartScreen.dart';

class AppDrawer extends StatelessWidget {
  static const routename = "/AppDrawer";
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text("Hello Friends"),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            title: Text("Shop"),
            leading: Icon(Icons.shop),
            onTap: () {
              Navigator.of(context).pushNamed("/");
            },
          ),
          Divider(),
          ListTile(
            title: Text("Orders"),
            leading: Icon(Icons.payment),
            onTap: () {
              Navigator.of(context).pushNamed(OrderNowscreen.routename);
            },
          ),
          Divider(),
          ListTile(
            title: Text("Manage Orders"),
            leading: Icon(Icons.edit),
            onTap: () {
              Navigator.of(context).pushNamed(UserProductScreen.routename);
            },
          )
        ],
      ),
    );
  }
}
