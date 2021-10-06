import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  final String value;
  final Widget child;
  final Color color;

  const Badge({Key key, this.color, @required this.value, @required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        child,
        Positioned(
          right: 8,
          top: 8,
          child: Container(
            padding: EdgeInsets.all(2.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: color != null ? color : Theme.of(context).accentColor),
            constraints: BoxConstraints(minWidth: 16, minHeight: 16),
            child: Text(
              value,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 10),
            ),
          ),
        )
      ],
    );
  }
}
