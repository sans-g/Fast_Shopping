import 'package:cart/models/cartmodel.dart';
import 'package:cart/models/catalogmodel.dart';
import 'package:cart/screens/cart.dart';
import 'package:cart/screens/catalog.dart';
import 'package:cart/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(MyApp());

}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        // In this sample app, CatalogModel never changes, so a simple Provider
        // is sufficient.
        Provider(create: (context) => CatalogModel()),
        // CartModel is implemented as a ChangeNotifier, which calls for the use
        // of ChangeNotifierProvider. Moreover, CartModel depends
        // on CatalogModel, so a ProxyProvider is needed.
        ChangeNotifierProxyProvider<CatalogModel, CartModel>(
          create: (context) => CartModel(),
          update: (context, catalog, cart) {
            cart.catalog = catalog;
            return cart;
          },
        ),
      ],
      child: MaterialApp(
        title: 'Provider Demo',

        initialRoute: '/',
        routes: {
          '/': (context) => Login(),
          '/catalog': (context) => Catalog(),
          '/cart': (context) => Cart(),
        },
      ),
    );
  }
}
