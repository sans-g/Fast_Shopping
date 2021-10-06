import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practice_time/operations.dart';

// ignore: must_be_immutable
class DeletingShoppingList extends StatelessWidget {
  DocumentSnapshot doc;
  String id;
  DeletingShoppingList({this.id, this.doc});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 10,
      contentPadding: EdgeInsets.only(left: 25),
      title: Text(
        "Deleting Shopping list",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      ),
      content: RichText(
        text: TextSpan(children: [
          TextSpan(text: "Do you really want to delete ",style: TextStyle(color: Colors.black)),
          TextSpan(text: id+"\n",style: TextStyle(color: Colors.black,fontStyle: FontStyle.italic)),
          TextSpan(text: "shopping list?\nThis operation cannot be undone.",style: TextStyle(color: Colors.black))
        ]),
      ),
      titlePadding: EdgeInsets.all(18),
      actions: <Widget>[
        Container(
          height: 36,
          width: 87,
          child: RaisedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            elevation: 0,
            child: Text("CANCEL"),
            color: Colors.white,
          ),
        ),
        Container(
          width: 87,
          height: 36,
          child: RaisedButton(color: Colors.white,elevation: 0,
            onPressed: () {
              deleteProduct(doc);
              Navigator.pop(context);
            },
            child: Text("DELETE",style: TextStyle(color: Colors.red),),
          ),
        )
      ],
    );

  }
}
