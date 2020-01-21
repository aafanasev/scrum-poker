import 'package:flutter/widgets.dart';
import 'package:scrum_poker/screens/card_screen.dart';
import 'package:scrum_poker/screens/home_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WidgetsApp(
      color: const Color(0xFF000000),
      onGenerateRoute: (settings) => PageRouteBuilder(
        settings: settings,
        pageBuilder: (context, animation, secondaryAnimation) {
          switch (settings.name) {
            case '/':
              return HomeScreen();
            case '/card':
              return CardScreen();
            default:
              return null;
          }
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    );
  }
}
