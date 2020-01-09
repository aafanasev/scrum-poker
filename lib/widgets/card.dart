import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:scrum_poker/state/theme.dart';

class PokerCard extends StatelessWidget {
  PokerCard({this.value});

  final String value;

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
      builder: (context, theme, _) {
        Color bgColor;
        Color textColor;

        if (theme.isDarkMode) {
          bgColor = Color(0xFF1d1d1d);
          textColor = Color(0xFFFFFFFF);
        } else {
          bgColor = Color(0xFFFFFFFF);
          textColor = Color(0xFF1d1d1d);
        }

        return _cardWidget(bgColor, textColor);
      },
    );
  }

  Widget _cardWidget(Color bgColor, Color textColor) {
    return AnimatedContainer(
      key: Key("card_$value"),
      duration: const Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
      decoration: BoxDecoration(
        color: bgColor,
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
                    child: Text(
                      value,
                      style: TextStyle(
                        color: textColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Text(
                value,
                style: TextStyle(
                  color: textColor,
                ),
              ),
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
                  child: Text(
                    value,
                    style: TextStyle(
                      color: textColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
