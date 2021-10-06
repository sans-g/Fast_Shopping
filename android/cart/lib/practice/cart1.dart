import 'package:flutter/material.dart';

class Cart1 extends StatelessWidget {
  String cartName;
  Cart1({this.cartName});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart', style: Theme.of(context).textTheme.headline),
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.yellow,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Text(cartName),
              ),
            ),
            Divider(height: 4, color: Colors.black),

          ],
        ),
      ),
    );
  }
}