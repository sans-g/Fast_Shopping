import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/widgets/ProductItem.dart';
import '../Provider/products_provider.dart';

// ignore: must_be_immutable
class ProductGrid extends StatelessWidget {
  bool showFavs;
  ProductGrid(this.showFavs);
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = showFavs==true?productsData.Favouroites:productsData.items;
    return GridView.builder(
        itemCount: products.length,
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 1.5),
        itemBuilder: (context, index) => ChangeNotifierProvider.value(
              value: products[index],
              child: ProductItem(
               // id: products[index].id,
                //title: products[index].title,
               // imageurl: products[index].image,
              ),
            ));
  }
}
