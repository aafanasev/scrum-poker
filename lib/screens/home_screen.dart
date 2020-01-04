import 'package:flutter/material.dart';
import 'package:scrum_poker/screens/card_screen.dart';
import 'package:scrum_poker/widgets/card.dart';

class HomeScreen extends StatelessWidget {
  static final values = [
    ["0", "1", "2"],
    ["3", "5", "8"],
    ["13", "21", "∞"]
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("widget.title"),
      ),
      body: Column(
          children: values.map((List<String> row) {
        return Expanded(
            child: Row(
          children: row.map((String v) {
            return Expanded(
                child: GestureDetector(
              child: PokerCard(value: v),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CardScreen(value: v)));
              },
            ));
          }).toList(),
        ));
      }).toList()),
    );
  }
}
