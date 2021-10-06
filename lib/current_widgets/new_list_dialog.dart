import 'package:flutter/material.dart';
import 'package:practice_time/operations.dart';

// ignore: must_be_immutable
class NewListDialog extends StatelessWidget {
  final _controller = TextEditingController();
  int length;
  String name;
  String ss = "no name";
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 10,
      contentPadding: EdgeInsets.only(left: 25),
      title: Text(
        "Add new shopping list",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      ),
      content: TextField(
        controller: _controller,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Write shopping list name here...                   '),
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
              uploadingData(
                  _controller.text.isEmpty ? "no name" : _controller.text,
                  DateTime.now().toIso8601String(),
                  false);
              Navigator.pop(context);
            },
            child: Text("ADD"),
            color: Colors.yellow[100],
          ),
        )
      ],
    );
  }
}
