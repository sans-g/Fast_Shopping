import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/Provider/products_provider.dart';
import 'package:shopapp/screens/Edit&AddingScreen.dart';
import 'package:shopapp/widgets/UserItem.dart';
import 'package:shopapp/widgets/appDrawer.dart';

class UserProductScreen extends StatelessWidget {
  static const routename="/User-Product";
  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<Products>(context);
    return Scaffold(drawer: AppDrawer(),
      appBar: AppBar(
        title: Text("Your Products"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, EditProductScreen.routename);
            },
          )
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, i) => Column(
          children: <Widget>[
            UserItem(  id: userData.items[i].id ,
              title: userData.items[i].title,
              imageurl: userData.items[i].image,
            ),
          Divider()],
        ),
        itemCount: userData.items.length,
      ),
    );
  }
}
