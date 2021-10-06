import 'package:flutter/material.dart';
class Current0 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double bottom = MediaQuery.of(context).size.height - 550;

    return Container(alignment: Alignment.topRight,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center,children: [
        Center(
            child: Image(
              image: AssetImage("assets/1.jpg"),
            )),

           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Text(
                "There are no current lists,create one!",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
           ),



    ]));

  }
}
