import 'package:cart/screens/cart.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:cart/models/catalogmodel.dart';
import 'package:cart/models/cartmodel.dart';


class Catalog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            floating: true,
            backgroundColor: Colors.yellow,
            elevation: 50,
            title: Center(
              child: Text(
                "Catalog",
                style:
                    TextStyle(fontWeight: FontWeight.w900, color: Colors.black),
              ),
            ),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  icon: Icon(
                    Icons.shopping_cart,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Cart()));
                  },
                ),
              )
            ],
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
                  (context, index) => CatalogList(index)))
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class CatalogList extends StatelessWidget {
  int index;
  CatalogList(this.index, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var catalog = Provider.of<CatalogModel>(context);
    var item = catalog.getByPosition(index);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                color: item.color,
                height: 36,
                width: 36,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 200,
                  height: 30,
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.only(right: 40.0),
                    child: Text(
                      item.name,
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                    ),
                  )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: _AddButton(item: item)
              )
            ],
          )
        ],
      ),
    );
  }
}
class _AddButton extends StatelessWidget {
  final Item item;

  const _AddButton({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<CartModel>(context);

    return FlatButton(
      onPressed: cart.items.contains(item) ? null : () => cart.add(item),
      splashColor: Theme.of(context).primaryColor,
      child: cart.items.contains(item)
          ? Icon(Icons.check, semanticLabel: 'ADDED')
          : Text('ADD'),
    );
  }
}