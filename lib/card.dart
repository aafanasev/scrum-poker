import 'package:flutter/material.dart';

class PokerCard extends StatelessWidget {
  PokerCard({this.value});

  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.black26,
          borderRadius: const BorderRadius.all(const Radius.circular(10))),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(4),
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: RotatedBox(
              quarterTurns: 2,
              child: Text(value),
            ),
          ),
          Expanded(
              child: Center(
                  child: Text(
            value,
            textScaleFactor: 4,
          ))),
          Align(
            alignment: Alignment.topRight,
            child: Text(value),
          )
        ],
      ),
    );
  }
}
