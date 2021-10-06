import 'package:flutter/material.dart';
import 'package:practice_time/operations.dart';

// ignore: must_be_immutable
class EditDialogBox extends StatelessWidget {
  TextEditingController controller1=TextEditingController();
  EditDialogBox({this.controller1,this.id});
  String id;

  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 10,
      contentPadding: EdgeInsets.only(left: 25),
      title: Text(
        "Rename shopping list",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      ),
      content: TextField(
        controller: controller1,

        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText:
                'Write new shopping list name here...                   '),
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
          child: RaisedButton(
            onPressed: () {
                editListName(id,controller1.text);
              Navigator.pop(context);
            },
            child: Text("RENAME"),
            color: Colors.yellow[100],
          ),
        )
      ],
    );
  }
}
