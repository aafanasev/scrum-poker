import 'package:flutter/widgets.dart';

class PokerCard extends StatelessWidget {
  PokerCard({this.value});

  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF616161),
        borderRadius: const BorderRadius.all(const Radius.circular(10)),
      ),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(4),
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.topLeft,
              child: RotatedBox(
                quarterTurns: 2,
                child: Text(
                  value,
                  style: const TextStyle(fontSize: 24),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Text(value),
            ),
          ),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Text(
                value,
                style: const TextStyle(fontSize: 24),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
