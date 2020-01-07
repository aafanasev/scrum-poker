import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:scrum_poker/state/theme.dart';

class Screen extends StatelessWidget {
  Screen({this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
      builder: (context, theme, child) {
        Color bgColor;

        if (theme.isDarkMode) {
          bgColor = Color(0xFF121212);
        } else {
          bgColor = Color(0xFFCCCCCC);
        }

        return _screenWidget(bgColor);
      },
    );
  }

  Widget _screenWidget(Color bgColor) {
    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
      color: bgColor,
      padding: EdgeInsets.all(10),
      child: SafeArea(
        child: child,
      ),
    );
  }
}
