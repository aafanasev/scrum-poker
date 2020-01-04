import 'package:flutter/widgets.dart';
import 'package:scrum_poker/widgets/card.dart';

class CardScreen extends StatelessWidget {
  CardScreen({this.value});

  final String value;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GestureDetector(
            child: PokerCard(value: value),
            onTap: () {
              Navigator.pop(context);
            }));
  }
}
