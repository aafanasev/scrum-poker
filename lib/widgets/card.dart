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
                child: Container(
                  height: double.infinity,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(value),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Text(value),
            ),
          ),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                height: double.infinity,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Text(value),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
