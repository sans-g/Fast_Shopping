import 'package:flutter/material.dart';
import 'package:practice_time/archived/archived.dart';
import 'package:practice_time/current_widgets/current.dart';

class NoListSelected extends StatefulWidget {
  @override
  _NoListSelectedState createState() => _NoListSelectedState();
}

class _NoListSelectedState extends State<NoListSelected> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(125),
          child: AppBar(iconTheme: IconThemeData(color: Colors.black),
            backgroundColor: Colors.yellow[600],
            title: Text(
              "Shopping lists",
              style: TextStyle(color: Colors.black, fontSize: 22),
            ),
            bottom: TabBar(
              tabs: <Widget>[
                Column(
                  children: <Widget>[
                    Icon(
                      Icons.shopping_cart,
                      color: Colors.black,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Current",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    )
                  ],
                ),

                Column(
                  children: <Widget>[
                    Icon(
                      Icons.archive,
                      color: Colors.black,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Archived",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(children: [
          Current(),
          Archived(),
        ]),
      ),
    );
  }
}
