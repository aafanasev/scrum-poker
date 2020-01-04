import 'package:flutter/material.dart';
import 'package:scrum_poker/screens/card_screen.dart';
import 'package:scrum_poker/widgets/card.dart';

class HomeScreen extends StatelessWidget {
  static final values = [
    ["0", "1", "2"],
    ["3", "5", "8"],
    ["13", "21", "∞"]
  ];

  Widget _createRow(BuildContext context, List<String> rowValues) {
    return Expanded(
        child: Row(
      children: rowValues.map((String value) {
        return _createCardItem(context, value);
      }).toList(),
    ));
  }

    Widget _createCardItem(BuildContext context, String value) {
    return Expanded(
        child: GestureDetector(
      child: PokerCard(value: value),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => CardScreen(value: value)));
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
            children: values.map((List<String> rowValues) {
      return _createRow(context, rowValues);
    }).toList()));
  }
}
