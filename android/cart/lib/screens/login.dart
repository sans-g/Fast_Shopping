import 'package:cart/screens/catalog.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: SizedBox(
            height: 400,
            width: 300,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("WELCOME",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w900),),
                ),
                TextFormField(decoration: InputDecoration(hintText: "USERNAME"),),
                TextFormField(decoration: InputDecoration(hintText: "Password"),),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: FlatButton(
                    child: Text("ENTER"),
                    color: Colors.yellow,onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Catalog()));
                  },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
