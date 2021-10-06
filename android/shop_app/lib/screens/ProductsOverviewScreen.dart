import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/Provider/Cart.dart';
import 'package:shopapp/screens/cartScreen.dart';
import 'package:shopapp/widgets/appDrawer.dart';
import 'package:shopapp/widgets/badge.dart';
import '../widgets/ProductGrid.dart';
import '../screens/cartScreen.dart';

enum FilterOptions { Favourites, All }

class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

var _showOnlyFavourites = false;

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(drawer: AppDrawer(),
        appBar: AppBar(


          title: Text("Products"),
          actions: <Widget>[
            PopupMenuButton(
                onSelected: (FilterOptions selectedValue) {
                  setState(() {
                    if (selectedValue == FilterOptions.Favourites) {
                      _showOnlyFavourites = true;
                    } else {
                      _showOnlyFavourites = false;
                    }
                  });
                },
                itemBuilder: (_) => [
                      PopupMenuItem(
                        child: Text("Only Favourites"),
                        value: FilterOptions.Favourites,
                      ),
                      PopupMenuItem(
                        child: Text("Show All"),
                        value: FilterOptions.All,
                      )
                    ]),
            Consumer<Cart>(
                builder: (context, cart, ch) => Badge(
                      child: ch,
                      value: cart.itemCount.toString(),
                    ),
                child: IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {
                    Navigator.of(context).pushNamed(CartScreen.routeName);
                  },
                ))
          ],
        ),
        body: ProductGrid(_showOnlyFavourites));
  }
}
