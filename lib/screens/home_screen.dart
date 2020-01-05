import 'package:flutter/widgets.dart';
import 'package:scrum_poker/widgets/card.dart';
import 'package:scrum_poker/widgets/screen.dart';

const VALUES = [
  ["0", "1", "2"],
  ["3", "5", "8"],
  ["13", "21", "∞"]
];

class HomeScreen extends StatelessWidget {
  Widget _createRow(BuildContext context, List<String> rowValues) {
    return Expanded(
      child: Row(
        children: rowValues
            .map((String value) => _createItem(context, value))
            .toList(),
      ),
    );
  }

  Widget _createItem(BuildContext context, String value) {
    return Expanded(
      child: GestureDetector(
        child: PokerCard(value: value),
        onTap: () {
          Navigator.pushNamed(context, "/card", arguments: value);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Screen(
      child: Column(
        children: VALUES
            .map((List<String> rowValues) => _createRow(context, rowValues))
            .toList(),
      ),
    );
  }
}
