import 'package:flutter/widgets.dart';
import 'package:scrum_poker/screens/card_screen.dart';
import 'package:scrum_poker/screens/home_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WidgetsApp(
      color: Color(0xFF000000),
      routes: {
        '/': (context) => HomeScreen(),
        '/card': (context) => CardScreen(),
      },
      pageRouteBuilder: <Void>(settings, widgetBuilder) {
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return widgetBuilder(context);
          },
        );
      },
    );
  }
}
