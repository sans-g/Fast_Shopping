import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/Provider/Cart.dart';
import 'package:shopapp/Provider/ordersProvider.dart';
import 'package:shopapp/Provider/products_provider.dart';
import 'package:shopapp/screens/Edit&AddingScreen.dart';
import 'package:shopapp/screens/OrderNowScreen.dart';
import 'package:shopapp/screens/ProductDetailScreen.dart';
import 'package:shopapp/screens/ProductsOverviewScreen.dart';
import 'package:shopapp/screens/UserProductScreen.dart';
import 'package:shopapp/screens/cartScreen.dart';
import 'package:shopapp/widgets/appDrawer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Products(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (context) => Orders(),
        )
      ],
      child: MaterialApp(
          routes: {
            ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
            CartScreen.routeName: (context) => CartScreen(),
            OrderNowscreen.routename: (context) => OrderNowscreen(),
            AppDrawer.routename:(context)=>AppDrawer(),
            UserProductScreen.routename:(context)=>UserProductScreen(),
            EditProductScreen.routename:(context)=>EditProductScreen()
          },
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              primarySwatch: Colors.deepPurple, accentColor: Colors.redAccent),
          home: ProductsOverviewScreen()),
    );
  }
}
