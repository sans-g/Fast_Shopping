import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/Provider/products_provider.dart';
import 'package:shopapp/screens/Edit&AddingScreen.dart';

class UserItem extends StatelessWidget {
  String id;
  String title;
  String imageurl;
  UserItem({this.title, this.imageurl,this.id});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageurl),
      ),
      trailing: Container(width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              color: Theme.of(context).primaryColor,onPressed: (){
                Navigator.pushNamed(context, EditProductScreen.routename,arguments: id);
            },
            ),
            IconButton(
              icon: Icon(Icons.delete),
              color: Theme.of(context).errorColor,onPressed: (){
                Provider.of<Products>(context,listen: false).deleteProduct(id);
            },
            )
          ],
        ),
      ),
    );
  }
}
