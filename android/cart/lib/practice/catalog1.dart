import 'package:flutter/material.dart';
import './cart1.dart';

class Catalog1 extends StatelessWidget {
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
                    Navigator.pushNamed(context, "/cart");
                  },
                ),
              )
            ],
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
                      (context, index) => CatalogList1()))
        ],
      ),
    );
  }
}
class CatalogList1 extends StatefulWidget {
  @override
  _CatalogList1State createState() => _CatalogList1State();
}

class _CatalogList1State extends State<CatalogList1> {
  @override
  Widget build(BuildContext context) {
    String name = "Code smell";

    return Row(children: <Widget>[
      Text(name),FlatButton(child: Text("ADD"),onPressed: (){
    setState(() {
    });
      },)
    ],) ;
  }
}
