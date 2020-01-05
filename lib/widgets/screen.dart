import 'package:flutter/widgets.dart';

class Screen extends StatelessWidget {
  Screen({this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF212121),
      padding: EdgeInsets.all(10),
      child: SafeArea(
        child: child,
      ),
    );
  }
}
