import 'package:flutter/widgets.dart';
import 'package:scrum_poker/widgets/card.dart';
import 'package:scrum_poker/widgets/screen.dart';
import 'package:wakelock/wakelock.dart';

class CardScreen extends StatelessWidget {
  CardScreen() {
    Wakelock.enable();
  }

  @override
  Widget build(BuildContext context) {
    final String arg = ModalRoute.of(context).settings.arguments;

    return Screen(
      child: GestureDetector(
        child: PokerCard(value: arg),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
