import 'package:flutter/material.dart';
import 'card.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scrum Poker',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: MyHomePageState(),
    );
  }
}

class MyHomePageState extends StatelessWidget {
  final values = [
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
                        builder: (context) => FullCardRoute(value: v)));
              },
            ));
          }).toList(),
        ));
      }).toList()),
    );
  }
}

class FullCardRoute extends StatelessWidget {
  FullCardRoute({this.value});

  final String value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GestureDetector(
        child: PokerCard(value: value),
        onTap: () {
          Navigator.pop(context);
        }));
  }
}
