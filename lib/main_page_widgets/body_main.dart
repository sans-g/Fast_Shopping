import 'package:flutter/material.dart';
import 'package:practice_time/main_page_widgets/arrow.dart';
import 'package:practice_time/main_page_widgets/no_list_selected.dart';


class Body0 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(alignment: Alignment.bottomLeft, children: [
        Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "No list is selected , create one.",
                style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),
              ),
            )),
        Padding(
          padding: const EdgeInsets.only(top:8.0),
          child: Arrow(),
        ),

        GestureDetector(onTap: (){

            Navigator.push(context,
                MaterialPageRoute(builder: (context) => NoListSelected()));

        },
          child: Container(
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child:  Icon(
                      Icons.list,
                      size: 28,

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "No list selected",
                    style:
                    TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
                  ),
                ),

              ],
            ),
            decoration: BoxDecoration(color: Colors.yellow[600]),
            height: 58,
            width: double.infinity,
          ),
        ),

      ]),
    );
  }
}
