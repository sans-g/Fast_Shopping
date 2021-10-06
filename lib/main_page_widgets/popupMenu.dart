import 'package:flutter/material.dart';
class CustomPopupMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
        icon: Icon(
          Icons.more_vert,
          color: Colors.black,
        ),
        itemBuilder: (context) => [
          PopupMenuItem(
              value: 'donate',
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.attach_money,
                    color: Colors.black,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text('Donate'),
                  ),
                ],
              )),
          PopupMenuItem(
            value: 'Licences',
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.info_outline,
                  color: Colors.black,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text("Licences"),
                )
              ],
            ),
          )
        ],
        onSelected: (index) {
          if (index == 'donate') {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text("U can donate ur money here"),
                ));
          } else if (index == 'licenses') {
            showDialog(
                context: context,
                builder: (context) => SimpleDialog(
                  title: Text("This Page Includes Licences"),
                ));
          }
        });
  }
}
