import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/Provider/Cart.dart';
import 'package:shopapp/Provider/product.dart';
import 'package:shopapp/screens/ProductDetailScreen.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: GridTile(
        footer: GridTileBar(
          title: Center(child: Text(product.title)),
          backgroundColor: Colors.black38,
          leading: Consumer<Product>(
            builder: (context, product, child) => IconButton(
              onPressed: () {
                product.toggleFavourite();
              },
              icon: Icon(
                product.isFavourite ? Icons.favorite : Icons.favorite_border,
                color: Theme.of(context).accentColor,
              ),
            ),
          ),
          trailing: IconButton(
            onPressed: () {
              cart.addItem(product.id, product.title, product.price, 1);
              Scaffold.of(context).hideCurrentSnackBar();
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text(
                  "Added an Item",
                  textAlign: TextAlign.center,
                ),
                duration: Duration(seconds: 2),
                action: SnackBarAction(
                  label: "UNDO",
                  onPressed: () {
                    cart.removeSingleItem(product.id);
                  },
                ),
              ));
            },
            icon: Icon(
              Icons.shopping_cart,
              color: Theme.of(context).accentColor,
            ),
          ),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(ProductDetailScreen.routeName,
                arguments: product.id);
          },
          child: Image.network(
            product.image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
